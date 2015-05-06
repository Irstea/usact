<?php
/**
 * Code execute systematiquement a chaque appel, apres demarrage de la session
 * Utilise notamment pour recuperer les instances de classes stockees en 
 * variables de session
 */

$sql = "set search_path = public, arcachon";
$bdd -> Execute($sql);

if (!isset($_SESSION["searchConflit"])) {
	$searchConflit = new SearchConflit();
	$_SESSION["searchConflit"] = $searchConflit;
}
else {
	$searchConflit = $_SESSION["searchConflit"];
}

?>