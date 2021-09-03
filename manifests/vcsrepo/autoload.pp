class ducktape::vcsrepo::autoload (
  Boolean $autoload = true,
) {

  if $autoload {
    create_resources('vcsrepo', $ducktape::vcsrepo::vcsrepos', $ducktape::vcsrepo::defaults)
  }

}
