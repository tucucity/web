<?php
foreach ( $_config as $_campo => $_valor )
{
    define($_campo,$_valor);
}

define("SERVER_ROOT", getcwd());
//Shorcuts variables to access quickly
define("IMG", HOME."web/images/");
define("CSS", HOME."web/css/");
define("JS", HOME."view/js/");
define("SJS", HOME."view/sjs/");
define("LINK", HOME);
define("UPLOAD", SERVER_ROOT."/web/uploads/");

//Crypting configuration
define("CIFRADO", MCRYPT_RIJNDAEL_256);
define("MODO", MCRYPT_MODE_ECB);
?>