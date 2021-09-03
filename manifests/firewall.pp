class ducktape::firewall (
  Boolean $enabled = true,
  Boolean $purge_firewall = false,
  Boolean $purge_firewallchain = false,
) {

  if $enabled {
    resources { 'firewall':
      purge => $purge_firewall,
    }

    resources { 'firewallchain':
      purge => $purge_firewallchain,
    }

    include ducktape::firewall::autoload
  }

}
