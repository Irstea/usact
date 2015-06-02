<?php
/**
 * Example of a gestion from a table :
 * - display the list
 * - show detail
 * - modify record
 * - write or delete data in database
 *
 * Smarty templates are in display/templates folder
 * modules are described in param/actions.xml file :
 * exampleListe, exampleDetail, exampleModif, exampleWrite exampleDelete
 *
 * menu items are declared in locales/fr.php
 */
include_once 'modules/classes/perimetre.class.php';
include_once 'modules/classes/echelle.class.php';
include_once 'modules/classes/type_perimetre.class.php';
include_once 'modules/classes/bien_support_niv2.class.php';
include_once 'modules/classes/bien_support_niv1.class.php';
include_once 'modules/classes/objet_niv2.class.php';
include_once 'modules/classes/objet_niv1.class.php';
include_once 'modules/classes/recurrence.class.php';
$dataClass = new perimetre( $bdd, $ObjetBDDParam );
$id = $_REQUEST ["perimetre_id"];

switch ($t_module ["param"]) {
	
	/*
	 * Display the list of all records of the table 
	 */
	/*
	 * Gestion des criteres de recherche
	 */
	case "list":
		$searchPerimetre->setParam ( $_REQUEST );
		$dataRecherche = $searchPerimetre->getParam ();
		$objet_niv2 = new objetNiv2 ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "objet_niv2", $objet_niv2->getListe (2) );
		$bien_support_niv2 = new bienSupportNiv2 ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "bien_support_niv2", $bien_support_niv2->getListe (2) );
		$objet_niv1 = new objetNiv1 ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "objet_niv1", $objet_niv1->getListe (2) );
		$bien_support_niv1 = new bienSupportNiv1 ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "bien_support_niv1", $bien_support_niv1->getListe (2) );
		if ($searchPerimetre->isSearch () == 1) {
			$searchPerimetre = new SearchPerimetre();
			$_SESSION["perimetreSearch"] = $searchPerimetre;
			$data = $dataClass->getListeSearch ( $dataRecherche );
			$smarty->assign ( "data", $data );
			$smarty->assign ( "isSearch", 1 );
		}
		$smarty->assign ( "perimetreSearch", $dataRecherche );
		$smarty->assign ( "corps", "perimetre/perimetreListe.tpl" );
		break;
		
	/*
	 * Display the detail of the record
	*/
	case "display":
		$data = $dataClass->lireDetail ( $id );
		$smarty->assign ( "data", $data );
		$smarty->assign ( "corps", "perimetre/perimetreDisplay.tpl" );
		break;
		
	/*
	* open the form to modify the record
	* If is a new record, generate a new record with default value :
	* $_REQUEST["idParent"] contains the identifiant of the parent record
	*/
	case "change":
		$perimetre = new perimetre ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "perimetre", $perimetre->getListe (2) );		
		$echelle = new echelle ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "echelle", $echelle->getListe (2) );		
		$type_perimetre = new typePerimetre ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "type_perimetre", $type_perimetre->getListe (2) );		
		$bien_support_niv2 = new bienSupportNiv2 ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "bien_support_niv2", $bien_support_niv2->getListe (2) );		
		$objet_niv2 = new objetNiv2 ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "objet_niv2", $objet_niv2->getListe (2) );		
		$recurrence = new recurrence ( $bdd, $ObjetBDDParam );
		$smarty->assign ( "recurrence", $recurrence->getListe (2) );		
		dataRead ( $dataClass, $id, "perimetre/perimetreChange.tpl" );
		break;

	/*
	* write record in database
	*/
	case "write":
		dataWrite ( $dataClass, $_REQUEST );
		break;
		
	/*
	* delete record
	*/
	case "delete":
		dataDelete ( $dataClass, $id );
		break;
}
?>
