class ducktape::ldap (
  Boolean $enabled = true,
) {

  if $enabled {
    include ducktape::ldap::autoload
  }

}
