class nginx::config {
  # Main nginx config
  file {'/etc/nginx/nginx.conf':
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/nginx/nginx.conf',
  }

  # This directory is managed under puppet.
  # Any files or directories in this directory
  # and not managed by puppet are removed.
  file {'/etc/nginx/conf.d/':
    ensure  => 'directory',
    purge   => true,
    recurse => true,
  }

  # Create directories to hold vhosts
  file {['/var/www', '/var/www/vhosts']:
    ensure => 'directory',
    owner  => 'nginx',
    group  => 'nginx',
    mode   => '0755',
  }
}
