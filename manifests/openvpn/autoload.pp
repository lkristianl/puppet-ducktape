class ducktape::openvpn::autoload (
  Boolean $load_servers = true,
  Boolean $load_clients = true,
  Boolean $load_revokes = true,
) {

  if $load_servers {
    $server_defaults = hiera('ducktape::openvpn::server::defaults', {})
    create_resources('::openvpn::server', hiera_hash('ducktape::openvpn::servers', {}), $server_defaults)
  }

  if $load_clients {
    $client_defaults = hiera('ducktape::openvpn::client::defaults', {})
    create_resources('::openvpn::client', hiera_hash('ducktape::openvpn::clients', {}), $client_defaults)
  }

  if $load_revokes {
    $revoke_defaults = hiera('ducktape::openvpn::revoke::defaults', {})
    create_resources('::openvpn::revoke', hiera_hash('ducktape::openvpn::revokes', {}), $revoke_defaults)
  }

}
