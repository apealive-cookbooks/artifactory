include_recipe 'runit::default'
include_recipe 'apt::default'
include_recipe 'java::default'
 
user node['artifactory']['user'] do
  home node['artifactory']['dir']
end
 
package 'unzip'
 
ark 'artifactory' do
  action :put
  url node['artifactory']['url']
  path File.dirname(node['artifactory']['dir'])
  owner node['artifactory']['user']
  group node['artifactory']['user']
end

runit_service 'artifactory' do
  default_logger true
end
