#
# Cookbook Name:: chamber-logstash
# Recipe:: server
#
name = 'server'

if node['logstash']['instance'][name].nil?
  Chef::Application.fatal!("attribute hash node['logstash']['instance']['#{name}'] must exist.")
end

if node['logstash']['instance'][name]['config_templates'].nil?
  Chef::Application.fatal!("attribute hash node['logstash']['instance']['#{name}']['config_templates'] must exist.")
end

# These should all default correctly.
logstash_instance name do
  action :create
end

logstash_service name do
  action [:enable]
end

logstash_config name do
  templates node['logstash']['instance'][name]['config_templates']
  action [:create]
  #  NOTE: See service workaround in the end of the file
  #  notifies :restart, "logstash_service[#{name}]"
end

logstash_plugins 'contrib' do
  instance name
  action [:create]
end

logstash_pattern name do
  action [:create]
end

logstash_curator name do
  action [:create]
end

# FIX: Workaround service restart until https://github.com/lusis/chef-logstash/issues/330 is fixed.
service "logstash_#{name}" do
  action :restart
end
