# This Puppet manifest configures Nginx to handle high traffic

# Ensure that Nginx is installed and running
package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Update Nginx configuration to handle more concurrent connections
file { '/etc/nginx/nginx.conf':
  ensure  => file,
  source  => 'puppet:///modules/nginx/nginx.conf',
  notify  => Service['nginx'],
}

# Restart Nginx to apply new configuration
exec { 'fix--for-nginx':
  command => '/usr/sbin/nginx -s reload',
  path    => ['/usr/sbin', '/usr/bin'],
  unless  => 'test "$(curl -s -o /dev/null -w "%{http_code}" http://localhost)" = "200"',
  require => File['/etc/nginx/nginx.conf'],
}

