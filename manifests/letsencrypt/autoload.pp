class ducktape::letsencrypt::autoload (
  Boolean $load_certonlys = true,
  Boolean $load_backends  = true,
) {

  if $load_certonlys {
    #TODO# ensure that each key matchs its first domain

    # $letsencrypt_certonly_defaults = hiera('ducktape::letsencrypt::certonly::defaults', {})
    create_resources('letsencrypt::certonly', $ducktape::letsencrypt::certonlys, $ducktape::letsencrypt::certonly_defaults)
  }

}
