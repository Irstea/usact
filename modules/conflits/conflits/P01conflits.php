<?php
/**
 * Gestion table conflits :
 * - Liste
 * - Detail
 * - Modif
 * - Ecrire
 * 
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * P01conflitsL, P01conflitsD, P01conflitsM, P01conflitsE
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
 * Affectation dans variable rconflits
 */
	if (!isset($_SESSION["Rconflits"])) {
		$rconflits = new Rconflits();
		$_SESSION["Rconflits"] = $rconflits;	
	} else {
		$rconflits = $_SESSION["Rconflits"];
	}

/**
 * Stockage instance en variable de session (moteur de recherche)
 * Affectation dans variable rconflitsexpr
 */
	if (!isset($_SESSION["Rconflitsexpr"])) {
		$rconflitsexpr = new Rconflitsexpr();
		$_SESSION["Rconflitsexpr"] = $rconflitsexpr;	
	} else {
		$rconflitsexpr = $_SESSION["Rconflitsexpr"];
	}

/**
 * Stockage instance en variable de session (moteur de recherche)
 * Affectation dans variable rville
 */
	if (!isset($_SESSION["Rville"])) {
		$rville = new Rville();
		$_SESSION["Rville"] = $rville;	
	} else {
		$rville = $_SESSION["Rville"];
	}
	
/**
 * Affection id contenu dans le request
 */		
	$idconflit = $_REQUEST["numconflit"];
	$idconflitexpr = $_REQUEST["numconflitexpr"];
	
	$idville = $_REQUEST["numeroinsee"];
	$idlocalisation = $_REQUEST["numerolocalisation"];
	
	
	
switch ($t_module["param"]) {	
	case "Liste" :
		/** 
		 * Assigne les identifiants dans les URLs
		 */
		$smarty->assign("idville",$idville);	
		
		/**
		 * Gestion des criteres de recherche
         * Liste des enregistrements de la table 
         */
		
		$rconflits -> setParam($_REQUEST);
		$critere = $rconflits -> getParam();	

		if ($rconflits->isSearch () == 1) {

			$data = $dataConflits->getRconflits($critere);      
            $smarty->assign ("listeconflits", $data);
            $smarty->assign ("isSearch", 1);
			
		}
		
		$smarty->assign("critere",$critere);
		
		/**
		 * Listes déroulantes
		 */				
		$smarty->assign("modtypeconflit", $modalites->getLconflitstypeconflit());
				
		/**
		 * Assignation à smarty 
 		 */		
		$smarty->assign("corps","display/templates/conflits/conflits/P01conflitsL.tpl");
		
	break;
		
	case "Detail" :
		/** 
		 * Assigne les identifiants dans les URLs
		 */
		$smarty->assign("idconflit",$idconflit);	
		$smarty->assign("idconflitexpr",$idconflitexpr);

		$smarty->assign("idville",$idville);	
		$smarty->assign("idlocalisation",$idlocalisation);	
		
		/**
         * Details de l'enregistrement de la table conflit		
         */
		if (isset ($idconflit) && ($idconflit > 0)) {	
			$data=$dataConflits->lire($idconflit);
			$smarty->assign("detailconflits",$data);
		}		
				
				
		/**
		 * Gestion des criteres de recherche conflitexpr
         * Liste de tous les enregistrements de la table conflitsexpr
         */
		
		$rconflitsexpr -> setParam($_REQUEST);
		$critere = $rconflitsexpr -> getParam();	

		if ($rconflitsexpr ->isSearch () == 1) {
			if (isset ($idconflit) && ($idconflit > 0)) {
			$data = $dataConflitsexpr->getRconflitsexpr($param1=$idconflit,$param2=$critere);      
            $smarty->assign ("listeconflitsexpr", $data);
            $smarty->assign ("isSearch", 1);
			}
		}
		    
		$smarty->assign("critere",$critere);		

		/**
		 * Gestion des criteres de recherche ville
         * Liste de tous les enregistrements de la table ville
         */
		
		$rville -> setParam($_REQUEST);
		$critereville = $rville -> getParam();	

		if ($rville->isSearch () == 1) {
			if (isset ($idconflit) && ($idconflit > 0)) {
			$data = $dataVille->getRville($param1=$idconflit, $param2=$critereville);      
           	$smarty->assign ("listeville", $data);
           	$smarty->assign ("isSearch", 1);
			}
		}
	
		$smarty->assign("critereville",$critereville);
			
		
		/**
		 * Assignation à smarty
 		 */		
		$smarty->assign("corps","display/templates/conflits/conflits/P01conflitsD.tpl");		
	
		
	break;

	case "Modif" :
		/** 
		 * Assigne les identifiants dans les URLs
		 */
		$smarty->assign("idville",$idville);
		
		/**
		 * Listes déroulante fixe
		 * Modification de l'enregistrement de la table
		 */
		$smarty->assign("modtypeconflit", $modalites->getLconflitstypeconflit());
		$smarty->assign("modbsniv1", $modalites->getLconflitsbsniv1());
		$smarty->assign("modechelle", $modalites->getLconflitsechelle());
		$smarty->assign("modrecurrence", $modalites->getLconflitsrecurrence());
		
		/**
		 * Assignation à smarty 
 		 */
		$smarty->assign("corps","display/templates/conflits/conflits/P01conflitsM.tpl");
		
		/**
		 * Lecture des données 
 		 */
		dataRead($dataConflits, $idconflit, "display/templates/conflits/conflits/P01conflitsM.tpl");
		
	break;
		
	case "Ecrire" :
		/**
		 * Ecriture des données
		 */		
		if (isset($_REQUEST["Enre_Fconflits"])){
			dataWrite($dataConflits, $_REQUEST);
		} 
		
	break;
		
	case "Ajax":
		/**
		 * Listes déroulante dynamiques au format ajax
		 */		
		$libelleBS1=pg_escape_string($_REQUEST["libelleBS1"]);
		$modalites->getLconflitsbsniv2($libelleBS1);
		
		$libelleTC=pg_escape_string($_REQUEST["libelleTC"]);
		$modalites->getLconflitsoniv1($libelleTC);
		
		$libelleO1=pg_escape_string($_REQUEST["libelleO1"]);
		$modalites->getLconflitsoniv2($libelleO1);		
		
	break;
}

?>
