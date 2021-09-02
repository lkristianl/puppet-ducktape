class ducktape::alternatives (
  Boolean $enabled = true,
  Hash $defaults = {},
) {

  if $enabled {
    require ::ducktape::alternatives::autoload
  }

}
