# Artifactory Chef Cookbook

This cookbook installs the open source (Artifactory)[http://www.jfrog.com/home/v_artifactory_opensource_overview] and configures (runit)[http://smarden.org/runit/] to monitor and start it. It has only been tested on Ubuntu 12.04 (Precise).

# Requirements

None really.

# Usage

Add the `artifcatory::default` recipe to a node's runlist and it will then install and run the artifactory service. 

# Attributes

 - `node['artifactory']['version']`: what version of artifcatory do you want installed. Defaults to `3.1.0`
 - `node['artifactory']['user']`: what user should artifactory run as. Defaults to `artifactory`
 - `node['artifactory']['dir']`: what directory should artifactory be installed in. Defaults to `/opt/artifactory`
 - `node['artifactory']['java_opts']`: what Java options should be supplied to the underlying tomcat instance. Defaults to `-server -Xms512m -Xmx2g -Xss256k -XX:PermSize=128m -XX:MaxPermSize=128m -XX:+UseG1GC`

# Recipes

 - `artifactory::default`

# Author

Author:: Banno Programmers
