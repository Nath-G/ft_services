<?php

$cfg['blowfish_secret'] = '';

/**
 * List of env variables
 */
$vars = array(
    'PMA_HOST',
	'PMA_PORT',
	'PMA_USER',
	'MYSQL_ROOT_PASSWORD'
);

/**
 * Stock env variables in tab
 */
foreach ($vars as $var) {
    $env = getenv($var);
    if (!isset($_ENV[$var]) && $env !== false) {
        $_ENV[$var] = $env;
    }
}

/**
 * Only one server
 */
$i = 1;

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

// Use SSL for connection
// $cfg['Servers'][$i]['ssl'] = true;
// Client secret key
// $cfg['Servers'][$i]['ssl_key'] = '/etc/ssl/certs/localhost.key';
// Client certificate
// $cfg['Servers'][$i]['ssl_cert'] = '/etc/ssl/certs/localhost.crt';
// Server certification authority
// $cfg['Servers'][$i]['ssl_ca'] = '../server-ca.pem';
// Disable SSL verification (see above note)
// $cfg['Servers'][$i]['ssl_verify'] = false;


// ssl_certificate /etc/ssl/certs/localhost.crt;
// ssl_certificate_key /etc/ssl/certs/localhost.key;
/**
 * Variable definition
 */
if (!empty($_ENV['PMA_HOST']))
	$cfg['Servers'][$i]['host'] = $_ENV['PMA_HOST'];

if (!empty($_ENV['PMA_PORT']))
	$cfg['Servers'][$i]['port'] = $_ENV['PMA_PORT'];

if (!empty($_ENV['PMA_USER']))
	$cfg['Servers'][$i]['user'] = $_ENV['PMA_USER'];

if (!empty($_ENV['MYSQL_ROOT_PASSWORD']))
	$cfg['Servers'][$i]['password'] = $_ENV['MYSQL_ROOT_PASSWORD'];

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';