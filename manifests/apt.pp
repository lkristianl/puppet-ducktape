class ducktape::apt (
  Boolean $enabled = true,
  Hash $keys = {},
  Hash $key_defaults = {},
  Hash $sources = {},
  Hash $source_defaults = {},
) {

  if $enabled {
    require ::ducktape::apt::autoload
  }

}
