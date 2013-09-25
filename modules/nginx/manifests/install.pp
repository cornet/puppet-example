class nginx::install {
  package {'nginx':
    # This could also be 'latest' or a specific version. e.g. '0.8.55'
    ensure => 'installed',
  }
}
