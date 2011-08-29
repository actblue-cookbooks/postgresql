#/postgresql.conf.
# Cookbook Name:: postgresql
# Recipe:: server
#
# Copyright 2009-2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "postgresql::client"

case node[:postgresql][:version]
when "8.3"
  node.default[:postgresql][:ssl] = "off"
when "8.4"
  node.default[:postgresql][:ssl] = "true"
when "9.0"
  node.default[:postgresql][:ssl] = "true"
  if( node[:platform] == "ubuntu" and node[:lsb][:codename] == "lucid")
    # this ppa is from the postgres mainter. It should be okay to trust
    apt_repository "ppa-postgresql-backports" do
      uri "http://ppa.launchpad.net/pitti/postgresql/ubuntu"
      key "8683D8A2"
      keyserver "keyserver.ubuntu.com"
      distribution node[:lsb][:codename]
      components ["main"]
      action :add
    end
  else
    Chef::Log.error("postgresql 9.0 only supported on ubuntu lucid")
  end
end

package "postgresql-#{node[:postgresql][:version]}"

service "postgresql" do
  service_name "postgresql"
  supports :restart => true, :status => true, :reload => true
  action :nothing
end

template "#{node[:postgresql][:dir]}/pg_hba.conf" do
  source "debian.pg_hba.conf.erb"
  owner "postgres"
  group "postgres"
  mode 0600
  notifies :reload, resources(:service => "postgresql")
end

template "#{node[:postgresql][:dir]}/postgresql.conf" do
  source "debian.postgresql.conf.erb"
  owner "postgres"
  group "postgres"
  mode 0600
  notifies :restart, resources(:service => "postgresql")
end

template "#{node[:postgresql][:dir]}/pg_ident.conf" do
  source "pg_ident.conf.erb"
  owner "postgres"
  group "postgres"
  mode 0640
  notifies :restart, resources(:service => "postgresql")
end
