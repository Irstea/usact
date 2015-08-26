<?php
/** Fichier cree le 4 mai 07 par quinton
*
*UTF-8
*/

$APPLI_modeDeveloppement = true;
//$APPLI_notSSL = true;
$APPLI_modeDeveloppement == true ? $ERROR_display=1 : $_ERROR_display = 0;
$ERROR_level = E_ERROR ;
$ADODB_debugmode = 0;
$OBJETBDD_debugmode = 1;
$APPLI_utf8 = true;

$ident_type = "LDAP-BDD";
/*
 * Parametres concernant la base de donnees
 */
$BDD_login = "proto";
$BDD_passwd = "proto";
$BDD_dsn = "pgsq:host=localhost;dbname=proto";

/*
 * Base de donnees de developpement
*/
$BDDDEV_login = "eric.quinton";
$BDDDEV_passwd = "Kl3nduc!";
$BDDDEV_dsn = "pgsql:host=guzzi;dbname=usact";
$BDDDEV_schema = "public";

/*
 * Rights management, logins and logs records database
 */
$GACL_dblogin = "eric.quinton";
$GACL_dbpasswd = "Kl3nduc!";
$GACL_aco = "usact";
$GACL_dsn = "pgsql:host=guzzi;dbname=usact";
$GACL_schema = "gacl";

$APPLI_address = "http://localhost/usact";
$APPLI_mail = "proto@domain.fr";
$APPLI_nom = "PROTOTYPEPHP";
$APPLI_code = 'proto';


$LDAPGROUP_address = "ldaps://ldap.irstea.fr";
$LDAPGROUP_attributnomgroupe = "cn";
$LDAPGROUP_attributnomlogin = "memberuid";
$LDAPGROUP_basedngroup = "dc=irstea,dc=fr";
$LDAP_address = "ldaps://ldap.irstea.fr";
$LDAP_port = 636;
$LDAP_basedn = "ou=people,dc=irstea,dc=fr";

$paramIniFile = "./param.ini";
?>
