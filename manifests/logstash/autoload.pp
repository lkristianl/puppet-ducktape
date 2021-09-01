class ducktape::logstash::autoload (
  Boolean $load_configfiles  = true,
  Boolean $load_patternfiles = true,
  Boolean $load_plugins      = true,
) {

  if $load_configfiles {
    $logstash_configfile_defaults = hiera('ducktape::logstash::configfile::defaults', {})
    create_resources('logstash::configfile', hiera_hash('ducktape::logstash::configfiles', {}), $logstash_configfile_defaults)
  }

  if $load_patternfiles {
    $logstash_patternfile_defaults = hiera('ducktape::logstash::patternfile::defaults', {})
    create_resources('logstash::patternfile', hiera_hash('ducktape::logstash::patternfiles', {}), $logstash_patternfile_defaults)
  }

  if $load_plugins {
    $logstash_plugin_defaults = hiera('ducktape::logstash::plugin::defaults', {})
    create_resources('logstash::plugin', hiera_hash('ducktape::logstash::plugins', {}), $logstash_plugin_defaults)
  }

}
