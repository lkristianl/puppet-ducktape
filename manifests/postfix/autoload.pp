class ducktape::postfix::autoload (
  Boolean $load_configs = true,
) {

  if $load_configs {
    # $postfix_config_defaults = hiera('ducktape::postfix::config::defaults', {})
    create_resources('postfix::config', $ducktape::postfix::configs, $ducktape::postfix::config_defaults)
  }

}
