<?php
/**
 * Gestion table conflitsexpr :
 * - Detail
 * - Modif
 * - Ecrire
 * 
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * P02conflitsexprD, P02conflitsexprM, P02conflitsexprE
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
	$dataArticles = new Articles($bdd,$ObjetBDDParam);
		
/**
 * Chargement du constructeur de classe Recherche
 */
	include_once("modules/conflits/recherche.class.php");
	
/**
 * Stockage instance en variable de session (moteur de recherche)
 * Affectation dans variable rarticles
 */
	if (!isset($_SESSION["Rarticles"])) {
		$rarticles = new Rarticles();
		$_SESSION["Rarticles"] = $rarticles;	
	} else {
		$rarticles = $_SESSION["Rarticles"];
	}
	
/**
 * Affection id contenu dans le request
 */ 
	$idconflit = $_REQUEST["numconflit"];
	$idconflitexpr = $_REQUEST["numconflitexpr"];
	
	$idville = $_REQUEST["numeroinsee"];
	$idlocalisation = $_REQUEST["numerolocalisation"];

	$idarticle = $_REQUEST["numarticle"];
	
	
switch ($t_module["param"]) {	
	
	case "Detail" :
		/** 
		 * Assigne les identifiants dans les URLs
		 */
		$smarty->assign("idconflit",$idconflit);	
		$smarty->assign("idconflitexpr",$idconflitexpr);
			
		$smarty->assign("idville",$idville);	
		$smarty->assign("idlocalisation",$idlocalisation);
		
		$smarty->assign("idarticle",$idarticle);
		
		/**
         * Details de l'enregistrement de la table conflits + conflitsexpr + ville + localisation
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
						
		/**
		 * Gestion des criteres de recherche
         * Liste des enregistrements de la table 
         */		
		$rarticles -> setParam($_REQUEST);
		$critereart = $rarticles -> getParam();	

		if ($rarticles->isSearch () == 1) {
			if (isset ($idconflitexpr) && ($idconflitexpr > 0)) {
				$data = $dataArticles->getRarticles($idconflitexpr, $critereart);      
           		$smarty->assign ("listearticles", $data);
            	$smarty->assign ("isSearch", 1);
			}			
		}
	
		$smarty->assign("critereart",$critereart);
				
		/**
		 * Assignation à smarty
 		 */				
		$smarty->assign("corps","display/templates/conflits/conflits/P02conflitsexprD.tpl");
		
	break;

	case "Modif" :
		/** 
		 * Assigne les identifiants dans les URLs
		 */			
		$smarty->assign("idville",$idville);
		
		/**
		 * Lecture des données
		 */		
		dataRead($dataConflitsexpr, $idconflitexpr, "display/templates/conflits/conflits/P02conflitsexprM.tpl",$idconflit);
		
	break;
		
	case "Ecrire" :
		/**
		 * Ecriture des données
		 */
		if (isset($_REQUEST["Enre_Fconflitsexpr"])){			
			dataWrite($dataConflitsexpr, $_REQUEST);		
		} 
		
	break;
}

?>
	
	
	
