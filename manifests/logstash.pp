class ducktape::logstash (
  Boolean $enabled = true,
) {

  if $enabled {
    include ducktape::logstash::autoload

    # External configs.
    if defined('::monit') and defined(Class['::monit']) {
      include ::ducktape::logstash::external::monit
    }
  }

}
