<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 24 août 2015
 */
include_once 'modules/classes/resolution.class.php';

include_once 'modules/resolution/resolution.function.php';

$dataClass = new Resolution ( $bdd, $ObjetBDDParam );
$keyName = "resolution_id";
$id = $_REQUEST [$keyName];

switch ($t_module ["param"]) {
	
	/*
	 * Display the list of all records of the table
	 */
	/*
	 * Gestion des criteres de recherche
	 */
	case "list" :
		$searchResolution->setParam ( $_REQUEST );
		$dataRecherche = $searchResolution->getParam ();
		setSmartyResolutionParam ();
		$smarty->assign ( "table", "resolution" );
		if ($searchResolution->isSearch () == 1) {
			$data = $dataClass->getListeSearch ( $dataRecherche );
			$smarty->assign ( "resolution", $data );
			$smarty->assign ( "isSearch", 1 );
		}
		$smarty->assign ( "dataSearch", $dataRecherche );
		$smarty->assign ( "corps", "resolution/resolutionListSearch.tpl" );
		$_SESSION ["conflit_table"] = "resolution";
		break;
	
	/*
	 * Display the detail of the record
	 */
	case "display" :
		$data = $dataClass->lireDetail ( $id );
		$smarty->assign ( "resolution", $data );
		$smarty->assign ( "corps", "resolution/resolutionDisplay.tpl" );
		if ($data ["conflit_id"] > 0) {
			require_once 'modules/classes/conflit.class.php';
			$conflit = new Conflit ( $bdd, $ObjetBDDParam );
			$smarty->assign ( "conflit", $conflit->lireDetail ( $data ["conflit_id"] ) );
			$solution = new Solution ( $bdd, $ObjetBDDParam );
		}
		if ($data["solution_proposee_id"] > 0) {
			$solution = new Solution ( $bdd, $ObjetBDDParam );
			$smarty->assign("solution_proposee", $solution->getDetail($data["solution_proposee_id"]));
		}
		break;
	
	/*
	 * open the form to modify the record
	 * If is a new record, generate a new record with default value :
	 * $_REQUEST["idParent"] contains the identifiant of the parent record
	 */
	case "change" :
		setSmartyResolutionParam ();
		$data = dataRead ( $dataClass, $id, "resolution/resolutionChange.tpl" );
		if ($id == 0 && $_REQUEST["conflit_id"] > 0 && is_numeric($_REQUEST["conflit_id"])) {
			$data["conflit_id"] = $_REQUEST["conflit_id"];
			$smarty->assign("data", $data);
		}
		if ($data ["conflit_id"] > 0) {
			require_once 'modules/classes/conflit.class.php';
			$conflit = new Conflit ( $bdd, $ObjetBDDParam );
			$smarty->assign ( "conflit", $conflit->lireDetail ( $data ["conflit_id"] ) );
			$solution = new Solution ( $bdd, $ObjetBDDParam );
			$smarty->assign ( "solution_proposee", $solution->getListFromConflit ( $data ["conflit_id"] ) );
		}
		require_once 'modules/classes/parametre.class.php';
		$objet = new Parametre_niv2($bdd, "objet_niv2", "objet_niv1", $ObjetBDDParam);
		$smarty->assign("objet_niv2", $objet->getListe());
		break;
	
	/*
	 * write record in database
	 */
	case "write" :
		$id = dataWrite ( $dataClass, $_REQUEST );
		if ($id > 0) {
			$_REQUEST [$keyName] = $id;
		}
		break;
	
	/*
	 * delete record
	 */
	case "delete" :
		dataDelete ( $dataClass, $id );
		break;
}

?>