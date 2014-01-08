include_attribute 'java'

default['java']['install_flavor'] = 'openjdk'
default['java']['openjdk_packages'] = ['openjdk-7-jre-headless', 'openjdk-7-jdk']
default['java']['jdk_version'] = '7'

default['artifactory']['version'] = '3.0.4'
default['artifactory']['user'] = 'artifactory'
default['artifactory']['dir'] = '/opt/artifactory'
default['artifactory']['java_options'] = '-server -Xms512m -Xmx2g -Xss256k -XX:PermSize=128m -XX:MaxPermSize=128m -XX:+UseG1GC'

node.set['artifactory']['url'] = "http://dl.bintray.com/content/jfrog/artifactory/artifactory-#{node['artifactory']['version']}.zip?direct"
