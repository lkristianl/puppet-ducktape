class ducktape::postfix::autoload (
  Boolean $load_configs = true,
) {

  if $load_configs {
    $postfix_config_defaults = hiera('ducktape::postfix::config::defaults', {})
    create_resources('postfix::config', hiera_hash('ducktape::postfix::configs', {}), $postfix_config_defaults)
  }

}
