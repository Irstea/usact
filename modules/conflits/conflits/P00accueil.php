<?php
/**
 * Gestion page accueil (Affichage NumConflit, NumConflitExpr, DateDebut, DateFin, Ville, Localisation) :
 * - Liste 
 * - Ajax
 * 
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * P00accueilL.tpl
 * 
 * menu items are declared in locales/fr.php
 */

/**
 * Chargement du constructeur de classe Table
 * Affectation dans variable dataConflits
 */
	include_once("modules/conflits/tables.class.php");
	$dataConflits = new Conflits($bdd,$ObjetBDDParam);

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
	if (!isset($_SESSION["Raccueil"])) {
		$raccueil = new Raccueil();
		$_SESSION["Raccueil"] = $raccueil;	
	} else {
		$raccueil = $_SESSION["Raccueil"];
	}

	
switch ($t_module["param"]) {	
	case "Liste" :
		/**
		 * Gestion des criteres de recherche
         * Liste des enregistrements de la table 
         */
			
		$raccueil -> setParam($_REQUEST);
		$critere = $raccueil -> getParam();	

		if ($raccueil->isSearch () == 1) {

			$data = $dataConflits->getRaccueil($critere);      
            $smarty->assign ("listeaccueil", $data);
            $smarty->assign ("isSearch", 1);
		}
		
		$smarty->assign("critere",$critere);
		
		/*
		 * Listes déroulantes
		 */		
		$smarty->assign("modtypeconflit", $modalites->getLconflitstypeconflit());
		$smarty->assign("modbsniv1", $modalites->getLconflitsbsniv1());					
		
		/**
		 * Assignation à smarty
 		 */
		$smarty->assign("corps","display/templates/conflits/conflits/P00accueilL.tpl");		
		
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
