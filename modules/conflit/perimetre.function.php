<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 17 août 2015
 */
require_once 'modules/classes/localisation.class.php';
function setSmartyPerimetreParam() {
	global $smarty, $ObjetBDDParam, $bdd;
	$objet_niv2 = new Parametre_niv2( $bdd,"objet_niv2", "objet_niv1", $ObjetBDDParam );
	$smarty->assign ( "objet_niv2", $objet_niv2->getListe () );
	$bien_support_niv2 = new Parametre_niv2( $bdd,"bien_support_niv2", "bien_support_niv1", $ObjetBDDParam );
	$smarty->assign ( "bien_support_niv2", $bien_support_niv2->getListe () );
	$type_perimetre = new Parametre($bdd, "type_perimetre", $ObjetBDDParam);
	$smarty->assign("type_perimetre", $type_perimetre->getListe());
	$echelle= new Parametre($bdd, "echelle", $ObjetBDDParam);
	$smarty->assign("echelle", $echelle->getListe());
	$recurrence = new Parametre($bdd, "recurrence", $ObjetBDDParam);
	$smarty->assign("recurrence", $recurrence->getListe());
	$commune = new Commune($bdd, $ObjetBDDParam);
	$smarty->assign("commune", $commune->getListe(1));
}

?>