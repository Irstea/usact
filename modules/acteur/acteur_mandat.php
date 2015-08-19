<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 19 août 2015
 */
include_once 'modules/classes/acteur.class.php';
$dataClass = new ActeurMandat($bdd,$ObjetBDDParam);
$keyName = "acteur_mandat_id";
$id = $_REQUEST[$keyName];

switch ($t_module["param"]) {

	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		dataRead($dataClass, $id, "acteur/acteur_mandatChange.tpl", $_REQUEST["acteur_id"]);
		require_once 'modules/classes/parametre.class.php';
		$mandatType = new Parametre($bdd, "mandat_type", $ObjetBDDParam);
		$smarty->assign("mandat_type", $mandatType->getListe(1));
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