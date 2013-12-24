include_recipe 'runit::default'
include_recipe 'apt::default'
include_recipe 'java::default'
 
user 'artifactory' do
  home '/opt/artifactory'
end
 
package 'unzip'
 
ark 'artifactory' do
  url node[:artifactory_url]
  path '/opt'
  action :put
  owner 'artifactory'
  group 'artifactory'
end
 
directory '/opt/artifactory/logs' do
  owner 'artifactory'
  group 'artifactory'
end

directory '/opt/artifactory/tomcat/logs' do
  owner 'artifactory'
  group 'artifactory'
end

runit_service 'artifactory' do
  log false
end
