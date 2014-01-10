<?php
/**
 * Gestion table revendications :
 * - Modif
 * - Ecrire
 * 
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * P08revendicationsM, P08revendicationsE
 * 
 * menu items are declared in locales/fr.php
 */

/**
 * Chargement du constructeur de classe Table
 * Affectation dans variable
 */
	include_once("modules/conflits/tables.class.php");
	$dataRevendications = new Revendications($bdd,$ObjetBDDParam);
	
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
	$idrevend = $_REQUEST["numrevend"];
	
	
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
		$smarty->assign("idrevend",$idrevend);	
				
		/**
		 * Listes déroulante fixe
		 */
		$smarty->assign("modrevendniv1", $modalites->getLrevendicationsniv1());
		$smarty->assign("modrevendsupportniv1", $modalites->getLrevendicationssupportniv1());
		$smarty->assign("modrevendregistreniv1", $modalites->getLrevendicationsregistreniv1());
		
		
		/**
		 * Assignation à smarty
 		 */
		$smarty->assign("corps","display/templates/conflits/conflits/P08revendicationsM.tpl");
		
		/**
		 * Lecture des données
		 */
		dataRead($dataRevendications, $idrevend, "display/templates/conflits/conflits/P08revendicationsM.tpl",$idinterv);
		
	break;
		
	case "Ecrire" :
		/**
		 * Enregistrement des données
		 */
		if (isset($_REQUEST["Enre_Frevendication"])){
			dataWrite($dataRevendications, $_REQUEST);
		} 
		
	break;
		
	case "Ajax":
		/**
		 * Listes déroulante dynamiques au format ajax
		 */		
		$libellemodrevendniv1=pg_escape_string($_REQUEST["libellemodrevendniv1"]);
		$modalites->getLrevendicationsniv2($libellemodrevendniv1);		
		
		$libellemodrevendsupportniv1=pg_escape_string($_REQUEST["libellemodrevendsupportniv1"]);
		$modalites->getLrevendicationssupportniv2($libellemodrevendsupportniv1);

		$libellemodrevendregistreniv1=pg_escape_string($_REQUEST["libellemodrevendregistreniv1"]);
		$modalites->getLrevendicationsregistreniv2($libellemodrevendregistreniv1);
		
	break;
	
}

?>

