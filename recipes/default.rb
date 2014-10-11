#
# Cookbook Name:: chamber-logmanager
# Recipe:: default
#

##
# ElasticSearch
#
# node.set['elasticsearch']['version'] = '1.3.2'
node.set['elasticsearch']['allocated_memory'] = '256m'
# node.set['elasticsearch']['plugins'] = 'marvel'
# Make sure included recipes are using correct values in attributes which are reusing the ones defined above
# node.from_file(run_context.resolve_attribute('elasticsearch', 'default'))
include_recipe 'elasticsearch::default'
# include_recipe 'elasticsearch::monit'

##
# LogStash
#
include_recipe 'chamber-logmanager::logstash'

##
# Kibana
#
include_recipe 'chamber-kibana::default'
