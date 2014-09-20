#
# Cookbook Name:: chamber-logmanager
# Recipe:: elasticsearch
#

# node.set['elasticsearch']['version'] = '1.3.2'
node.set['elasticsearch']['allocated_memory'] = '256m'
# node.set['elasticsearch']['plugins'] = 'marvel'

# Make sure included recipes are using correct values in attributes which are reusing the ones defined above
# node.from_file(run_context.resolve_attribute('elasticsearch', 'default'))

include_recipe 'elasticsearch::default'
# include_recipe 'elasticsearch::monit'

template "#{node['chamber']['nginx']['dir']['upstreams']}/elasticsearch.conf" do
  source 'es.upstream.conf.erb'
  # notifies :reload, 'service[nginx]'
  variables(
    es_server: '127.0.0.1',
    es_port: '9200'
  )
end
