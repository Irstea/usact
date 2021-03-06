<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 19 août 2015
 */
include_once 'modules/classes/acteur.class.php';
$dataClass = new ActeurStructure($bdd,$ObjetBDDParam);
$keyName = "acteur_structure_id";
$id = $_REQUEST[$keyName];

switch ($t_module["param"]) {

	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		dataRead($dataClass, $id, "acteur/acteur_structureChange.tpl", $_REQUEST["acteur_id"]);
		require_once 'modules/classes/parametre.class.php';
		$structureType = new Parametre($bdd, "structure_type", $ObjetBDDParam);
		$smarty->assign("structure_type", $structureType->getListe(1));
		$structure_statut = new Parametre($bdd, "structure_statut");
		$smarty->assign("structure_statut", $structure_statut->getListe());
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