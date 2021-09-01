class ducktape::posix_acl (
  Boolean $enabled = true,
) {

  if $enabled {

    $posix_acl_defaults = hiera('ducktape::posix_acl::defaults', {})
    create_resources('posix_acl', hiera_hash('ducktape::posix_acls', {}), $posix_acl_defaults)

  }

}
