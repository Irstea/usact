<?php
/**
 * Gestion table interventions :
 * - Liste
 * - Liste2
 * - Modif
 * - Ecrire
 * 
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * P06interventionsL, P06interventionsL2, P06interventionsM, P06interventionsE
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
	$dataModesaction = new Modesaction($bdd,$ObjetBDDParam);
	$dataRevendications = new Revendications($bdd,$ObjetBDDParam);
	$dataSolutions = new Solutions($bdd,$ObjetBDDParam);
		
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
	if (!isset($_SESSION["Rinterventions"])) {
		$rinterventions = new Rinterventions();
		$_SESSION["Rinterventions"] = $rinterventions;	
	} else {
		$rinterventions = $_SESSION["Rinterventions"];
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
		
		/**
         * Details de l'enregistrement de la table conflits + conflitsexpr + ville + localisation + article + acteur
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

		
		/**
		 * Gestion des criteres de recherche
         * Liste des enregistrements de la table 
         */		
		$rinterventions -> setParam($_REQUEST);
		$critere = $rinterventions -> getParam();	
		
		if ($rinterventions->isSearch () == 1) {
			if (isset ($idacteur) && ($idacteur > 0) && isset ($idconflitexpr) && ($idconflitexpr > 0) && isset ($idarticle) && ($idarticle > 0)) {
				$data = $dataInterventions->getRinterventions($idacteur, $idconflitexpr, $idarticle, $critere);      
           		$smarty->assign ("listeinterventions", $data);
           		$smarty->assign ("isSearch", 1);
			}			
		}				
	
		$smarty->assign("critere",$critere);
				
		/**
		 * Assignation à smarty
 		 */		
		$smarty->assign("corps","display/templates/conflits/conflits/P06interventionsL.tpl");
		
	break;
	
	case "Liste2" :
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
		
		/**
		 * Gestion des criteres de recherche
         * Liste de tous les enregistrements de la table 
         */		
		$rinterventions -> setParam($_REQUEST);
		$critere = $rinterventions -> getParam();	
		
		if ($rinterventions->isSearch () == 1) {
			if (isset ($idacteur) && ($idacteur > 0) && isset ($idconflitexpr) && ($idconflitexpr > 0)) {
				$data = $dataInterventions->getRinterventions2($idacteur, $idconflitexpr, $critere);      
           		$smarty->assign ("listeinterventions2", $data);
           		$smarty->assign ("isSearch", 1);
			}			
		}		
	
		$smarty->assign("critere",$critere);
				
		/**
		 * Assignation à smarty
 		 */		
		$smarty->assign("corps","display/templates/conflits/conflits/P06interventionsL2.tpl");
		
	break;
	
	case "Detail" :	
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
		
		/**
         * Details de l'enregistrement de la table conflits + conflitsexpr + ville + localisation + article + acteur + interv
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
		
        /**
		 * Liste des enregistrements de la table interventions
		 */
		if (isset ($idinterv) && ($idinterv > 0)) {
       		 $data = $dataModesaction->getRmodesaction($idinterv, $critere);      
       		 $smarty->assign ("listemodesaction", $data);
        }
        
        /**
		 * Liste des enregistrements de la table revendications
		 */
		if (isset ($idinterv) && ($idinterv > 0)) {
        	$data = $dataRevendications->getRrevendications($idinterv, $critere);      
        	$smarty->assign ("listerevendications", $data);
		} 
		
		/**
		 * Liste des enregistrements de la table solutions
		 */
		if (isset ($idinterv) && ($idinterv > 0)) {
        	$data = $dataSolutions->getRsolutions($idinterv, $critere);      
       		$smarty->assign ("listesolutions", $data);
        }
                       
		/**
		 * Assignation à smarty 
 		 */	        	
		$smarty->assign("corps","display/templates/conflits/conflits/P06interventionsD.tpl");
				
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
		
		/**
		 * Listes déroulante fixe
		 */
		$smarty->assign("modrole", $modalites->getLinterventionsrole());
		$smarty->assign("modposusagact", $modalites->getLinterventionsposusagact());
		
		
		/**
		 * Assignation à smarty
 		 */
		$smarty->assign("corps","display/templates/conflits/conflits/P06interventionsM.tpl");
		
		/*
		 * Lecture des données
		 */		
		dataRead($dataInterventions, $idinterv, "display/templates/conflits/conflits/P06interventionsM.tpl",$idconflitexpr);
		
	break;
		
	case "Ecrire" :
				
		/**
		 * Ecriture de l'enregistrement aborde de la table
		 */
		if (isset($_REQUEST["Enre_Finterventions"])){
		if (isset($idarticle) and isset($idinterv)) {
			
			if ($_REQUEST["numinterv"]==0) {				
				/* Récupération derniere identifiant et datawrite */
				$lastvalue = dataWrite($dataInterventions, $_REQUEST);
										
				/* Récupération de la requête selection cite */
				$select = pg_query("SELECT numarticle, numinterv  FROM cite WHERE numarticle={$idarticle} and numinterv={$lastvalue}");
				
				/* Récupération du nombre de ligne de la requête selection cite */
				$number_of_rows = pg_num_rows($select);
			
				/* Vérification si les données existent en base */
				if ($number_of_rows == 0) { 
					/* Insertion données table associative */	
					$insert = pg_query("INSERT INTO cite (numarticle, numinterv) VALUES ('{$idarticle}', '{$lastvalue}')");
				
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
				dataWrite($dataInterventions, $_REQUEST);
								
				/* Récupération de la requête selection cite */
				$select = pg_query("SELECT numarticle, numinterv  FROM cite WHERE numarticle={$idarticle} and numinterv={$_REQUEST["numinterv"]}");
				
				/* Récupération du nombre de ligne de la requête selection aborde */
				$number_of_rows = pg_num_rows($select);
				
				/* Vérification si les données existent en base */
				if ($number_of_rows == 0) { 							
					/* Insertion données table associative */							
					$insert = pg_query("INSERT INTO cite (numarticle, numinterv) VALUES ('{$idarticle}', '{$_REQUEST["numinterv"]}')");
				
					/**
					 * Message en cas d'échec de l'insertion
					 */
					if (!$insert) {			
						$message .= $LANG["message"][12];
						$module_coderetour = 1;					
					} 
				} 
			}	
		}
	}
	 
					
	break;
		
	case "Ajax":
		/**
		 * Listes déroulante dynamiques au format ajax
		 */
		$libellemodposusagact=pg_escape_string($_REQUEST["libellemodposusagact"]);
		$modalites->getLinterventionsusagniv1($libellemodposusagact);	
		
		$libellemodusagniv1=pg_escape_string($_REQUEST["libellemodusagniv1"]);
		$modalites->getLinterventionsusagniv2($libellemodusagniv1);		
		
	break;
	
}

?>

