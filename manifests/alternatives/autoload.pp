class ducktape::alternatives::autoload (
  Boolean $autoload = true,
) {

  if $autoload {
    ##TODO##How to name the new hash for ducktape::alternatives
    create_resources('alternatives', hiera_hash('ducktape::alternatives', {}), $::ducktape::alternatives::defaults)
  }

}
