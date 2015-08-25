<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 25 août 2015
 */
 
include_once 'modules/classes/resolution.class.php';
$dataClass = new Solution( $bdd, $ObjetBDDParam );
$keyName = "solution_proposee_id";
$id = $_REQUEST [$keyName];

switch ($t_module ["param"]) {


		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
	case "change":
		setSmartyResolutionParam();
		$data = dataRead ( $dataClass, $id, "resolution/solutionChange.tpl" );
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
		
	case "getListAjaxFromConflit":
		/*
		 * Retourne la liste des solutions proposees correspondant a un conflit au format json
		 */
		if ($_REQUEST["conflit_id"] > 0 && is_numeric($_REQUEST["conflit_id"])) {
			$data = $dataClass->getListFromConflit($_REQUEST["conflit_id"]);
			echo json_encode($data);
		}
}


?>