# This Puppet manifest configures system limits for file descriptors

# Set the file descriptor limit for the holberton user
file { '/etc/security/limits.conf':
  ensure  => file,
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  content => "holberton soft nofile 1024\nholberton hard nofile 4096\n",
  notify  => Exec['reload-limit'],
}

# Ensure PAM limits module is loaded
file { '/etc/pam.d/common-session':
  ensure  => file,
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  content => "session required pam_limits.so\n",
  notify  => Exec['reload-limit'],
}

file { '/etc/pam.d/common-session-noninteractive':
  ensure  => file,
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  content => "session required pam_limits.so\n",
  notify  => Exec['reload-limit'],
}

# Reload the limits configuration
exec { 'reload-limit':
  command => 'sysctl -p',
  path    => ['/usr/sbin', '/usr/bin'],
  refreshonly => true,
}

