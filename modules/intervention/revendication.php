<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 20 août 2015
 */
 
include_once 'modules/classes/intervention.class.php';
$dataClass = new Revendication($bdd,$ObjetBDDParam);
$keyName = "revendication_id";
$id = $_REQUEST[$keyName];

switch ($t_module["param"]) {
	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		dataRead($dataClass, $id, "intervention/revendicationChange.tpl", $_REQUEST["intervention_id"]);
		require_once 'modules/classes/parametre.class.php';
		$revendication_niv2 = new Parametre_niv2($bdd, "revendication_niv2", "revendication_niv1", $ObjetBDDParam);
		$smarty->assign("revendication_niv2", $revendication_niv2->getListe());
		$registre_argument_niv2 = new Parametre_niv2($bdd, "registre_argument_niv2", "registre_argument_niv1", $ObjetBDDParam);
		$smarty->assign("registre_argument_niv2", $registre_argument_niv2->getListe());
		$revend_support_niv2 = new Parametre_niv2($bdd, "revend_support_niv2", "revend_support_niv1", $ObjetBDDParam);
		$smarty->assign("revend_support_niv2", $revend_support_niv2->getListe());
		

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