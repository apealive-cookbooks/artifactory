include_recipe "runit::default"
include_recipe "apt::default"
include_recipe "java::default"


package 'unzip' do
  action :install
end

ark "artifactory" do
  url node[:artifactory_url]
  path node[:artifactory_deploy_path]
  action :install
end
