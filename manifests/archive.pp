class ducktape::archive (
  Boolean $enabled = true,
) {

  if $enabled {

    $archive_defaults = hiera('ducktape::archive::defaults', {})
    create_resources('archive', hiera_hash('ducktape::archives', {}), $archive_defaults)

  }

}
