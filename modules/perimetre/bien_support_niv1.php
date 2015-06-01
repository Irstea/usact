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
include_once 'modules/classes/bien_support_niv1.class.php';
$dataClass = new bienSupportNiv1( $bdd, $ObjetBDDParam );
$id = $_REQUEST ["bien_support_niv1_id"];

switch ($t_module ["param"]) {
	
	/*
	 * Display the list of all records of the table 
	 */
	/*
	 * Gestion des criteres de recherche
	 */
	case "list":
		$searchBienSupportNiv1->setParam ( $_REQUEST );
		$dataRecherche = $searchBienSupportNiv1->getParam ();
		$data = $dataClass->getListeSearch ( $dataRecherche );
		$smarty->assign ( "data", $data );
		$smarty->assign ( "isSearch", 1 );		
		$smarty->assign ( "bienSupportNiv1Search", $dataRecherche );
		$smarty->assign ( "corps", "perimetre/bienSupportNiv1Liste.tpl" );
		break;
		
	/*
	 * Display the detail of the record
	*/
	case "display":
		$data = $dataClass->lireDetail ( $id );
		$smarty->assign ( "data", $data );
		$smarty->assign ( "corps", "perimetre/bienSupportNiv1Display.tpl" );
		break;
		
	/*
	* open the form to modify the record
	* If is a new record, generate a new record with default value :
	* $_REQUEST["idParent"] contains the identifiant of the parent record
	*/
	case "change":
		$bienSupportNiv1 = new bienSupportNiv1 ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "bienSupportNiv1", $bienSupportNiv1->getListe () );		
		dataRead ( $dataClass, $id, "perimetre/bienSupportNiv1Change.tpl" );
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
