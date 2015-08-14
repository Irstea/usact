<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 14 août 2015
 */
 
include_once 'modules/classes/parametre.class.php';
$dataClass = new Acteur_niv3($bdd, $ObjetBDDParam);
$keyName = "acteur_niv3_id";
$id = $_REQUEST[$keyName];

switch ($t_module["param"]) {
	case "list":
		/*
		 * Display the list of all records of the table
		 */

		$smarty->assign("data", $dataClass->getListe());
		$smarty->assign("corps", "parametre/acteur_niv3List.tpl");
		break;
	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		$data = dataRead($dataClass, $id, "parametre/acteur_niv3Change.tpl");
		/*
		 * Recuperation des donnees de la table parente
		*/
		$parentClass = new Parametre_niv2($bdd, "acteur_niv2", "acteur_niv1", $ObjetBDDParam);
		$smarty->assign("parentData", $parentClass->generalise($parentClass->getListe()));
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