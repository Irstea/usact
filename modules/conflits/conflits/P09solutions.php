<?php
/**
 * Gestion table solutions :
 * - Modif
 * - Ecrire
 * 
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * P09solutionsM, P09solutionsE
 * 
 * menu items are declared in locales/fr.php
 */

/**
 * Chargement du constructeur de classe Table
 * Affectation dans variable 
 */
	include_once("modules/conflits/tables.class.php");
	$dataSolutions = new Solutions($bdd,$ObjetBDDParam);
	
/**
 * Chargement du constructeur de classe Recherche
 */
	include_once("modules/conflits/recherche.class.php");
	
/**
 * Affection id contenu dans le request
 */		
	$idconflit = $_REQUEST["numconflit"];
	$idconflitexpr = $_REQUEST["numconflitexpr"];
	
	$idville = $_REQUEST["numeroinsee"];
	$idlocalisation = $_REQUEST["numerolocalisation"];
	
	$idacteur = $_REQUEST["numacteur"];
	$idarticle = $_REQUEST["numarticle"];

	$idinterv = $_REQUEST["numinterv"];
	$idsolution = $_REQUEST["numsolution"];
	
	
switch ($t_module["param"]) {	
		
	case "Modif" :
		/** 
		 * Assigne les identifiants dans les URLs
		 */
		$smarty->assign("idconflit",$idconflit);	
		$smarty->assign("idconflitexpr",$idconflitexpr);
			
		$smarty->assign("idville",$idville);	
		$smarty->assign("idlocalisation",$idlocalisation);
		
		$smarty->assign("idacteur",$idacteur);
		$smarty->assign("idarticle",$idarticle);
	
		$smarty->assign("idinterv",$idinterv);	
		$smarty->assign("idsolution",$idsolution);

		/**
		 * Assignation à smarty
 		 */
		$smarty->assign("corps","display/templates/conflits/conflits/P09solutionsM.tpl");

		
		/**
		 * Lecture des données
		 */
		dataRead($dataSolutions, $idsolution, "display/templates/conflits/conflits/P09solutionsM.tpl",$idinterv);
		
	break;
		
	case "Ecrire" :
		/**
		 * Enregistrement des données
		 */
		if (isset($_REQUEST["Enre_Fsolutions"])){
			dataWrite($dataSolutions, $_REQUEST);
		} 
		
	break;		
	
}

?>

