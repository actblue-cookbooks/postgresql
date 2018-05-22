package "postgresql-client-#{node['postgresql']['version']}" do
  version "#{node['postgresql']['version_full']}-2.pgdg14.04+1"
  action :install
end
