<?php
/**
 * Gestion table articles:
 * - Modif
 * - Ecrire
 * 
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * P05articlesM, P05articlesE
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
	case "Liste" :
		/** 
		 * Assigne les identifiants dans les URLs
		 */
		$smarty->assign("idconflit",$idconflit);	
		$smarty->assign("idconflitexpr",$idconflitexpr);
			
		$smarty->assign("idville",$idville);	
		$smarty->assign("idlocalisation",$idlocalisation);
		
		$smarty->assign("idarticle",$idarticle);
				
		/**
		 * Gestion des criteres de recherche
         * Liste des enregistrements de la table 
         */
		
		$rarticles -> setParam($_REQUEST);
		$critereart = $rarticles -> getParam();	

		if ($rarticles->isSearch () == 1) {			
				$data = $dataArticles->getRarticles2($critereart);      
           		$smarty->assign ("listearticles2", $data);
            	$smarty->assign ("isSearch", 1);						
		}
	
		$smarty->assign("critereart",$critereart);
				
		/**
		 * Assignation à smarty
 		 */				
		$smarty->assign("corps","display/templates/conflits/conflits/P05articlesL.tpl");
			
	break;
		
	case "Modif" :
		/* 
		 * Assigne les identifiants dans les URLs
		 */
		$smarty->assign("idconflit",$idconflit);	
		$smarty->assign("idconflitexpr",$idconflitexpr);
		
		$smarty->assign("idville",$idville);	
		$smarty->assign("idlocalisation",$idlocalisation);
							
		$smarty->assign("idarticle",$idarticle);				
		
		/**
		 * Listes déroulante fixe
		 */		
		$smarty->assign("modtypeaborde", $modalites->getLarticlestypeaborde());
		
		/**
		 * Assignation à smarty
 		 */		
		$smarty->assign("corps","display/templates/conflits/conflits/P05articlesM.tpl");
		
		/**
		 * Lecture des données
		 */
		dataRead($dataArticles, $idarticle, "display/templates/conflits/conflits/P05articlesM.tpl");
		
	break;
		
	case "Ecrire" :				
		/**
		 * Ecriture de l'enregistrement aborde de la table
		 */		
		if (isset($_REQUEST["Enre_Farticles"])){
			if (isset($idconflitexpr) and isset($_REQUEST["typeaborde"])) {
				
			if ($_REQUEST["numarticle"]==0) {
				/* Récupération derniere identifiant et datawrite */
				$lastvalue = dataWrite($dataArticles, $_REQUEST);				
								
				/* Récupération de la requête selection aborde */
				$select = pg_query("SELECT numconflitexpr, numarticle, typecontenu FROM aborde WHERE numconflitexpr={$idconflitexpr} and numarticle={$lastvalue} ");
				
				/* Récupération du nombre de ligne de la requête selection aborde */
				$number_of_rows = pg_num_rows($select);				
						
				/* Vérification si les données existent en base */
				if ($number_of_rows == 0) { 							
					/* Insertion données table associative */						
					$insert = pg_query("INSERT INTO aborde (numconflitexpr, numarticle, typecontenu) VALUES ('{$idconflitexpr}', '{$lastvalue}', '{$_REQUEST["typeaborde"]}')");
				
					/**
					 * Message en cas d'échec de l'insertion
					 */
					if (!$insert) {								
						$message .= $LANG["message"][12];
						$module_coderetour = 1;		
					} 
				}
				
			} else {
				
				/* datawrite */
				dataWrite($dataArticles, $_REQUEST);			
				
				/* Récupération de la requête selection aborde */
				$select = pg_query("SELECT numconflitexpr, numarticle, typecontenu FROM aborde WHERE numconflitexpr={$idconflitexpr} and numarticle={$_REQUEST["numarticle"]}");
				
				/* Récupération du nombre de ligne de la requête selection aborde */
				$number_of_rows = pg_num_rows($select);
				
				/* Vérification si les données existent en base */
				if ($number_of_rows == 0) { 							
					/* Insertion données table associative */							
					$insert = pg_query("INSERT INTO aborde (numconflitexpr, numarticle, typecontenu) VALUES ('{$idconflitexpr}', '{$_REQUEST["numarticle"]}', '{$_REQUEST["typeaborde"]}')");
				
					/**
					 * Message en cas d'échec de l'insertion
					 */
					if (!$insert) {			
						$message .= $LANG["message"][12];
						$module_coderetour = 1;				
					} 
					
				} else {
					/* Update données table associative */	
					$update = pg_query("UPDATE aborde set typecontenu='{$_REQUEST["typeaborde"]}' where numconflitexpr={$idconflitexpr} and numarticle={$_REQUEST["numarticle"]}");
				
					/**
					 * Message en cas d'échec de l'update
					 */
					if (!$update) {			
						$message .= $LANG["message"][12];
						$module_coderetour = 1;		
					} 					
				}
			}	 
		}	
	} 
		
	break;
	
}

?>

