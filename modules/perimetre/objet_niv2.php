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
include_once 'modules/classes/objet_niv2.class.php';
$dataClass = new objetNiv2( $bdd, $ObjetBDDParam );
$id = $_REQUEST ["id"];

switch ($t_module ["param"]) {
	
	/*
	 * Display the list of all records of the table 
	 */
	/*
	 * Gestion des criteres de recherche
	 */
	case "list":
		$searchObjetNiv2->setParam ( $_REQUEST );
		$dataRecherche = $searchObjetNiv2->getParam ();
		if ($searchObjetNiv2->isSearch () == 1) {
			$data = $dataClass->getListeSearch ( $dataRecherche );
			$smarty->assign ( "data", $data );
			$smarty->assign ( "isSearch", 1 );
		}
		$smarty->assign ( "objetNiv2Search", $dataRecherche );
		$smarty->assign ( "corps", "perimetre/objetNiv2Liste.tpl" );
		break;
		
	/*
	 * Display the detail of the record
	*/
	case "display":
		$data = $dataClass->lireDetail ( $id );
		$smarty->assign ( "data", $data );
		$smarty->assign ( "corps", "perimetre/objetNiv2Display.tpl" );
		break;
		
	/*
	* open the form to modify the record
	* If is a new record, generate a new record with default value :
	* $_REQUEST["idParent"] contains the identifiant of the parent record
	*/
	case "change":
		$objetNiv2 = new objetNiv2 ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "objetNiv2", $objetNiv2->getListe () );		
		dataRead ( $dataClass, $id, "perimetre/objetNiv2Change.tpl" );
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
