<?php
/**
 * Code execute systematiquement a chaque appel, apres demarrage de la session
 * Utilise notamment pour recuperer les instances de classes stockees en 
 * variables de session
 */

$sql = "set search_path = public, arcachon";
$bdd -> exec($sql);

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
if (!isset($_SESSION["searchExpert"])) {
	$searchExpert = new SearchExpert();
	$_SESSION["searchExpert"] = $searchExpert;
}
else {
	$searchExpert = $_SESSION["searchExpert"];
}
if (!isset($_SESSION["searchArticle"])) {
	$searchArticle = new SearchArticle();
	$_SESSION["searchArticle"] = $searchArticle;
}
else {
	$searchArticle = $_SESSION["searchArticle"];
}
if (!isset($_SESSION["searchResolution"])) {
	$searchResolution = new SearchResolution();
	$_SESSION["searchResolution"] = $searchResolution;
}
else {
	$searchResolution = $_SESSION["searchResolution"];
}
if (!isset($_SESSION["searchJuridique"])) {
	$searchJuridique = new SearchJuridique();
	$_SESSION["searchJuridique"] = $searchJuridique;
}
else {
	$searchJuridique = $_SESSION["searchJuridique"];
}
?>