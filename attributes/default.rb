include_attribute 'java'

default['java']['install_flavor'] = 'openjdk'
default['java']['openjdk_packages'] = ['openjdk-7-jre', 'openjdk-7-jdk']
default['java']['jdk_version'] = '7'

default['artifactory_url'] = 'http://dl.bintray.com/content/jfrog/artifactory/artifactory-3.0.4.zip?direct'
default['artifactory_deploy_path'] = '/opt'
