class ducktape::letsencrypt (
  Boolean $enabled = true,
) {

  if $enabled {
    include ducktape::letsencrypt::autoload
  }

}
