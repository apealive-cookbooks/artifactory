include_recipe "apt::default"
include_recipe "java::default"

package 'unzip' do
  action :install
end

ark "artifactory" do 
  url node[:artifactory_url]
  path '/opt'
  action :put
end

directory "/opt/artifactory/logs"

bash "artifactory_check" do
  code '/opt/artifactory/bin/artifactoryctl check'
  returns [0,1]
end

bash "artifactory_upstart_installation" do
  code '/opt/artifactory/bin/installService.sh'
end

# service "artifactory" do
#   action :start
# end

execute "service artifactory start"

