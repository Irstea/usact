<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 25 août 2015
 */
require_once 'modules/classes/parametre.class.php';
function setSmartyJuridiqueParam() {
	global $smarty, $ObjetBDDParam, $bdd;
	$juridique_sous_domaine = new Parametre_niv2( $bdd,"juridique_sous_domaine", "juridique_domaine", $ObjetBDDParam );
	$smarty->assign ( "juridique_sous_domaine", $juridique_sous_domaine->getListe () );
	$juridiction = new Parametre($bdd, "juridiction", $ObjetBDDParam);
	$smarty->assign("juridiction", $juridiction->getListe());
	$nature_requete= new Parametre($bdd, "nature_requete", $ObjetBDDParam);
	$smarty->assign("nature_requete", $nature_requete->getListe());
	$type_ouvrage_perm_constr = new Parametre($bdd, "type_ouvrage_perm_constr", $ObjetBDDParam);
	$smarty->assign("type_ouvrage_perm_constr", $type_ouvrage_perm_constr->getListe());
	$nature_travaux = new Parametre($bdd, "nature_travaux", $ObjetBDDParam);
	$smarty->assign("nature_travaux", $nature_travaux->getListe());
	$decision_cassation = new Parametre($bdd, "decision_cassation", $ObjetBDDParam);
	$smarty->assign("decision_cassation", $decision_cassation->getListe());
	$decision_appel = new Parametre($bdd, "decision_appel", $ObjetBDDParam);
	$smarty->assign("decision_appel", $decision_appel->getListe());
	$acte_contentieux = new Parametre($bdd, "acte_contentieux", $ObjetBDDParam);
	$smarty->assign("acte_contentieux", $acte_contentieux->getListe());	

}

?>