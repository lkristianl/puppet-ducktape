class ducktape::rabbitmq (
  Boolean $enabled = true,
) {

  if $enabled {
    include ducktape::rabbitmq::autoload

    # External configs.
    if defined('::munin::node') and defined(Class['::munin::node']) {
      include ::ducktape::rabbitmq::external::munin_node_plugin
    }
    if defined('::monit') and defined(Class['::monit']) {
      include ::ducktape::rabbitmq::external::monit
    }
  }

}
