<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 24 août 2015
 */
include_once 'modules/classes/article.class.php';
$dataClass = new ArticleIntervention ( $bdd, $ObjetBDDParam );

switch ($t_module ["param"]) {

	case "manage" :
		$article = new Article ( $bdd, $ObjetBDDParam );
		$data = $article->lire ( $_REQUEST ["article_id"] );
		$smarty->assign ( "article", $data );
		require_once 'modules/classes/intervention.class.php';
		$intervention = new Intervention ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "intervention", $intervention->getListFromArticle ( $_REQUEST["article_id"] ) );
		$smarty->assign ( "corps", "article/articleInterventionManage.tpl" );
		require_once 'modules/classes/parametre.class.php';
		$objet_niv2 = new Parametre_niv2( $bdd,"objet_niv2", "objet_niv1", $ObjetBDDParam );
		$smarty->assign ( "objet_niv2", $objet_niv2->getListe () );
		break;
	case "write":
		/*
		 * write record in database
		 */
		dataWrite ( $dataClass, $_REQUEST );
		break;
	case "delete":
		/*
		 * delete record
		 */
		$keys = array (
		"article_id" => $_REQUEST ["article_id"],
		"intervention_id" => $_REQUEST ["intervention_id"]
		);
		dataDelete ( $dataClass, $keys );
		break;
}


?>