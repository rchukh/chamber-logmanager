name             'chamber-logstash'
maintainer       'Roman Chukh'
maintainer_email 'roman.chukh@gmail.com'
license          'Apache 2.0'
description      'Installs and configures LogStash'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'centos'

depends 'java', '~> 1.28.0'
depends 'logstash', '~> 0.9.2'

suggests 'elasticsearch', '~> 0.3.10'
suggests 'chamber-kibana', '~> 0.0.2'
