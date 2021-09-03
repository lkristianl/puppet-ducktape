class ducktape::systemd::autoload (
  Boolean $load_dropin_files = true,
  Boolean $load_unit_files = true,
  Boolean $load_timers = true,
  Boolean $load_networks = true,
) {

  if $load_dropin_files {
    $systemd_dropin_files_defaults = hiera('ducktape::systemd::dropin_files::defaults', {})
    create_resources('::systemd::dropin_file', hiera_hash('ducktape::systemd::dropin_files', {}), $ducktape::systemd::dropin_files_defaults)
  }

  if $load_unit_files {
    $systemd_unit_files_defaults = hiera('ducktape::systemd::unit_files::defaults', {})
    create_resources('::systemd::unit_file', $ducktape::systemd::unit_files, $ducktape::systemd::unit_files_defaults)
  }

  if $load_timers {
    $systemd_timers_defaults = hiera('ducktape::systemd::timers::defaults', {})
    create_resources('::systemd::timer', $ducktape::systemd::timers, $ducktape::systemd::timers_defaults)
  }

  if $load_networks {
    $systemd_networks_defaults = hiera('ducktape::systemd::networks::defaults', {})
    create_resources('::systemd::network', $ducktape::systemd::networks, $ducktape::systemd::networks_defaults)
  }
}
