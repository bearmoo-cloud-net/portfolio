<?php
$CONFIG = array (
  'instanceid' => 'INSTANCEID',
  'passwordsalt' => 'PASSWORDSALT',
  'secret' => 'SECRET',
  'trusted_domains' =>
  array (
    0 => 'TRUSTEDDOMAIN',
  ),
  'forwarded_for_headers' =>
  array (
    0 => 'HTTP_X_FORWARDED',
    1 => 'HTTP_FORWARDED_FOR',
  ),
  'trusted_proxies'   => '10.42.0.0/16',
  'overwritecondaddr' => '^10\.42\.0\.1$',
  'overwriteprotocol' => 'https',
  'forcessl' => true,
  'integrity.check.disabled' => true,
  'overwrite.cli.url' => 'OVERWRITEURL',
  'dbtype' => 'mysql',
  'default_phone_region' => 'US',
  'version' => 'VERSION',
  'dbname' => 'DBNAME',
  'dbhost' => 'DBHOST',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'DBUSER',
  'dbpassword' => 'DBPASS',
  'installed' => true,
  'filesystem_cache_readonly' => true,
  'cache_path' => '',
  'objectstore' =>
  array (
    'class' => 'OC\\Files\\ObjectStore\\S3',
    'arguments' =>
    array (
      'bucket' => 'S3BUCKET',
      'autocreate' => false,
      'key' => 'S3KEY',
      'secret' => 'S3SECRET',
      'hostname' => 'S3HOSTNAME',
      'port' => 9000,
      'use_ssl' => false,
      'region' => 'optional',
      'use_path_style' => true,
    ),
  ),
  'memcache.local' => '\\OC\\Memcache\\Redis',
  'memcache.distributed' => '\\OC\\Memcache\\Redis',
  'redis' =>
  array (
    'port' => REDISPORT,
    'host' => 'REDISHOST',
    'database' => REDISDATABASE,
  ),
  'filelocking.enabled' => true,
  'filelocking.ttl' => 3600,
  'memcache.locking' => '\\OC\\Memcache\\Redis',
  'theme' => '',
  'loglevel' => LOGLEVEL,
  'maintenance' => false,
  'mail_smtpmode' => 'smtp',
  'mail_smtphost' => 'MAILSMTPHOST',
  'mail_smtpauthtype' => 'LOGIN',
  'mail_smtpport' => '587',
  'mail_from_address' => 'MAILFROM',
  'mail_domain' => 'MAILDOMAIN',
  'mail_smtpstreamoptions' =>
  array (
    'ssl' =>
    array (
      'allow_self_signed' => true,
      'verify_peer' => false,
      'verify_peer_name' => false,
    ),
  ),
);
