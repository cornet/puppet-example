class nginx {
  # Include the sub classes
  include nginx::install, nginx::config, nginx::service

  # Define dependencies:
  # * Install should run first
  # * Config should run next
  # * ... and should trigger Service on change
  #
  # This means nginx will be reloaded on any config changes
  Class['nginx::install'] -> Class['nginx::config'] ~> Class['nginx::service']
}
