#
# Cookbook Name:: chamber-logmanager
# Recipe:: kibana
#

## DO NOT handle webserver configuration
## node.set['kibana']['webserver'] = nil
## node.set['kibana']['user'] = node['nginx']['user']
## include_recipe 'kibana::install'
#################
# Workaround for excluding default 

kibana_install 'kibana' do
  user          node['nginx']['user']
  group         node['nginx']['group']
  install_dir   node['kibana']['install_dir']
  install_type  node['kibana']['install_type']
  action :create
end

template "#{node['kibana']['install_dir']}/current/config.js" do
  source node['kibana']['config_template']
  cookbook node['kibana']['config_cookbook']
  mode '0750'
  user node['nginx']['user']
end

link "#{node['kibana']['install_dir']}/current/app/dashboards/default.json" do
  to 'logstash.json'
  only_if { !File.symlink?("#{node['kibana']['install_dir']}/current/app/dashboards/default.json") }
end

#################

link "#{node['chamber']['nginx']['dir']['root']}/kibana" do
  to "#{node['kibana']['install_dir']}/current"
end

template "#{node['chamber']['nginx']['dir']['locations']}/kibana.conf" do
  source 'nginx.kibana.conf.erb'
  notifies :reload, 'service[nginx]'
end
