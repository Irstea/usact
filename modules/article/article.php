<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 24 août 2015
 */
include_once 'modules/classes/article.class.php';
$dataClass = new Article($bdd,$ObjetBDDParam);
$keyName = "article_id";
$id = $_REQUEST[$keyName];

switch ($t_module["param"]) {
	case "list":
		/*
		 * Display the list of all records of the table
		 */
		$searchArticle->setParam ( $_REQUEST );
		$dataSearch = $searchArticle->getParam ();
		if ($searchArticle->isSearch () == 1) {
			$data = $dataClass->getListSearch ( $dataSearch );
			$smarty->assign ( "article", $data );
			$smarty->assign ("isSearch", 1);
		}
		$smarty->assign ("dataSearch", $dataSearch);
		$smarty->assign("corps", "article/articleListSearch.tpl");
		$_SESSION["conflit_table"] = "article";
		require_once 'modules/classes/parametre.class.php';
		$journal = new Parametre($bdd, "journal", $ObjetBDDParam);
		$smarty->assign("journal", $journal->getListe(2));
		break;
	case "display":
		/*
		 * Display the detail of the record
		 */
		$data = $dataClass->lire($id);
		$smarty->assign("article", $data);
		$smarty->assign("corps", "article/articleDisplay.tpl");
		/*
		 * Tables liees
		 */
		require_once 'modules/classes/conflit.class.php';
		$conflit = new Conflit($bdd, $ObjetBDDParam);
		$smarty->assign("conflit", $conflit->getListFromArticle($id));
		require_once 'modules/classes/intervention.class.php';
		$intervention = new Intervention($bdd, $ObjetBDDParam);
		$smarty->assign("intervention", $intervention->getListFromArticle($id));
		/*
		 * Gestion des documents
		 */
		require_once 'modules/classes/document.class.php';
		$document = new DocumentLie($bdd, $ObjetBDDParam,"article");
		$smarty->assign("dataDoc", $document->getListeDocument($id));
		$smarty->assign("moduleParent", "articleDisplay");
		$smarty->assign("parentIdName", "article_id");
		$smarty->assign("parent_id", $id);
		$smarty->assign("parentType", "article");
		
		break;
	case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		$data = dataRead($dataClass, $id, "article/articleChange.tpl");
		require_once 'modules/classes/parametre.class.php';
		$journal = new Parametre($bdd, "journal", $ObjetBDDParam);
		$smarty->assign("journal", $journal->getListe(2));
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