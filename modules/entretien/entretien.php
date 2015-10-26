<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 20 août 2015
 */
 
include_once 'modules/classes/entretien.class.php';
$dataClass = new Entretien($bdd,$ObjetBDDParam);
$keyName = "entretien_id";
$id = $_REQUEST[$keyName];

switch ($t_module["param"]) {
	case "display":
		/*
		 * Display the detail of the record
		 */
		$data = $dataClass->lire($id);
		$smarty->assign("entretien", $data);
		$smarty->assign("corps", "entretien/entretienDisplay.tpl");
		$expert = new Expert($bdd,$ObjetBDDParam);
		$smarty->assign("expert", $expert->lire($data["expert_id"]));
		/*
		 * Tables liees
		 */
		require_once 'modules/classes/conflit.class.php';
		$conflit = new Conflit($bdd, $ObjetBDDParam);
		$smarty->assign("conflit", $conflit->getListFromEntretien($id));
		require_once 'modules/classes/intervention.class.php';
		$intervention = new Intervention($bdd, $ObjetBDDParam);
		$smarty->assign("intervention", $intervention->getListFromEntretien($id));
		/*
		 * Gestion des documents
		 */
		require_once 'modules/classes/document.class.php';
		$document = new DocumentLie($bdd, $ObjetBDDParam,"entretien");
		$smarty->assign("dataDoc", $document->getListeDocument($id));
		$smarty->assign("moduleParent", "entretienDisplay");
		$smarty->assign("parentIdName", "entretien_id");
		$smarty->assign("parent_id", $id);
		$smarty->assign("parentType", "entretien");
		
		break;
	
	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		$data = dataRead($dataClass, $id, "entretien/entretienChange.tpl", $_REQUEST["expert_id"]);
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