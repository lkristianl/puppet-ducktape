class ducktape::munin::node (
  Boolean $enabled = true,
  $manage_repo = true, ##TODO## Add Boolean?
  $contrib_plugins_path = '/opt/munin-monitoring',
) {

  if $enabled {
    if $manage_repo {
      vcsrepo { $contrib_plugins_path :
        ensure   => 'present',
        provider => 'git',
        source   => 'https://github.com/munin-monitoring/contrib.git',
        revision => 'master',
      }
    }

    # External checks.
    if defined('::monit') and defined(Class['::monit']) {
      include ::ducktape::munin::external::monit
    }
  }

}
