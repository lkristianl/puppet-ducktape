class ducktape::vcsrepo (
  Boolean $enabled = true,
) {

  if $enabled {

    $vcsrepo_defaults = hiera('ducktape::vcsrepo::defaults', {})
    create_resources('vcsrepo', hiera_hash('ducktape::vcsrepos', {}), $vcsrepo_defaults)

  }

}
