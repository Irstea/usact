<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 23 oct. 2015
 */
 
include_once 'modules/classes/localisation.class.php';
$dataClass = new Localisation( $bdd, $ObjetBDDParam );
$keyName = "localisation_id";
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
		$data = dataRead($dataClass, $id, "conflit/localisationChange.tpl");
		$data["perimetre_id"] = $_REQUEST["perimetre_id"];
		$smarty->assign("data", $data);
		
		break;
	case "write":
		/*
		 * write record in database
		 */
		$id = dataWrite($dataClass, $_REQUEST);
		if ($id > 0) {
			$_REQUEST[$keyName] = $id;
			/*
			 * ajout de la localisation au perimetre
			 */
			require_once 'modules/classes/perimetre.class.php';
			$perimetre = new Perimetre($bdd, $ObjetBDDParam);
			$perimetre->localisationAdd($id, $_REQUEST["perimetre_id"]);
		}
		break;
	case "delete":
		/*
		 * delete record
		 */
		require_once 'modules/classes/perimetre.class.php';
		$perimetre = new Perimetre($bdd, $ObjetBDDParam);
		$perimetre->localisationRemove($id, $_REQUEST["perimetre_id"]);
		$module_coderetour = 2;
		break;
	case "search":
		/*
		 * Recherche d'une commune, en mode ajax
		 */
		echo json_encode ( $dataClass->search ( $_REQUEST ["value"] ) );
}

?>