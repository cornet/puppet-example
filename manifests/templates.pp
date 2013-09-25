# *class base*
#
# Base template to install common packages
#
class base {

  include users::default
  package {
    'htop':        ensure => 'latest';
    'vim-minimal': ensure => 'latest';
    'git':         ensure => 'latest';
    'tcpdump':     ensure => 'latest';
  }
}
