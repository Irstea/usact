<?php
/**
 * Gestion table acteurs :
 * - Liste
 * - Modif
 * - Ecrire
 * 
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * P04acteursL, P04acteursM, P04acteursE
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
	$dataActeurs = new Acteurs($bdd,$ObjetBDDParam);
	
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
	if (!isset($_SESSION["Racteurs"])) {
		$racteurs = new Racteurs();
		$_SESSION["Racteurs"] = $racteurs;	
	} else {
		$racteurs = $_SESSION["Racteurs"];
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
		
		/**
         * Details de l'enregistrement de la table conflits + conflitsexpr + ville + localisation + article
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
				

		/**
		 * Gestion des criteres de recherche
         * Liste des enregistrements de la table 
         */
		
		$racteurs -> setParam($_REQUEST);
		$critereact = $racteurs -> getParam();	

		if ($racteurs->isSearch () == 1) {

			$data = $dataActeurs->getRacteurs($critereact);      
            $smarty->assign ("listeacteurs", $data);
            $smarty->assign ("isSearch", 1);
			
		}
	
		$smarty->assign("critereact",$critereact);
				
		/**
		 * Assignation à smarty 
 		 */		
		$smarty->assign("corps","display/templates/conflits/conflits/P04acteursL.tpl");
		
	break;
		
	
	case "Modif" :
		/** 
		 * Assigne les identifiants dans les URLs
		 */		
		$smarty->assign("idconflit",$idconflit);	
		$smarty->assign("idconflitexpr",$idconflitexpr);	
		
		$smarty->assign("idville",$idville);	
		$smarty->assign("idlocalisation",$idlocalisation);
		
		$smarty->assign("idarticle",$idarticle);
		$smarty->assign("idacteur",$idacteur);	
		
		/**
		 * Listes déroulante fixe
		 */
		$smarty->assign("modstatutacteur", $modalites->getLacteursstatutacteur());
		$smarty->assign("modniveau1", $modalites->getLacteursniveau1());		
		$smarty->assign("modstatut", $modalites->getLacteursstatut());		
		$smarty->assign("modparticulier", $modalites->getLacteursparticulier());
		
		/**
		 * Assignation à smarty
 		 */
		$smarty->assign("corps","display/templates/conflits/conflits/P04acteursM.tpl");
		
		/**
		 * Lecture des données
		 */
		dataRead($dataActeurs, $idacteur, "display/templates/conflits/conflits/P04acteursM.tpl");
		
	break;
		
	case "Ecrire" :
		/**
		 * Enregistrement des données
		 */
		if (isset($_REQUEST["Enre_Facteurs"])){
			dataWrite($dataActeurs, $_REQUEST);		
		} 
		
	break;
		
	case "Ajax":
		/**
		 * Listes déroulante dynamiques au format ajax
		 */		
		$libelleNiveau1=pg_escape_string($_REQUEST["libelleNiveau1"]);
		$modalites->getLacteursniveau2($libelleNiveau1);
		
		$libelleNiveau2=pg_escape_string($_REQUEST["libelleNiveau2"]);
		$modalites->getLacteursniveau3($libelleNiveau2);	
		
	break;
}
?>

