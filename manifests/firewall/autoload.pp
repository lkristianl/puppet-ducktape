class ducktape::firewall::autoload (
  Boolean $load_rules = true,
  Boolean $load_chains = true,
) {

  if $load_rules {
    $rule_defaults = lookup('ducktape::firewall::rule::defaults', {'default_value' => {}})
    $rules = lookup('ducktape::firewall::rules', {'default_value' => {}})
    if defined('::firewall_multi') and defined(Resource['::firewall_multi']) {
      create_resources('firewall_multi', $rules, $rule_defaults)
    }
    else {
      create_resources('firewall', $rules, $rule_defaults)
    }
  }
  if $load_chains {
    $chain_defaults = lookup('ducktape::firewall::chain::defaults', {'default_value' => {}})
    $chains = lookup('ducktape::firewall::chains', {'default_value' => {}})
    $chains.each |String $name, Variant[Hash,String] $params| {
      if $params != '' {
        firewallchain { $name:
          * => deep_merge($chain_defaults, $params),
        }
      }
    }
  }

}
