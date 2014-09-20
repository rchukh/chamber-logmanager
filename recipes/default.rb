#
# Cookbook Name:: chamber-logmanager
# Recipe:: default
#
include_recipe 'chamber-logmanager::nginx'
include_recipe 'chamber-logmanager::elasticsearch'
include_recipe 'chamber-logmanager::logstash'
include_recipe 'chamber-logmanager::kibana'
