<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );/** MySQL database username */
define( 'DB_USER', 'wp_admin' );/** MySQL database password */
define( 'DB_PASSWORD', 'wp_admin' );/** MySQL hostname */
define( 'DB_HOST', 'mysql' );/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'W#3F8[Syk08oRMUp@SR|([Ny`!I}kHk2|)j) +c4}<`l{T4`* ;348F0||maePGC' );
define( 'SECURE_AUTH_KEY',  'H3+`zd[Xm0s@:eHt@a#8UF=rn1SbG#Q?M^!n{/VX0VcpFs@eE|uCL u?Eg;<><U)' );
define( 'LOGGED_IN_KEY',    '0@=a6LC>WWNaW[)$e wlicU:)hqmy67.@M$&/?!.5Sg[@U3eF5i{uX9]94p/up:<' );
define( 'NONCE_KEY',        '9[0z*q),dG`%=x_)R8#0oH 584)![YR/;Hl9prh@dFGo4wKsycg@N:!:h1YON<tj' );
define( 'AUTH_SALT',        'PkxAn_4@P8`C{.UqF=A^u@e47bKttt}%G`dks5}+w6=,A$Nd#WoVR1j!Oe|2wo&D' );
define( 'SECURE_AUTH_SALT', '$vWjSMOOdaplbD(Sn^&?bmnJ9PVMw6eob:u*,4LPE4*qN,o.sEzb60wzLD5}QIPS' );
define( 'LOGGED_IN_SALT',   'e[_L9u?!chZ*i{:mgcYN]el1E0[,z|32-T}O3,o9`9=C290m5+!~zeG#2l&d82?+' );
define( 'NONCE_SALT',       'D.7.1Ay2?y/l0JCVHpbG+G[.M.am!rW,q=DUjLTS~pT)6)IcxGAN(`r,(E)v8RIG' );/**#@-*//**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );/* That's all, stop editing! Happy publishing. *//** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';