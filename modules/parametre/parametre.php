<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 13 août 2015
 */
include_once 'modules/classes/parametre.class.php';
$dataClass = new Parametre($bdd,$t_module["tableName"], $ObjetBDDParam);
$keyName = $t_module["tableName"]."_id";
$id = $_REQUEST[$keyName];
$smarty->assign("tableName", $t_module["tableName"]);

switch ($t_module["param"]) {
	case "list":
		/*
		 * Display the list of all records of the table
		 */

		$smarty->assign("data", $dataClass->generalise($dataClass->getListe(2)));
		$smarty->assign("corps", "parametre/parametreList.tpl");
		break;
	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		$data = dataRead($dataClass, $id, "parametre/parametreChange.tpl");
		$smarty->assign("data", $dataClass->generalise($data, false));
		break;
	case "write":
		/*
		 * write record in database
		 */
		$id = dataWrite($dataClass, $_REQUEST);
		if ($id > 0) {
			$_REQUEST[$keyName] = $id;
		}
		break;
	case "delete":
		/*
		 * delete record
		 */
		dataDelete($dataClass, $id);
		break;
}
?>
