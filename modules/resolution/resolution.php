<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 24 août 2015
 */
 
include_once 'modules/classes/resolution.class.php';

include_once 'modules/resolution/resolution.function.php';


$dataClass = new Resolution( $bdd, $ObjetBDDParam );
$keyName = "resolution_id";
$id = $_REQUEST [$keyName];

switch ($t_module ["param"]) {

	/*
	 * Display the list of all records of the table
	 */
	/*
	 * Gestion des criteres de recherche
	 */
	case "list":
		$searchResolution->setParam ( $_REQUEST );
		$dataRecherche = $searchResolution->getParam ();
		setSmartyResolutionParam();
		$smarty->assign("table", "resolution");
		if ($searchResolution->isSearch () == 1) {
			$data = $dataClass->getListeSearch ( $dataRecherche );
			$smarty->assign ( "data", $data );
			$smarty->assign ( "isSearch", 1 );
		}
		$smarty->assign ( "dataSearch", $dataRecherche );
		$smarty->assign ( "corps", "resolution/resolutionListe.tpl" );
		$_SESSION["conflit_table"] = "resolution";
		break;

		/*
		 * Display the detail of the record
		 */
	case "display":
		$data = $dataClass->lireDetail ( $id );
		$smarty->assign ( "resolution", $data );
		$smarty->assign ( "corps", "resolution/resolutionDisplay.tpl" );
		break;

		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
	case "change":
		setSmartyResolutionParam();
		$data = dataRead ( $dataClass, $id, "resolution/resolutionChange.tpl" );
		break;

		/*
		 * write record in database
		 */
	case "write":
		$id = dataWrite ( $dataClass, $_REQUEST );
		if ($id > 0) {
			$_REQUEST[$keyName] = $id;
		}
		break;

		/*
		 * delete record
		 */
	case "delete":
		dataDelete ( $dataClass, $id );
		break;
}

?>