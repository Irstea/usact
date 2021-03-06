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
		$action = new Action($bdd, $ObjetBDDParam);
		$smarty->assign("action", $action->getListFromIntervention($id));
		$revendication = new Revendication($bdd, $ObjetBDDParam);
		$smarty->assign("revendication", $revendication->getListFromIntervention($id));
		require_once 'modules/classes/article.class.php';
		$article = new Article($bdd, $ObjetBDDParam);
		$smarty->assign("article", $article->getListFromIntervention($id));
		require_once 'modules/classes/resolution.class.php';
		$solution = new Solution($bdd, $ObjetBDDParam);
		$smarty->assign("solution_proposee", $solution->getListFromIntervention($id));
		require_once 'modules/classes/juridique.class.php';
		$ij = new InterventionJuridique($bdd, $ObjetBDDParam);
		$smarty->assign("intervention_juridique", $ij->getListFromIntervention($id));
		require_once 'modules/classes/entretien.class.php';
		$entretien = new Entretien($bdd, $ObjetBDDParam);
		$smarty->assign("entretien", $entretien->getListFromIntervention($id));
		break;
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
		require_once 'modules/classes/parametre.class.php';
		$objet_niv2 = new Parametre_niv2( $bdd,"objet_niv2", "objet_niv1", $ObjetBDDParam );
		$smarty->assign ( "objet_niv2", $objet_niv2->getListe () );
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
		
		case "getListAjaxJson":
			/*
			 * Recherche la liste et la retourne au format Ajax
			 */
			if (strlen($_REQUEST["libelle"]) > 0) {
				$data = $dataClass->getSearchFromActeur($_REQUEST["libelle"]);
		
				echo json_encode ($data) ;
			}
			break;
		
}

?>