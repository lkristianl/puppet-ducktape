class ducktape::puppetdb::external::monit(
  Boolean $enabled = true,
) {

  if $enabled {
    $pidfile = $::osfamily ? {
      'RedHat' => '/var/run/puppetdb/puppetdb',
      'Debian' => '/var/run/puppetdb.pid',
    }

    monit::check::service { $::puppetdb::server::puppetdb_service:
      pidfile => $pidfile,
    }
  }

}
