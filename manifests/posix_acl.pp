class ducktape::posix_acl (
  Boolean $enabled = true,
  Hash $defaults = {},
  Hash $posix_acls = {},
) {

  if $enabled {

    require ::ducktape::vcsrepo::autoload

  }

}
