class ducktape::gluster::autoload (
  Boolean $load_mounts = true,
) {

  if $load_mounts {
    $gluster_mount_defaults = hiera('ducktape::gluster::mount::defaults', {})
    create_resources('gluster::mount', hiera_hash('ducktape::gluster::mounts', {}), $gluster_mount_defaults)
  }

}
