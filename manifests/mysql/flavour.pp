class ducktape::mysql::flavour (
  $flavour,
  $enabled = true,
) {

  validate_bool($enabled)
  validate_string($flavour)

  if $enabled {
    case $flavour {
      'percona' : {
        case $::osfamily {
          'RedHat': {
            yumrepo { 'percona':
              descr    => "CentOS ${::operatingsystemmajrelease} - Percona",
              baseurl  => "http://repo.percona.com/centos/${::operatingsystemmajrelease}/os/${::architecture}/",
              enabled  => 1,
              gpgcheck => 0,
            }
          }
          'Debian': {
            apt::key { 'percona':
              key        => '9334A25F8507EFA5',
              key_server => 'keys.gnupg.net',
            }
            apt::source { 'percona':
              location    => 'http://repo.percona.com/apt',
              release     => $::lsbdistcodename,
              repos       => 'main',
              include_src => false,
              require     => Apt::Key['percona'],
            }
          }
          default : {
            fail("Unsupported platform: ${module_name} currently doesn't support ${::osfamily} or ${::operatingsystem}")
          }
        }
      }
      default : { }
    }
  }

}
