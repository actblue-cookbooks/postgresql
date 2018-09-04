apt_preference "postgresql-client-#{node['postgresql']['version']}" do
  pin          "version #{node['postgresql']['version_full']}.pgdg14.04+1"
  pin_priority '700'
end

package "postgresql-client-#{node['postgresql']['version']}" do
  version "#{node['postgresql']['version_full']}.pgdg14.04+1"
  action :install
end
