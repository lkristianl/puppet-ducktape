class ducktape::mysql (
  Boolean $enabled = true,
  $flavour = undef,
) {

  validate_string($flavour)

  if $enabled {
    class { '::ducktape::mysql::flavour' :
      flavour => $flavour,
    }
  }

}
