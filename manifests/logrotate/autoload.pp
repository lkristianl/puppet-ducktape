class ducktape::logrotate::autoload (
  Boolean $load_rules = true,
) {

  if $load_rules {
    $logrotate_rule_defaults = hiera('ducktape::logrotate::rule::defaults', {})
    create_resources('logrotate::rule', hiera_hash('ducktape::logrotate::rules', {}), $logrotate_rule_defaults)
  }

}
