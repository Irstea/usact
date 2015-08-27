<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 27 août 2015
 */
 
include_once 'modules/classes/juridique.class.php';
$dataClass = new InterventionJuridique( $bdd, $ObjetBDDParam );
$keyName = "intervention_juridique_id";
$id = $_REQUEST [$keyName];

switch ($t_module ["param"]) {


	/*
	 * open the form to modify the record
	 * If is a new record, generate a new record with default value :
	 * $_REQUEST["idParent"] contains the identifiant of the parent record
	 */
	case "change":
		$data = dataRead ( $dataClass, $id, "juridique/intervention_juridiqueChange.tpl", $_REQUEST["intervention_id"] );
		if ($data["juridique_id"] > 0) {
			$juridique = new Juridique($bdd, $ObjetBDDParam);
			$smarty->assign("juridique", $juridique->getDetail($data["juridique_id"]));
		}
		/*
		 * Recuperation des tables de parametres pour la recherche des actes juridiques
		 */
		require_once 'modules/classes/parametre.class.php';
		$juridiction = new Parametre($bdd, "juridiction", $ObjetBDDParam);
		$smarty->assign("juridiction", $juridiction->getListe());
		$natureRequete = new Parametre($bdd, "nature_requete", $ObjetBDDParam);
		$smarty->assign("nature_requete", $natureRequete->getListe());
		$position_acteur = new Parametre($bdd, "position_acteur", $ObjetBDDParam);
		$smarty->assign("position_acteur", $position_acteur->getListe());
		$qualite_appel = new Parametre($bdd, "qualite_appel", $ObjetBDDParam);
		$smarty->assign("qualite_appel", $qualite_appel->getListe());
		
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