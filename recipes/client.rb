package "postgresql-client-#{node['postgresql']['version']}" do
  version "#{node['postgresql']['version_full']}.pgdg14.04+1"
  options '--allow-downgrades'
  action :install
end
