class ducktape::topbeat::external::monit(
  $enabled = true,
) {

  validate_bool($enabled)
  #TODO# Add more validations

  if $enabled {
    $binary = '/usr/bin/topbeat'
    monit::check::service { 'topbeat':
      matching => $binary,
      binary   => $binary,
    }
  }

}

