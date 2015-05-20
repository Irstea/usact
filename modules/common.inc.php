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

if (!isset($_SESSION["searchTypePerimetre"])) {
	$searchTypePerimetre = new SearchTypePerimetre();
	$_SESSION["searchTypePerimetre"] = $searchTypePerimetre;
}
else {
	$searchTypePerimetre = $_SESSION["searchTypePerimetre"];
}

if (!isset($_SESSION["searchObjetNiv1"])) {
	$searchObjetNiv1 = new SearchObjetNiv1();
	$_SESSION["searchObjetNiv1"] = $searchObjetNiv1;
}
else {
	$searchObjetNiv1 = $_SESSION["searchObjetNiv1"];
}

if (!isset($_SESSION["searchObjetNiv2"])) {
	$searchObjetNiv2 = new SearchObjetNiv2();
	$_SESSION["searchObjetNiv2"] = $searchObjetNiv2;
}
else {
	$searchObjetNiv2 = $_SESSION["searchObjetNiv2"];
}

if (!isset($_SESSION["searchBienSupportNiv1"])) {
	$searchBienSupportNiv1 = new SearchBienSupportNiv1();
	$_SESSION["searchBienSupportNiv1"] = $searchBienSupportNiv1;
}
else {
	$searchBienSupportNiv1 = $_SESSION["searchBienSupportNiv1"];
}

if (!isset($_SESSION["searchBienSupportNiv2"])) {
	$searchBienSupportNiv2 = new SearchBienSupportNiv2();
	$_SESSION["searchBienSupportNiv2"] = $searchBienSupportNiv2;
}
else {
	$searchBienSupportNiv2 = $_SESSION["searchBienSupportNiv2"];
}

?>