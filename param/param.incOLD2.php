<?php
/** Fichier cree le 4 mai 07 par quinton
*
*UTF-8
*/

$APPLI_modeDeveloppement = true;
$ERROR_display=1;
$ERROR_level = E_ERROR ;
$ADODB_debugmode = 0;
$OBJETBDD_debugmode = 1;
$APPLI_utf8 = true;

$GACL_aco = $APPLI_code;
$GACL_aro = "login";
$GACL_aco = "proto";

$ident_type = "BDD";

$BDD_type = "postgres7";
$BDD_server = "localhost";
$BDD_login = "conflits";
$BDD_passwd = "registre";
$BDD_database = "conflits";

$GACL_dbtype = "postgres7";
$GACL_dbserver = "localhost";
$GACL_dblogin = "conflits";
$GACL_dbpasswd = "registre";
$GACL_database = "conflits";

$APPLI_address = "http://localhost/PrototypePHP";
$APPLI_mail = "contact@domain.fr";
$APPLI_nom = "PROTOTYPEPHP";
$APPLI_code = 'proto';

$LDAPGROUP_address = "localhost";
$LDAPGROUP_attributnomgroupe = "cn";
$LDAPGROUP_attributnomlogin = "memberuid";
$LDAPGROUP_basedngroup = "ou=Group,ou=example,o=societe,c=fr";
$LDAP_address = "localhost";
$LDAP_port = 389;
$LDAP_basedn = "ou=people,ou=example,o=societe,c=fr";

?>
