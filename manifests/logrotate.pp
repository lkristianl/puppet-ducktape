class ducktape::logrotate (
  Boolean $enabled = true,
) {

  if $enabled {
    include ducktape::logrotate::autoload
  }

}
