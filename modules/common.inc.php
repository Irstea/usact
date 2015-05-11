<?php
/**
 * Code execute systematiquement a chaque appel, apres demarrage de la session
 * Utilise notamment pour recuperer les instances de classes stockees en 
 * variables de session
 */

$sql = "set search_path = public, arcachon, gacl";
$bdd -> Execute($sql);

if (!isset($_SESSION["searchConflit"])) {
	$searchConflit = new SearchConflit();
	$_SESSION["searchConflit"] = $searchConflit;
} 
else {
	$searchConflit = $_SESSION["searchConflit"];
}

if (!isset($_SESSION["searchEchelle"])) {
	$searchEchelle = new SearchEchelle();
	$_SESSION["searchEchelle"] = $searchEchelle;
}
else {
	$searchEchelle = $_SESSION["searchEchelle"];
}

?>