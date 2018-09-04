name              'postgresql'
maintainer        'ActBlue Technical Services - Ops'
maintainer_email  'ops@actbluetech.com'
license           'Proprietary - All Rights Reserved'
description       'Installs and configures postgresql for clients or servers'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version           '0.13.2'
issues_url        'https://github.com/actblue/chef/issues'
source_url        'https://github.com/actblue/chef'
chef_version      '~> 12' if respond_to?(:chef_version)

supports 'ubuntu'
