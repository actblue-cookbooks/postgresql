#
# Cookbook Name:: postgresql
# Attributes:: postgresql
#
# Copyright 2008-2009, Opscode, Inc.
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
case platform
when "debian"

  if platform_version.to_f == 5.0
    default[:postgresql][:version] = "8.3"
  elsif platform_version =~ /.*sid/
    default[:postgresql][:version] = "8.4"
  end

  set[:postgresql][:dir] = "/etc/postgresql/#{node[:postgresql][:version]}/main"

when "ubuntu"

  if platform_version.to_f <= 9.04
    default[:postgresql][:version] = "8.3"
  else
    default[:postgresql][:version] = "8.4"
  end

  set[:postgresql][:dir] = "/etc/postgresql/#{node[:postgresql][:version]}/main"

when "fedora"

  if platform_version.to_f <= 12
    default[:postgresql][:version] = "8.3"
  else
    default[:postgresql][:version] = "8.4"
  end

  set[:postgresql][:dir] = "/var/lib/pgsql/data"

when "redhat","centos"

  default[:postgresql][:version] = "8.4"
  set[:postgresql][:dir] = "/var/lib/pgsql/data"

when "suse"

  if platform_version.to_f <= 11.1
    default[:postgresql][:version] = "8.3"
  else
    default[:postgresql][:version] = "8.4"
  end

  set[:postgresql][:dir] = "/var/lib/pgsql/data"

else
  default[:postgresql][:version] = "8.4"
  set[:postgresql][:dir]            = "/etc/postgresql/#{node[:postgresql][:version]}/main"
end

# default to allowing no extra hosts in the pg_hba
default[:postgresql][:md5hosts] = []
default[:postgresql][:identhosts] = []
default[:postgresql][:idententries] = []

# postgresql.conf settings
# Things set to nil won't show up, and will take defaults
default[:postgresql][:listen_address] = nil
default[:postgresql][:max_connections] = 100
default[:postgresql][:tcp_keepalives_idle] = nil
default[:postgresql][:tcp_keepalives_interval] = nil
default[:postgresql][:tcp_keepalives_count] = nil
default[:postgresql][:shared_buffers] = "24MB"
default[:postgresql][:temp_buffers] = nil
default[:postgresql][:max_prepared_transactions] = nil
default[:postgresql][:work_mem] = nil
default[:postgresql][:maintenance_work_mem] = nil
default[:postgresql][:max_stack_depth] = nil
default[:postgresql][:effective_io_concurrency] = nil
default[:postgresql][:no_fsync] = false  # disable fsync? Good for development
default[:postgresql][:wal_buffers] = nil
default[:postgresql][:checkpoint_segments] = nil
default[:postgresql][:checkpoint_timeout] = nil
default[:postgresql][:checkpoint_completion_target] = nil
default[:postgresql][:checkpoint_warning] = nil
default[:postgresql][:archive_mode] = nil
default[:postgresql][:archive_command] = nil
default[:postgresql][:archive_timeout] = nil
default[:postgresql][:random_page_cost] = nil
default[:postgresql][:effective_cache_size] = nil
default[:postgresql][:log_destination] = nil
default[:postgresql][:syslog_facility] = nil
default[:postgresql][:syslog_ident] = nil
default[:postgresql][:log_min_duration_statement] = nil
default[:postgresql][:log_duration] = nil
default[:postgresql][:log_line_prefix] = '%t '
default[:postgresql][:autovacuum] = nil
default[:postgresql][:log_autovacuum_min_duration] = nil
