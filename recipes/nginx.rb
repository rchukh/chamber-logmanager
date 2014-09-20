# TODO: Move to a separate wrapper library cookbook
include_recipe 'nginx::default'

if !node['nginx']['default_site_enabled'] && (node['platform_family'] == 'rhel' || node['platform_family'] == 'fedora')
  %w(default.conf example_ssl.conf).each do |config|
    file "#{node['nginx']['dir']}/conf.d/#{config}" do
      action :delete
    end
  end
end

node['chamber']['nginx']['dir'].each do |_var, path|
  directory path do
    mode '0755'
    owner node['nginx']['user']
    group node['nginx']['group']
    action :create
    recursive true
  end
end

template "#{node['nginx']['dir']}/sites-available/localhost" do
  source 'nginx.default.conf.erb'
  notifies :reload, 'service[nginx]'
end

nginx_site 'localhost'
