class users::default {

  group {'nathan': ensure => 'present'}

  user {'nathan':
    home       => '/home/nathan',
    ensure     => 'present',
    gid        => 'nathan',
    groups     => 'wheel',
    comment    => 'Nathan',
    password   => 'BOGUS_HASH',
    managehome => true,
    require    => Group['nathan'],
  }

  ssh_authorized_key {'nathan':
    ensure  => 'present',
    type    => 'ssh-rsa',
    key     => 'AAAAB3NzaC1yc2EAAAABIwAAAIEA4lkBZSffWOkC1CG69WlhyMjKGTdKyria/ttjjEe1ONd5AgB9x24UhMQ698x19TK4BA/Swmr0UZ0PvjSMBKJv+mZAvulCHtsUn+aZbKkSDFcMYJZn5ZovZHgQHDvv0Flx5ZW8/zj9FDujktCrxcwwZfcMhfJGcORjVpRtUA7+06U=',
    user    => 'nathan',
    require => User['nathan'],
  }
}
