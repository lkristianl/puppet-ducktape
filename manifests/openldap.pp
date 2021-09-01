class ducktape::openldap (
  Boolean $enabled = true,
) {

  if $enabled {
    include ducktape::openldap::autoload

    # External checks.
    if defined('::monit') and defined(Class['::monit']) {
      include ::ducktape::openldap::external::monit
    }
  }

}
