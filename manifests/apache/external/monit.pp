class ducktape::apache::external::monit(
  $enabled        = true,
  $action         = 'restart',
  $ip             = '127.0.0.1',
  $port           = 80,
  $vhost_priority = 99,
  $vhost_seed     = 'monit-test',
  $vhost_prefix   = 'monit-test-',
  $vhost_suffix   = ".${::fqdn}",
  $conn_tolerance = { cycles => 1 },
  $alerts         = undef,
  $extra_tests    = [],
) {

  validate_bool($enabled)
  #TODO# Add more validations

  if $enabled {
    $rand_fragment = fqdn_rand(1000000, $vhost_seed)
    $servername    = "${vhost_prefix}${rand_fragment}${vhost_suffix}"
    $docroot       = "/var/www/${servername}"

    # Declare health check vhost.
    file { "${docroot}/index.html":
      ensure  => present,
      content => 'monit-test',
    }
    apache::vhost { $servername:
      port              => $port,
      docroot           => $docroot,
      options           => [ 'None' ],
      priority          => $vhost_priority,
      access_log_pipe   => '/dev/null',
      access_log_format => '-',
      error_log_pipe    => '/dev/null',
    }
    host { $servername:
      ip => $ip,
    }

    # $::apache::pidfile declares Debian pidfile as a shell variable.
    # $::apache::pidfile declares RedHat pidfile as a relative path.
    $pidfile = $::osfamily ? {
      'Debian' => $::operatingsystem ? {
        'Ubuntu' => (versioncmp($::operatingsystemrelease, '14.04') < 0) ? {
          true  => '/var/run/apache2.pid',
          false => '/var/run/apache2/apache2.pid',
        },
        'Debian' => (versioncmp($::operatingsystemrelease, '8') < 0) ? {
          true  => '/var/run/apache2.pid',
          false => '/var/run/apache2/apache2.pid',
        },
        default  => $::apache::pidfile,
      },
      'RedHat' => '/var/run/httpd/httpd.pid',
      default  => $::apache::pidfile,
    }

    $init_system = $::operatingsystem ? {
      'Ubuntu' => $::lsbmajdistrelease ? {
        /(12\.|14\.)/ => 'sysv',
        default       => undef,
      },
      'Debian' => $::lsbdistcodename ? {
        'jessie' => 'sysv',
        default  => undef,
      },
      default  => undef,
    }
    $initd           = "${::monit::service_program} ${::apache::service_name}"
    $program_start   = "/bin/sh -c '${initd} stop || /usr/bin/killall -9 ${::apache::service_name} ; /bin/sleep 2 ; ${initd} start'"
    $connection_test = {
      type      => 'connection',
      host      => $servername,
      protocol  => 'http',
      port      => $port,
      action    => $action,
      tolerance => $conn_tolerance,
    }
    monit::check::service { $::apache::service_name:
      init_system   => $init_system,
      pidfile       => $pidfile,
      program_start => $program_start,
      alerts        => $alerts,
      tests         => $extra_tests + [$connection_test],
      #TODO# if 5 restarts within 5 cycles then timeout
    }
  }

}
