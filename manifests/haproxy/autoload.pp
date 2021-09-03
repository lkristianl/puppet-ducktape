class ducktape::haproxy::autoload (
  Boolean $frontend           = true,
  Boolean $backend            = true,
  Boolean $peer               = true,
  Boolean $userlist           = true,
) {

  if $frontend {
    create_resources('haproxy::frontend', $ducktape::haproxy::frontends, $ducktape::haproxy::frontend_defaults)
  }

  if $backend {
    create_resources('haproxy::backend', $ducktape::haproxy::backends, $ducktape::haproxy::backend_defaults)
  }

  if $peer {
    if $peers != {} {
      haproxy::peers { 'peerlist': }
      $peer_defaults = {
        peers_name => 'peerlist'
      }
      create_resources('haproxy::peer', $ducktape::haproxy::peers, $peer_defaults)
    }
  }

  if $userlist {
    create_resources('haproxy::userlist', $ducktape::haproxy::userlists, $ducktape::haproxy::userlist_defaults)
  }
}
