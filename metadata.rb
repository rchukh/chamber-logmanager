name             'chamber-logmanager'
maintainer       'Roman Chukh'
maintainer_email 'roman.chukh@gmail.com'
license          'Apache 2.0'
description      'Set of recipes for installing misc logging tools'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

supports 'centos'

depends 'chef-sugar', '~> 2.2'
depends 'build-essential', '~> 2.0'
