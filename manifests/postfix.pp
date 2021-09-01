class ducktape::postfix(
  Boolean $enabled = true,
) {

  if $enabled {
    include ducktape::postfix::autoload

    # External checks.
    if defined('::monit') and defined(Class['::monit']) {
      include ::ducktape::postfix::external::monit
    }
  }

}
