<?php
/**
 * Gestion table resolution :
 * - Liste
 * - Modif
 * - Ecrire
 * 
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * P10resolutionL, P10resolutionM, P10resolutionE
 * 
 * menu items are declared in locales/fr.php
 */

/**
 * Chargement du constructeur de classe Table
 * Affectation dans variable
 */
	include_once("modules/conflits/tables.class.php");
	$dataConflits = new Conflits($bdd,$ObjetBDDParam);
	$dataConflitsexpr = new Conflitsexpr($bdd,$ObjetBDDParam);
	$dataVille = new Ville($bdd,$ObjetBDDParam);
	$dataLocalisation = new Localisation($bdd,$ObjetBDDParam);
	$dataActeurs = new Acteurs($bdd,$ObjetBDDParam);	
	$dataArticles = new Articles($bdd,$ObjetBDDParam);
	$dataInterventions = new Interventions($bdd,$ObjetBDDParam);
	$dataSolutions = new Solutions($bdd,$ObjetBDDParam);
	$dataResolution = new Resolution($bdd,$ObjetBDDParam);
	
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
 * Stockage instance en variable de session (moteur de recherche)
 * Affectation dans variable racteurs
 */	
	if (!isset($_SESSION["Rresolution"])) {
		$rresolution = new Rresolution();
		$_SESSION["Rresolution"] = $rresolution;	
	} else {
		$rresolution = $_SESSION["Rresolution"];
	}

	
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
	
	$idresolution = $_REQUEST["numresolution"];
	
	
switch ($t_module["param"]) {	
	case "Liste" :
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
         * Details de l'enregistrement de la table conflits + conflitsexpr + ville + localisation + article + acteur + interv + solution
     	 */
		if (isset ($idconflit) && ($idconflit > 0)) {
			$data=$dataConflits->lire($idconflit);
			$smarty->assign("detailconflits",$data);	
		}
		
		if (isset ($idconflit) && ($idconflit > 0)) {
			if (isset ($idconflitexpr) && ($idconflitexpr > 0)) {
				$data=$dataConflitsexpr->lire($idconflitexpr,$getDefault=true,$parentValue=$idconflit);
				$smarty->assign("detailconflitsexpr",$data);
			}
		}

		if (isset ($idville) && ($idville > 0)) {
			$data=$dataVille->lire($idville);
			$smarty->assign("detailville",$data);
		}
		
		if (isset ($idlocalisation) && ($idlocalisation > 0)) {		
			$data=$dataLocalisation->lire($idlocalisation);
			$smarty->assign("detaillocalisation",$data);
		}
		
		if (isset ($idarticle) && ($idarticle > 0)) {		
			$data=$dataArticles->lire($idarticle);
			$smarty->assign("detailarticle",$data);
		}

		if (isset ($idacteur) && ($idacteur > 0)) {		
			$data=$dataActeurs->lire($idacteur);
			$smarty->assign("detailacteur",$data);
		}	
		
		if (isset ($idinterv) && ($idinterv > 0)) {		
			$data=$dataInterventions->lire($idinterv);
			$smarty->assign("detailinterv",$data);
		}
		
		if (isset ($idsolution) && ($idsolution > 0)) {		
			$data=$dataSolutions->lire($idsolution);
			$smarty->assign("detailsolution",$data);
		}
					
		/**
		 * Gestion des criteres de recherche
         * Liste des enregistrements de la table 
         */		
		$rresolution -> setParam($_REQUEST);
		$critere = $rresolution -> getParam();	
		
		if (isset ($idconflitexpr) && ($idconflitexpr > 0)) {
		if ($rresolution->isSearch () == 1) {			
				$data = $dataResolution->getRresolution($idconflitexpr, $critere); 
				$smarty->assign ("listeresolution", $data);
           		$smarty->assign ("isSearch", 1);
			}
		}
		
		$smarty->assign("critere",$critere);		 
		
		/**
		 * Assignation à smarty 
 		 */
		$smarty->assign("corps","display/templates/conflits/conflits/P10resolutionL.tpl");
		
	break;
		
	
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
			
		$smarty->assign("idresolution",$idresolution);	
		
		/**
		 * Listes déroulante fixe
		 */
		$smarty->assign("modresolniv1", $modalites->getLresolutionniv1());
		$smarty->assign("modresolnivspat", $modalites->getLresolutionnivspat());
		$smarty->assign("modresolnivact", $modalites->getLresolutionnivact());
		$smarty->assign("modmodresolniv1", $modalites->getLresolutionmodeniv1());
		
		/**
		 * Assignation à smarty
 		 */
		$smarty->assign("corps","display/templates/conflits/conflits/P10resolutionM.tpl");
		
		/**
		 * Lecture des données
		 */
		dataRead($dataResolution, $idresolution, "display/templates/conflits/conflits/P10resolutionM.tpl",$idconflitexpr);
		
	break;
		
	case "Ecrire" :
		/**
		 * Enregistrement des données
		 */
		if (isset($_REQUEST["Enre_Fresolution"])){
			dataWrite($dataResolution, $_REQUEST);
		} 
		
	break;
		
	case "Ajax":
		/*
		 * Listes déroulante dynamiques au format ajax
		 */		
		$libellemodmodresolniv1=pg_escape_string($_REQUEST["libellemodmodresolniv1"]);
		$modalites->getLresolutionmodeniv2($libellemodmodresolniv1);		
						
	break;
	
}

?>

