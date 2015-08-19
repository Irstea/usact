<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 19 août 2015
 */
 
include_once 'modules/classes/intervention.class.php';
require_once 'modules/intervention/intervention.function.php';

$dataClass = new Intervention($bdd,$ObjetBDDParam);
$keyName = "intervention_id";
$id = $_REQUEST[$keyName];

switch ($t_module["param"]) {
	case "list":
		/*
		 * Display the list of all records of the table
		 */
		$searchIntervention->setParam ( $_REQUEST );
		$dataSearch = $searchIntervention->getParam ();
		if ($searchIntervention->isSearch () == 1) {
			$data = $dataClass->getListeSearch ( $dataSearch );
			$smarty->assign ( "intervention", $data );
			$smarty->assign ("isSearch", 1);
		}
		$smarty->assign ("dataSearch", $dataSearch);
		$smarty->assign("corps", "intervention/interventionListSearch.tpl");
		setSmartyInterventionParam();
		$_SESSION["conflit_table"] = "intervention";
		break;
	case "display":
		/*
		 * Display the detail of the record
		 */
		$data = $dataClass->getDetail($id);
		$smarty->assign("intervention", $data);
		$smarty->assign("corps", "intervention/interventionDisplay.tpl");
		require_once 'modules/classes/acteur.class.php';
		$acteur = new Acteur($bdd, $ObjetBDDParam);
		$smarty->assign("acteur", $acteur->getDetail($data["acteur_id"]));
		require_once "modules/classes/conflit.class.php";
		$conflit = new Conflit($bdd, $ObjetBDDParam);
		$smarty->assign("conflit", $conflit->lireDetail($data["conflit_id"]));
/*		$interventionMandat = new InterventionMandat($bdd, $ObjetBDDParam);
		$smarty->assign("intervention_mandat", $interventionMandat->getListFromIntervention($id));
		$interventionStructure = new InterventionStructure($bdd, $ObjetBDDParam);
		$smarty->assign("intervention_structure", $interventionStructure->getListFromIntervention($id));
*/		break;
	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		$data = dataRead($dataClass, $id, "intervention/interventionChange.tpl");
		if ($id == 0) {
			/*
			 * Recuperation des valeurs par defaut, selon l'origine de la creation
			 */
			if (isset($_REQUEST["acteur_id"])&& is_numeric($_REQUEST["acteur_id"])) {
				$data["acteur_id"] = $_REQUEST["acteur_id"];
			}
			if (isset($_REQUEST["conflit_id"])&& is_numeric($_REQUEST["conflit_id"])) {
				$data["conflit_id"] = $_REQUEST["conflit_id"];
			}
			$smarty->assign("data", $data);
		}
		/*
		 * Lecture de l'acteur et du conflit
		 */
		if ($data["acteur_id"] > 0) {
			require_once 'modules/classes/acteur.class.php';
			$acteur = new Acteur($bdd, $ObjetBDDParam);
			$smarty->assign("acteur", $acteur->getDetail($data["acteur_id"]));
		}
		if ($data["conflit_id"] > 0) {
			require_once 'modules/classes/conflit.class.php';
			$conflit = new Conflit($bdd, $ObjetBDDParam);
			$smarty->assign("conflit", $conflit->lireDetail($data["conflit_id"]));
		}
		setSmartyInterventionParam();
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