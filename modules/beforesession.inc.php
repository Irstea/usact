<?php
/**
 * Fichier contenant les classes a charger avant le demarrage de la session
 */
include_once 'modules/classes/search.class.php';

if (!isset($_SESSION["searchConflit"])) {
	$searchConflit = new SearchConflit();
	$_SESSION["searchConflit"] = $searchConflit;
} 
else {
	$searchConflit = $_SESSION["searchConflit"];
}
?>