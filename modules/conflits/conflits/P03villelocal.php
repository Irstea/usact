<?php
/**
 * Gestion des tables ville et localisation :
 * - Modifville
 * - Modiflocalisation
 * - Ecrireville
 * - Ecrirelocalisation
 * 
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * P03villeM, P03villeE, P03localisationM, P03localisationE
 * 
 * menu items are declared in locales/fr.php
 */

/**
 * Chargement du constructeur de classe Table
 * Affectation dans variable
 */
	include_once("modules/conflits/tables.class.php");
	$dataVille = new Ville($bdd,$ObjetBDDParam);
	$dataLocalisation = new Localisation($bdd,$ObjetBDDParam);
	
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
	

switch ($t_module["param"]) {				

	case "Modifville" :
		/**
		 * Assigne les identifiants dans les URLs
		 */
		$smarty->assign("idconflit",$idconflit);
			
		
		/**
		 * Listes déroulantes
		 */
		$smarty->assign("modnomville", $dataVille->getLvillenomville());
		$smarty->assign("moddepartement", $dataVille->getLvilledepartement());
	
		/**
		 * Assignation à smarty
 		 */
		$smarty->assign("corps","display/templates/conflits/conflits/P03villeM.tpl");		
		
		/**
		 * Lecture des données
		 */
		dataRead($dataVille, $idville, "display/templates/conflits/conflits/P03villeM.tpl");
	
	break;
		
	case "Modiflocalis" :
		/**
		 * Assigne les identifiants dans les URLs
		 */
		$smarty->assign("idconflit",$idconflit);	
		$smarty->assign("idville",$idville);	
		
		/**
		 * Listes déroulantes
		 */
		$smarty->assign("modnomlocalisation", $dataLocalisation->getLlocalisationnomlocalisation());
		
		/**
		 * Assignation à smarty
 		 */
		$smarty->assign("corps","display/templates/conflits/conflits/P03localisationM.tpl");		
		
		/**
		 * Lecture des données
		 */
		dataRead($dataLocalisation, $idlocalisation, "display/templates/conflits/conflits/P03localisationM.tpl");
		
	break;
						
	case "Ecrireville" :
		/**
		 * Ecriture de l'enregistrement de la table
		 */
		if (isset($_REQUEST["Enre_Fville"])){
			if (isset($idconflit) and isset($idville)) {					
											
				/* Récupération de la requête selection estsitue */
				$select = pg_query("SELECT numconflit, numeroinsee FROM estsitue WHERE numconflit={$idconflit}");
				
				/* Récupération du nombre de ligne de la requête selection ville */
				$number_of_rows = pg_num_rows($select);
										
				/* Vérification si les données existent en base */
				if ($number_of_rows == 0) { 							
					/* Insertion données table associative */						
					$insert = pg_query("INSERT INTO estsitue (numconflit, numeroinsee) VALUES ('{$idconflit}', '{$_REQUEST["numeroinsee"]}')");
					/**
					 * Message en cas d'échec ou de succes de l'insertion
					 */
						if (!$insert) {	
							$message .= $LANG["message"][12];
							$module_coderetour = 1;	
						} else { 
							$message .= $LANG["message"][5];
							$module_coderetour = 1;	
						} 						
				} 
			}	
		} 
		
		break;

	case "Ecrirelocalis" :
		/**
		 * Ecriture de l'enregistrement de la table
		 */			
		if (isset($_REQUEST["Enre_Flocalis"])){
			if (isset($idconflit) and isset($idlocalisation)) {
				
				if ($_REQUEST["numerolocalisation"]==0) {				
					
					/* Vérification de la variable liste ou texte */				
					if (strlen($_REQUEST["nomlocalisationL"])>0 && strlen($_REQUEST["nomlocalisationT"])==0) {
						/* Création array pour dataWrite */
						$datalocT = array ("module"=>"P03localisationE","numerolocalisation"=>$_REQUEST["numerolocalisation"],"nomlocalisation"=>$_REQUEST["nomlocalisationL"],"numeroinsee"=>$_REQUEST["numeroinsee"],"Enre_Flocalis"=>"Enregistrer");
						/* Récupération derniere identifiant et datawrite */
						$lastvalue = dataWrite($dataLocalisation, $datalocT);
						/* Insertion données table associative */								
						$insert = pg_query("INSERT INTO estlocalise (numconflit, numerolocalisation) VALUES ('{$idconflit}', '{$lastvalue}')");
										
						/**
					 	 * Message en cas d'échec de l'insertion
						 */
						if (!$insert) {			
							$message .= $LANG["message"][12];
							$module_coderetour = 1;												
						}

					} else {
						/* Vérification de la variable liste ou texte */
						if (strlen($_REQUEST["nomlocalisationL"])==0 && strlen($_REQUEST["nomlocalisationT"])>0) {
							/* Création array pour dataWrite */
							$datalocT = array ("module"=>"P03localisationE","numerolocalisation"=>$_REQUEST["numerolocalisation"],"nomlocalisation"=>$_REQUEST["nomlocalisationT"],"numeroinsee"=>$_REQUEST["numeroinsee"],"Enre_Flocalis"=>"Enregistrer");
							/* Récupération derniere identifiant et datawrite */
							$lastvalue = dataWrite($dataLocalisation, $datalocT);
							/* Insertion données table associative */							
							$insert = pg_query("INSERT INTO estlocalise (numconflit, numerolocalisation) VALUES ('{$idconflit}', '{$lastvalue}')");
										
							/**
					 		 * Message en cas d'échec de l'insertion
							 */
							if (!$insert) {	
								$message .= $LANG["message"][12];
								$module_coderetour = 1;												
							}
							
						} else {							
							/**
					 		 * Message en cas erreur variable liste ou texte sur le formulaire
							 */							
							$message .= $LANG["message"][12];
							$module_coderetour = -1;								
						}
					}

				} else {
					/* Vérification de la variable liste ou texte */
					if (strlen($_REQUEST["nomlocalisationL"])>0 && strlen($_REQUEST["nomlocalisationT"])==0) {
						/* Création array pour dataWrite */
						$datalocT = array ("module"=>"P03localisationE","numerolocalisation"=>$_REQUEST["numerolocalisation"],"nomlocalisation"=>$_REQUEST["nomlocalisationL"],"numeroinsee"=>$_REQUEST["numeroinsee"],"Enre_Flocalis"=>"Enregistrer");
						/* Récupération derniere identifiant et datawrite */
						$lastvalue = dataWrite($dataLocalisation, $datalocT);
																		
					} else {
						/* Vérification de la variable liste ou texte */
						if (strlen($_REQUEST["nomlocalisationL"])==0 && strlen($_REQUEST["nomlocalisationT"])>0) {
							/* Création array pour dataWrite */
							$datalocT = array ("module"=>"P03localisationE","numerolocalisation"=>$_REQUEST["numerolocalisation"],"nomlocalisation"=>$_REQUEST["nomlocalisationT"],"numeroinsee"=>$_REQUEST["numeroinsee"],"Enre_Flocalis"=>"Enregistrer");
							/* Récupération derniere identifiant et datawrite */
							$lastvalue = dataWrite($dataLocalisation, $datalocT);
																					
						} else {
							/**
					 		 * Message en cas erreur variable liste ou texte sur le formulaire
							 */							
							$message .= $LANG["message"][12];
							$module_coderetour = -1;	
							
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
		$libellenomville=pg_escape_string($_REQUEST["libellenomville"]);
		$dataVille->getLvilleinsee($libellenomville);
					
	break;
}

?>
