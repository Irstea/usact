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
include_once 'modules/classes/recurrence.class.php';
$dataClass = new recurrence( $bdd, $ObjetBDDParam );
$id = $_REQUEST ["recurrence_id"];

switch ($t_module ["param"]) {
	
	/*
	 * Display the list of all records of the table 
	 */
	/*
	 * Gestion des criteres de recherche
	 */
	case "list":
		$searchRecurrence->setParam ( $_REQUEST );
		$dataRecherche = $searchRecurrence->getParam ();
		$data = $dataClass->getListeSearch ( $dataRecherche );
		$smarty->assign ( "data", $data );
		$smarty->assign ( "isSearch", 1 );		
		$smarty->assign ( "recurrenceSearch", $dataRecherche );
		$smarty->assign ( "corps", "perimetre/recurrenceListe.tpl" );
		break;
		
	/*
	* open the form to modify the record
	* If is a new record, generate a new record with default value :
	* $_REQUEST["idParent"] contains the identifiant of the parent record
	*/
	case "change":
		$recurrence = new recurrence ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "recurrence", $recurrence->getListe () );		
		dataRead ( $dataClass, $id, "perimetre/recurrenceChange.tpl" );
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