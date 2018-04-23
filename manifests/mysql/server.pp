class ducktape::mysql::server inherits ducktape::mysql {

  if $ducktape::mysql::enabled {
    if $ducktape::mysql::flavour == 'percona' {
      # We want the pid inside this folder (Debian/RedHat default).
      file { '/var/run/mysqld':
        ensure  => directory,
        owner   => 'mysql',
        mode    => '0755',
        require => Class['::mysql::server::install'],
        notify  => Class['::mysql::server::service']
      }
    }
    if $::lsbdistcodename == 'wheezy'
      and defined('::apt_extras::dotdeb')
      and defined(Class[::apt_extras::dotdeb])
      and defined('::pam')
    {
      pam::service_conf { 'su':
        type    => 'session',
        control => 'required',
        module  => 'pam_limits.so',
      }
      file { '/etc/security/limits.d/mysql.conf' :
        ensure => present,
        source => 'puppet:///modules/ducktape/mysql/server/wheezy_5.6_limits.conf',
        mode   => '0644',
      }
    }
    anchor { 'ducktape::mysql::server::begin': } ->
      Class['::ducktape::mysql::flavour'] ->
      Class['::mysql::server::install'] ->
    anchor { 'ducktape::mysql::server::end': }

    # Declare configuration snippets.
    $defaults = hiera('ducktape::mysql::conf::defaults', {})
    $confs    = hiera_hash('ducktape::mysql::confs', {})
    create_resources('::ducktape::mysql::conf', $confs, $defaults)

    # External checks.
    if defined('::monit') and defined(Class['::monit']) {
      include ::ducktape::mysql::external::monit
    }
    if defined('::munin::node') and defined(Class['::munin::node']) {
      include ::ducktape::mysql::external::munin_node_plugin
    }

    include ducktape::mysql::server::autoload
  }
}

