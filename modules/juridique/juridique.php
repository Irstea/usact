<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 25 août 2015
 */
require_once 'modules/classes/juridique.class.php';
$dataClass = new Juridique ( $bdd, $ObjetBDDParam );
$keyName = "juridique_id";
$id = $_REQUEST [$keyName];

switch ($t_module ["param"]) {
	case "list":
		/*
		 * Display the list of all records of the table
		 */
		$searchJuridique->setParam ( $_REQUEST );
		$dataSearch = $searchJuridique->getParam ();
		if ($searchJuridique->isSearch () == 1) {
			$data = $dataClass->getListeSearch ( $dataSearch );
			$smarty->assign ( "juridique", $data );
			$smarty->assign ( "isSearch", 1 );
		}
		$smarty->assign ( "dataSearch", $dataSearch );
		$smarty->assign ( "corps", "juridique/juridiqueListSearch.tpl" );
		require_once 'modules/juridique/juridique.function.php';
		setSmartyJuridiqueParam ();
		$_SESSION ["conflit_table"] = "juridique";
		break;
	case "display":
			/*
			 * Display the detail of the record
			 */
			$data = $dataClass->getDetail ( $id );
		$smarty->assign ( "juridique", $data );
		$smarty->assign ( "corps", "juridique/juridiqueDisplay.tpl" );
		/*
		 * Recuperation des conflits rattaches
		 */
		require_once 'modules/classes/conflit.class.php';
		$conflit = new Conflit ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "conflit", $conflit->getListFromJuridique ( $id ) );
		$interventionJuridique = new InterventionJuridique ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "intervention_juridique", $interventionJuridique->getListFromJuridique ( $id ) );
		/*
		 * Gestion des documents
		 */
		require_once 'modules/classes/document.class.php';
		$document = new DocumentLie($bdd, $ObjetBDDParam,"juridique");
		$smarty->assign("dataDoc", $document->getListeDocument($id));
		$smarty->assign("moduleParent", "juridiqueDisplay");
		$smarty->assign("parentIdName", "juridique_id");
		$smarty->assign("parent_id", $id);
		$smarty->assign("parentType", "juridique");
		
		break;
	case "change":
				/*
				 * open the form to modify the record
				 * If is a new record, generate a new record with default value :
				 * $_REQUEST["idParent"] contains the identifiant of the parent record
				 */
		require_once 'modules/juridique/juridique.function.php';
		setSmartyJuridiqueParam ();
		$data = dataRead ( $dataClass, $id, "juridique/juridiqueChange.tpl" );
		break;
	case "write":
					/*
					 * write record in database
					 */
					$id = dataWrite ( $dataClass, $_REQUEST );
		if ($id > 0) {
			$_REQUEST [$keyName] = $id;
		}
		break;
	case "delete":
					/*
					 * delete record
					 */
					dataDelete ( $dataClass, $id );
		break;
	case "getListAjax" :
		/**
		 * Retourne la liste des actes juridiques selon les criteres fournis, au format json
		 */
		$data = $dataClass->getListeSearch ( $_REQUEST );
		echo json_encode ( $data );
}
?>