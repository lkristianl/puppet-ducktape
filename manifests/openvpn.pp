class ducktape::openvpn (
  Boolean $enabled  = true,
) {

  if $enabled {
    include ::ducktape::openvpn::autoload

    # External checks.
    if defined('::monit') and defined(Class['::monit']) {
      #TODO# BROKEN, pidfile depends on defines, cannotuse service check include ::ducktape::openvpn::external::monit
    }
  }

}
