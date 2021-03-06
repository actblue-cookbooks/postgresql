# a generic archive propegation script. No real harm in dropping it
# everywhere.
template '/usr/local/sbin/archive_command.sh' do
  source 'archive_command.sh.erb'
  owner 'root'
  group 'root'
  mode 0755
end

# Include the right "family" recipe for installing the server
# since they do things slightly differently.

node.normal['postgresql']['dir'] = "/etc/postgresql/#{node['postgresql']['version']}/main"

include_recipe 'postgresql::client'

apt_preference "postgresql-#{node['postgresql']['version']}" do
  pin          "version #{node['postgresql']['version_full']}.pgdg14.04+1"
  pin_priority '700'
end

package "postgresql-#{node['postgresql']['version']}" do
  version "#{node['postgresql']['version_full']}.pgdg14.04+1"
  action :install
end

apt_preference "postgresql-contrib-#{node['postgresql']['version']}" do
  pin          "version #{node['postgresql']['version_full']}.pgdg14.04+1"
  pin_priority '700'
end

package "postgresql-contrib-#{node['postgresql']['version']}" do
  version "#{node['postgresql']['version_full']}.pgdg14.04+1"
  action :install
end

apt_preference 'postgresql-plperl-9.6' do
  pin          "version #{node['postgresql']['version_full']}.pgdg14.04+1"
  pin_priority '700'
end

package 'postgresql-plperl-9.6' do
  version "#{node['postgresql']['version_full']}.pgdg14.04+1"
  action :install
end

service 'postgresql' do
  service_name 'postgresql'
  supports restart: true, status: true, reload: true
  action :nothing
end

template "#{node['postgresql']['dir']}/pg_hba.conf" do
  source 'debian.pg_hba.conf.erb'
  owner 'postgres'
  group 'postgres'
  mode '0600'
  notifies :reload, 'service[postgresql]'
end

template "#{node['postgresql']['dir']}/postgresql.conf" do
  source 'debian.postgresql.conf.erb'
  owner 'postgres'
  group 'postgres'
  mode '0600'
  notifies :reload, 'service[postgresql]'
  # notifies :restart, 'service[postgresql]'
end

template "#{node['postgresql']['dir']}/pg_ident.conf" do
  source 'pg_ident.conf.erb'
  owner 'postgres'
  group 'postgres'
  mode '0640'
  # notifies :restart, 'service[postgresql]'
end

# set up some replication stuff. Since this is just directories and
# ssh keys, it can exist everywhere.
directory node['postgresql']['wal']['incomingdir'] do
  recursive true
  owner 'postgres'
  group 'postgres'
  mode '0750'
end

template '/usr/local/sbin/restrict-rsync.sh' do
  source 'restrict-rsync.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end
