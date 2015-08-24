<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 24 août 2015
 */
include_once 'modules/classes/parametre.class.php';

function setSmartyResolutionParam() {
	global $smarty, $ObjetBDDParam, $bdd;
	$resolution_mode_niv2 = new Parametre_niv2( $bdd,"resolution_mode_niv2", "resolution_mode_niv1", $ObjetBDDParam );
	$smarty->assign ( "resolution_mode_niv2", $resolution_mode_niv2->getListe () );
	$resolution_acteur = new Parametre($bdd, "resolution_acteur", $ObjetBDDParam);
	$smarty->assign("resolution_acteur", $resolution_acteur->getListe());
	$resolution_echelle = new Parametre($bdd, "resolution_echelle", $ObjetBDDParam);
	$smarty->assign("resolution_echelle", $resolution_echelle->getListe());
	$resolution_nature = new Parametre($bdd, "resolution_nature", $ObjetBDDParam);
	$smarty->assign("resolution_nature", $resolution_nature->getListe());
}

?>