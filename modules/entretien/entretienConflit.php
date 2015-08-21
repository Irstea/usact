<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 21 août 2015
 */
include_once 'modules/classes/entretien.class.php';
$dataClass = new EntretienConflit ( $bdd, $ObjetBDDParam );

switch ($t_module ["param"]) {
	
	case "manage" :
		$entretien = new Entretien ( $bdd, $ObjetBDDParam );
		$data = $entretien->lire ( $_REQUEST ["entretien_id"] );
		$smarty->assign ( "entretien", $data );
		$expert = new Expert ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "expert", $expert->lire ( $data ["expert_id"] ) );
		require_once 'modules/classes/conflit.class.php';
		$conflit = new Conflit ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "conflit", $conflit->getListFromEntretien ( $_REQUEST["entretien_id"] ) );
		$smarty->assign ( "corps", "entretien/entretienConflitManage.tpl" );
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
				"entretien_id" => $_REQUEST ["entretien_id"],
				"conflit_id" => $_REQUEST ["conflit_id"] 
		);
		dataDelete ( $dataClass, $keys );
		break;
}

?>