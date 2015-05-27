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
include_once 'modules/classes/type_perimetre.class.php';
$dataClass = new typePerimetre( $bdd, $ObjetBDDParam );
$id = $_REQUEST ["id"];

switch ($t_module ["param"]) {
	
	/*
	 * Display the list of all records of the table 
	 */
	/*
	 * Gestion des criteres de recherche
	 */
	case "list":
		$searchTypePerimetre->setParam ( $_REQUEST );
		$dataRecherche = $searchTypePerimetre->getParam ();
		$data = $dataClass->getListeSearch ( $dataRecherche );
		$smarty->assign ( "data", $data );
		$smarty->assign ( "isSearch", 1 );		
		$smarty->assign ( "typePerimetreSearch", $dataRecherche );
		$smarty->assign ( "corps", "perimetre/typePerimetreListe.tpl" );
		break;
		
	/*
	 * Display the detail of the record
	*/
	case "display":
		$data = $dataClass->lireDetail ( $id );
		$smarty->assign ( "data", $data );
		$smarty->assign ( "corps", "perimetre/typePerimetreDisplay.tpl" );
		break;
		
	/*
	* open the form to modify the record
	* If is a new record, generate a new record with default value :
	* $_REQUEST["idParent"] contains the identifiant of the parent record
	*/
	case "change":
		$typePerimetre = new typePerimetre ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "typePerimetre", $typePerimetre->getListe () );		
		dataRead ( $dataClass, $id, "perimetre/typePerimetreChange.tpl" );
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
