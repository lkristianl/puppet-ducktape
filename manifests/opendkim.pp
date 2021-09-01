class ducktape::opendkim (
  Boolean $enabled = true,
  $port    = 8891,
) {

  if $enabled {
    include ::ducktape::opendkim::autoload

    # External
    if defined('::monit') and defined(Class['::monit']) {
      include ::ducktape::opendkim::external::monit
    }
    if defined('::postfix') and defined(Class['::postfix']) {
      include ::ducktape::opendkim::external::postfix
    }
  }

}
