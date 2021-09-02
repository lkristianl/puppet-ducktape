class ducktape::vcsrepo (
  Boolean $enabled = true,
  Hash $defaults = {},
  Hash $vcsrepos = {},
) {

  if $enabled {

    require ::ducktape::vcsrepo::autoload

  }

}
