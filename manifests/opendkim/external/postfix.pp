class ducktape::opendkim::external::postfix(
  Boolean $enabled = true,
  $port    = $::ducktape::opendkim::port,
) {

  if $enabled {
    $socket_postfix_def = "inet:127.0.0.1:${port}"
    postfix::config {
      "smtpd_milters"         : value => $socket_postfix_def;
      "non_smtpd_milters"     : value => $socket_postfix_def;
      "milter_default_action" : value => 'accept';
    }
  }

}
