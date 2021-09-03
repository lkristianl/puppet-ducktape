class ducktape::apt::autoload(
  Boolean $key = true,
  Boolean $source = true,
) {

  if $key {
    # Declare keys
    # $key_defaults = hiera('ducktape::apt::key::defaults', {})
    create_resources('::apt::key', $ducktape::apt::keys, $ducktape::apt::key_defaults)
  }

  if $source {
    # Declare sources
    # $source_defaults = hiera('ducktape::apt::source::defaults', {})
    create_resources('::apt::source', $ducktape::apt::sources, $ducktape::apt::source_defaults)
  }

}
