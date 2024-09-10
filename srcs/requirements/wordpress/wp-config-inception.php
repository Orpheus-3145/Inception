<?php

define( 'DB_NAME', getenv('DB_NAME') );

define( 'DB_USER', getenv('WP_USER') );

define( 'DB_PASSWORD', getenv('WP_PWD') );

define('DB_HOST', getenv("DB_HOST") . ':' . getenv('DB_PORT') );
// define( 'DB_HOST', getenv('DOMAIN_NAME') . ':' . getenv('DB_PORT') );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define('AUTH_KEY',         '%U;c<MS{4AE)c`p19-w}j/1-6?Mro|6DcZ;/o[WYx$F$Iq.0>|u-ip.JK#]+w8==');
define('SECURE_AUTH_KEY',  '*+G?rpe5H{EBv:hpz^R/Aiq=w!w*_T`xo!c,hl|!Ej_(Sm6I56%VTu&XgnU<o;4l');
define('LOGGED_IN_KEY',    'R4,wB|-@ESdeMugH1ZQ<2`~m+PHzjrJ=^o~`sw #zhkjIZxCm9JwOC1c *qvr[pk');
define('NONCE_KEY',        'vS5j<H|RD>xRg:hKSIYF6{7$_EQ%.GT=#%`HewB8}+)AbRagH*u1cM/{Z|=;4O|=');
define('AUTH_SALT',        'O4=5Kt@<H+`%O$!>Qw;yG3$S%CU;bNV-6Co-i{LK%&4lflzK44h4M{o@Y9&0)j{b');
define('SECURE_AUTH_SALT', 'm~.Rf(|n&9-]sZwKk[+JfoHh<#e1P!s&rz<4<|Ecy yk& F+vD<jc6T#h+>s5U}@');
define('LOGGED_IN_SALT',   'eknQF[x`^nMDlp!qoc.F&zycLo#sa,yZNb1|N:|k%zTq;[l-JM_cx`53P=|@{6)h');
define('NONCE_SALT',       '?-&)!9-I_`*xh8pe_fiUKlv*/cS.=]hWRzPZ_,f$k|zt%gs.lFv#%]3$8zvdZ~Uy');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
