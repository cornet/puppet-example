node 'puppet.test' {
  include base

  include nginx
  nginx::vhost {'test':}

  nginx::vhost {'local-test':
    ip => '127.0.0.1',
  }

  nginx::vhost {'port-test':
    ip   => '127.0.0.1',
    port => '81',
  }
}
