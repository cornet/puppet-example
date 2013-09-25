define nginx::vhost($ip = '*', $port = '80') {
  File {
    require => Class['nginx::config'],
    notify  => Class['nginx::service'],
  }

  file {"/etc/nginx/conf.d/${name}.conf":
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nginx/vhost.erb'),
  }

  file {"/var/www/vhosts/${name}":
    ensure => 'directory',
    owner  => 'nginx',
    group  => 'nginx',
    mode   => '0755',
  }
}
