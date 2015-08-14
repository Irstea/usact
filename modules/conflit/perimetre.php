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
include_once 'modules/classes/parametre.class.php';

function setSmartyPerimetreParam() {
	global $smarty, $ObjetBDDParam,$bdd;
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
}

$dataClass = new Perimetre( $bdd, $ObjetBDDParam );
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
		setSmartyPerimetreParam();
		if ($searchPerimetre->isSearch () == 1) {
			$data = $dataClass->getListeSearch ( $dataRecherche );
			$smarty->assign ( "data", $data );
			$smarty->assign ( "isSearch", 1 );
		}
		$smarty->assign ( "dataSearch", $dataRecherche );
		$smarty->assign ( "corps", "conflit/perimetreListe.tpl" );
		break;
		
	/*
	 * Display the detail of the record
	*/
	case "display":
		$data = $dataClass->lireDetail ( $id );
		$smarty->assign ( "data", $data );
		$smarty->assign ( "corps", "conflit/perimetreDisplay.tpl" );
		break;
		
	/*
	* open the form to modify the record
	* If is a new record, generate a new record with default value :
	* $_REQUEST["idParent"] contains the identifiant of the parent record
	*/
	case "change":
		setSmartyPerimetreParam();
		dataRead ( $dataClass, $id, "conflit/perimetreChange.tpl" );
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
