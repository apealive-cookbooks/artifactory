name             "artifactory"
maintainer       "Jack Viers"
maintainer_email "jack.viers@banno.com"
license          "Apache v2.0"
description      "Sets up open-source artifactory"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "0.1.0"

depends "runit"
depends "ark"
depends "apt"
depends "java", "~> 1.16"
