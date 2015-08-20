<?php
include_once 'modules/classes/intervention.class.php';
$dataClass = new Action($bdd,$ObjetBDDParam);
$keyName = "action_id";
$id = $_REQUEST[$keyName];

switch ($t_module["param"]) {
	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record 
		 */
		dataRead($dataClass, $id, "intervention/actionChange.tpl", $_REQUEST["intervention_id"]);
		require_once 'modules/classes/parametre.class.php';
		$action_echelle = new Parametre($bdd, "action_echelle", $ObjetBDDParam);
		$smarty->assign("action_echelle", $action_echelle->getListe(1));
		$action_mode = new Parametre($bdd, "action_mode", $ObjetBDDParam);
		$smarty->assign("action_mode", $action_mode->getListe(1));
		$action_type = new Parametre($bdd, "action_type", $ObjetBDDParam);
		$smarty->assign("action_type", $action_type->getListe(1));
		
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