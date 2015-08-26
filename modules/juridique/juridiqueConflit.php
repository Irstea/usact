<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 26 août 2015
 */
include_once 'modules/classes/juridique.class.php';
$dataClass = new JuridiqueConflit ( $bdd, $ObjetBDDParam );

switch ($t_module ["param"]) {

	case "manage" :
		$juridique = new Juridique ( $bdd, $ObjetBDDParam );
		$data = $juridique->lire ( $_REQUEST ["juridique_id"] );
		$smarty->assign ( "juridique", $data );
		require_once 'modules/classes/conflit.class.php';
		$conflit = new Conflit ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "conflit", $conflit->getListFromJuridique ( $_REQUEST["juridique_id"] ) );
		$smarty->assign ( "corps", "juridique/juridiqueConflitManage.tpl" );
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
		"juridique_id" => $_REQUEST ["juridique_id"],
		"conflit_id" => $_REQUEST ["conflit_id"]
		);
		dataDelete ( $dataClass, $keys );
		break;
}

?>