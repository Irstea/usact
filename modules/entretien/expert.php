<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 20 août 2015
 */
 
include_once 'modules/classes/entretien.class.php';
$dataClass = new Expert($bdd,$ObjetBDDParam);
$keyName = "expert_id";
$id = $_REQUEST[$keyName];

switch ($t_module["param"]) {
	case "list":
		/*
		 * Display the list of all records of the table
		 */
		/*
		 * $searchExample must be defined into modules/beforesession.inc.php :
		 * include_once 'modules/classes/searchParam.class.php';
		 * and into modules/common.inc.php :
		 * if (!isset($_SESSION["searchExample"])) {
		 * $searchExample = new SearchExample();
		 *	$_SESSION["searchExample"] = $searchExample;
		 *	} else {
		 *	$searchExample = $_SESSION["searchExample"];
		 *	}
		 * and, also, into modules/classes/searchParam.class.php...
		 */
		$searchExpert->setParam ( $_REQUEST );
		$dataSearch = $searchExpert->getParam ();
		if ($searchExpert->isSearch () == 1) {
			$data = $dataClass->getListeSearch ( $dataSearch );
			$smarty->assign ( "expert", $data );
			$smarty->assign ("isSearch", 1);
		}
		$smarty->assign ("dataSearch", $dataSearch);
		$smarty->assign("corps", "entretien/expertList.tpl");
		$_SESSION["conflit_table"] = "expert";
		break;
	case "display":
		/*
		 * Display the detail of the record
		 */
		$data = $dataClass->lire($id);
		$smarty->assign("expert", $data);
		$smarty->assign("corps", "entretien/expertDisplay.tpl");
		$entretien = new Entretien($bdd, $ObjetBDDParam);
		$smarty->assign("entretien", $entretien->getListFromParent($data["expert_id"]));
		break;
	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		$data = dataRead($dataClass, $id, "entretien/expertChange.tpl");
		if ($data["acteur_id"] > 0) {
			require_once 'modules/classes/acteur.class.php';
			$acteur = new Acteur($bdd,$ObjetBDDParam);
			$smarty->assign("acteur", $acteur->getDetail($data["acteur_id"]));
		}
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