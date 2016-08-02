<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 18 août 2015
 */

require_once 'modules/classes/parametre.class.php';
/**
 * Fonction de recherche et d'envoi a smarty des tables de references
 */
function setSmartyActeurParam() {
	global $smarty, $ObjetBDDParam, $bdd;
	$acteur_niv3 = new Acteur_niv3( $bdd, $ObjetBDDParam );
	$smarty->assign ( "acteur_niv3", $acteur_niv3->getListe () );
	$bien_support_niv2 = new Parametre_niv2( $bdd,"bien_support_niv2", "bien_support_niv1", $ObjetBDDParam );
	$smarty->assign ( "bien_support_niv2", $bien_support_niv2->getListe () );
	$mandat_type = new Parametre($bdd, "mandat_type", $ObjetBDDParam);
	$smarty->assign("mandat_type", $mandat_type->getListe());
	$structure_type= new Parametre($bdd, "structure_type", $ObjetBDDParam);
	$smarty->assign("structure_type", $structure_type->getListe());
	$particulier_resident_type = new Parametre($bdd, "particulier_resident_type", $ObjetBDDParam);
	$smarty->assign("particulier_resident_type", $particulier_resident_type->getListe());
	$acteur_statut = new Parametre($bdd, "acteur_statut");
	$smarty->assign("acteur_statut", $acteur_statut->getListe());
}

?>