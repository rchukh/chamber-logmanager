#
# Cookbook Name:: chamber-logmanager
# Recipe:: logstash
#

chef_gem 'chef-rewind'
require 'chef/rewind'

include_recipe 'logstash::server'

rewind 'logstash_config[server]' do
  variables(
    elasticsearch_embedded: false
  )
end
