# Localhost root
default['chamber']['nginx']['dir']['root']         = '/srv/www/localhost/html'
default['chamber']['nginx']['dir']['locations']    = ::File.join(node['nginx']['dir'], 'locations')
default['chamber']['nginx']['dir']['upstreams']    = ::File.join(node['nginx']['dir'], 'upstreams')

# Kibana elasticsearch nginx proxy
# TODO: Move Kibana path to separate attribute
default['kibana']['config']['elasticsearch'] = node['kibana']['config']['elasticsearch'] + '+"/kibana"'
