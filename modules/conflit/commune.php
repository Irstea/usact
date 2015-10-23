<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 23 oct. 2015
 */
include_once 'modules/classes/localisation.class.php';
$dataClass = new Commune ( $bdd, $ObjetBDDParam );
$keyName = "insee";
$id = $_REQUEST [$keyName];

switch ($t_module ["param"]) {
	case "list":
		/*
		 * Display the list of all records of the table
		 */
		break;
	case "display":
		/*
		 * Display the detail of the record
		 */
		break;
	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		break;
	case "write":
		/*
		 * write record in database
		 */
		break;
	case "delete":
		/*
		 * delete record
		 */
		break;
	case "search":
		/*
		 * Recherche d'une commune, en mode ajax
		 */
		echo json_encode ( $dataClass->search ( $_REQUEST ["value"] ) );
}

?>