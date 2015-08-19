<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 18 août 2015
 */
include_once 'modules/classes/acteur.class.php';
require_once 'modules/acteur/acteur.function.php';

$dataClass = new Acteur($bdd,$ObjetBDDParam);
$keyName = "acteur_id";
$id = $_REQUEST[$keyName];

switch ($t_module["param"]) {
	case "list":
		/*
		 * Display the list of all records of the table
		 */
		$searchActeur->setParam ( $_REQUEST );
		$dataSearch = $searchActeur->getParam ();
		if ($searchActeur->isSearch () == 1) {
			$data = $dataClass->getListeSearch ( $dataSearch );
			$smarty->assign ( "data", $data );
			$smarty->assign ("isSearch", 1);
		}
		$smarty->assign ("dataSearch", $dataSearch);
		$smarty->assign("corps", "acteur/acteurListSearch.tpl");
		setSmartyActeurParam();
		$_SESSION["conflit_table"] = "acteur";
		break;
	case "display":
		/*
		 * Display the detail of the record
		 */
		$data = $dataClass->getDetail($id);
		$smarty->assign("acteur", $data);
		$smarty->assign("corps", "acteur/acteurDisplay.tpl");
		$acteurMandat = new ActeurMandat($bdd, $ObjetBDDParam);
		$smarty->assign("acteur_mandat", $acteurMandat->getListFromActeur($id));
		$acteurStructure = new ActeurStructure($bdd, $ObjetBDDParam);
		$smarty->assign("acteur_structure", $acteurStructure->getListFromActeur($id));
		break;
	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		dataRead($dataClass, $id, "acteur/acteurChange.tpl");
		setSmartyActeurParam();
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