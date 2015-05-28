<?php
/**
 * Example of a gestion from a table :
 * - display the list
 * - show detail
 * - modify record
 * - write or delete data in database
 *
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * exampleListe, exampleDetail, exampleModif, exampleWrite exampleDelete
 *
 * menu items are declared in locales/fr.php
 */
include_once 'modules/classes/bien_support_niv2.class.php';
include_once 'modules/classes/bien_support_niv1.class.php';
$dataClass = new bienSupportNiv2( $bdd, $bien_supportBDDParam );
$id = $_REQUEST ["id"];

switch ($t_module ["param"]) {
	
	/*
	 * Display the list of all records of the table 
	 */
	/*
	 * Gestion des criteres de recherche
	 */
	case "list":
		$searchBienSupportNiv2->setParam ( $_REQUEST );
		$dataRecherche = $searchBienSupportNiv2->getParam ();
		$data = $dataClass->getListeSearch ( $dataRecherche );
		$smarty->assign ( "data", $data );
		$smarty->assign ( "isSearch", 1 );
		$smarty->assign ( "bienSupportNiv2Search", $dataRecherche );
		$smarty->assign ( "corps", "perimetre/bienSupportNiv2Liste.tpl" );
		break;
		
		/*
		 * Recherche la liste et la retourne au format Ajax
		 */
		/*if (strlen($_REQUEST["bien_support_niv2_libelle"]) > 0) {
			$data = $dataClass->getListByName($_REQUEST["bien_support_niv2_libelle"]);
			$dataJson = array();
			$i = 0;*/
			/*
			 * Mise en forme du tableau pour etre facile a manipuler cote client
			 */
			/*foreach ($data as $key => $value) {
				$dataJson[$i]["id"] = $value["bien_support_niv2_id"];
				$valeur = $value["bien_support_niv2_libelle"];
				if (strlen($value["bien_support_niv2_id"]) > 0 ) {
					$valeur .= " - ".$value["bien_support_niv2_id"];
				}
				if (strlen($value["bien_support_niv1_id"]) > 0 ) {
					$valeur .= " - ".$value["bien_support_niv1_id"];
				}
				if (strlen($value["bien_support_niv2_libelle"]) > 0 ) {
					$valeur .= " - ".$value["bien_support_niv2_libelle"];
				}
				$dataJson[$i]["val"] = $valeur;
				$i ++;
			}
			echo json_encode ($dataJson) ;
		}
		break;*/
		
	/*
	 * Display the detail of the record
	*/
	case "display":
		$data = $dataClass->lireDetail ( $id );
		$smarty->assign ( "data", $data );
		$smarty->assign ( "corps", "perimetre/bienSupportNiv2Display.tpl" );
		break;
		
	/*
	* open the form to modify the record
	* If is a new record, generate a new record with default value :
	* $_REQUEST["idParent"] contains the identifiant of the parent record
	*/
	case "change":
		$bienSupportNiv2 = new bienSupportNiv2 ( $bdd, $bienSupportBDDParam );
		$smarty->assign ( "bien_support_niv2", $bienSupportNiv2->getListe () );
		$bienSupportNiv1 = new bienSupportNiv1 ( $bdd, $bienSupportBDDParam );
		$smarty->assign ( "bien_support_niv1", $bienSupportNiv1->getListe () );
		dataRead ( $dataClass, $id, "perimetre/bienSupportNiv2Change.tpl" );
		break;

	/*
	* write record in database
	*/
	case "write":
		dataWrite ( $dataClass, $_REQUEST );
		break;
		
	/*
	* delete record
	*/
	case "delete":
		dataDelete ( $dataClass, $id );
		break;
}
?>
