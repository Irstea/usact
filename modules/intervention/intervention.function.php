<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 19 août 2015
 */
require_once 'modules/classes/parametre.class.php';
/**
 * Fonction de recherche et d'envoi a smarty des tables de references
 */
function setSmartyInterventionParam() {
	global $smarty, $ObjetBDDParam, $bdd;
	$usage_activite_niv2 = new Parametre_niv2( $bdd,"usage_activite_niv2", "usage_activite_niv1", $ObjetBDDParam );
	$smarty->assign ( "usage_activite_niv2", $usage_activite_niv2->getListe () );
	$role = new Parametre($bdd, "role", $ObjetBDDParam);
	$smarty->assign("role", $role->getListe());
	$position_usage_activite= new Parametre($bdd, "position_usage_activite", $ObjetBDDParam);
	$smarty->assign("position_usage_activite", $position_usage_activite->getListe());
}

?>