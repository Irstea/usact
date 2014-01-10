<?php
/**
 * Gestion table modesaction :
 * - Modif
 * - Ecrire
 * 
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * P07modesactionM, P07modesactionE
 * 
 * menu items are declared in locales/fr.php
 */

/**
 * Chargement du constructeur de classe Table
 * Affectation dans variable 
 */
	include_once("modules/conflits/tables.class.php");
	$dataModesaction = new Modesaction($bdd,$ObjetBDDParam);
	
/**
 * Définition des listes déroulantes 
 * Affectation dans variable modalites
 */
	$modalites = new Modalites($bdd, $ObjetBDDParam);

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
	$idaction = $_REQUEST["numaction"];
	
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
		$smarty->assign("idaction",$idaction);	
		
		/**
		 * Listes déroulante fixe
		 */
		$smarty->assign("modtypmodact", $modalites->getLmodesactiontypemodeact());
		$smarty->assign("modmodact", $modalites->getLmodesactionmodeact());
		$smarty->assign("modechact", $modalites->getLmodesactionechelleact());
		 
		/**
		 * Assignation à smarty
 		 */
		$smarty->assign("corps","display/templates/conflits/conflits/P07modesactionM.tpl");
		
		/**
		 * Lecture des données
		 */		
		dataRead($dataModesaction, $idaction, "display/templates/conflits/conflits/P07modesactionM.tpl",$idinterv);
		
	break;
		
	case "Ecrire" :
		/**
		 * Enregistrement des données
		 */		
		if (isset($_REQUEST["Enre_Fmodesaction"])){
			dataWrite($dataModesaction, $_REQUEST);		
		} 
		
	break;
	
}

?>

