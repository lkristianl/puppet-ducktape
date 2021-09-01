class ducktape::rabbitmq::autoload (
  Boolean $load_vhosts           = true,
  Boolean $load_exchanges        = true,
  #TODO# Add Boolean?
  $load_queues           = true,
  $load_users            = true,
  $load_user_permissions = true,
) {

  if $load_vhosts {
    $rabbitmq_vhost_defaults = hiera('ducktape::rabbitmq::vhost::defaults', {})
    create_resources('rabbitmq_vhost', hiera_hash('ducktape::rabbitmq::vhosts', {}), $rabbitmq_vhost_defaults)
  }

  if $load_exchanges {
    $rabbitmq_exchange_defaults = hiera('ducktape::rabbitmq::exchange::defaults', {})
    create_resources('rabbitmq_exchange', hiera_hash('ducktape::rabbitmq::exchanges', {}), $rabbitmq_exchange_defaults)
  }

  if $load_queues {
    $rabbitmq_queue_defaults = hiera('ducktape::rabbitmq::queue::defaults', {})
    create_resources('rabbitmq_queue', hiera_hash('ducktape::rabbitmq::queues', {}), $rabbitmq_queue_defaults)
  }

  if $load_users {
    $rabbitmq_user_defaults = hiera('ducktape::rabbitmq::user::defaults', {})
    create_resources('rabbitmq_user', hiera_hash('ducktape::rabbitmq::users', {}), $rabbitmq_user_defaults)
  }

  if $load_user_permissions {
    $rabbitmq_user_permissions_defaults = hiera('ducktape::rabbitmq::user_permissions::defaults', {})
    create_resources('rabbitmq_user_permissions', hiera_hash('ducktape::rabbitmq::user_permissions', {}), $rabbitmq_user_permissions_defaults)
  }

}
