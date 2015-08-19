<?php
/**
 * Code execute systematiquement a chaque appel, apres demarrage de la session
 * Utilise notamment pour recuperer les instances de classes stockees en 
 * variables de session
 */

$sql = "set search_path = public, arcachon";
$bdd -> exec($sql);

/*if (!isset($_SESSION["searchConflit"])) {
	$searchConflit = new SearchConflit();
	$_SESSION["searchConflit"] = $searchConflit;
} 
else {
	$searchConflit = $_SESSION["searchConflit"];
}*/

if (!isset($_SESSION["searchPerimetre"])) {
	$searchPerimetre = new SearchPerimetre();
	$_SESSION["searchPerimetre"] = $searchPerimetre;
}
else {
	$searchPerimetre = $_SESSION["searchPerimetre"];
}

if (!isset($_SESSION["searchActeur"])) {
	$searchActeur = new SearchActeur();
	$_SESSION["searchActeur"] = $searchActeur;
}
else {
	$searchActeur = $_SESSION["searchActeur"];
}
if (!isset($_SESSION["searchIntervention"])) {
	$searchIntervention = new SearchIntervention();
	$_SESSION["searchIntervention"] = $searchIntervention;
}
else {
	$searchIntervention = $_SESSION["searchIntervention"];
}

?>