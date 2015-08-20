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

include_once 'modules/classes/conflit.class.php';
include_once 'modules/classes/parametre.class.php';
include_once 'modules/conflit/perimetre.function.php';

$dataClass = new Conflit( $bdd, $ObjetBDDParam );
$keyName = "conflit_id";
$id = $_REQUEST [$keyName];

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
		$smarty->assign("table", "conflit");
		if ($searchPerimetre->isSearch () == 1) {
			$data = $dataClass->getListeSearch ( $dataRecherche );
			$smarty->assign ( "conflit", $data );
			$smarty->assign ( "isSearch", 1 );
		}
		$smarty->assign ( "dataSearch", $dataRecherche );
		$smarty->assign ( "corps", "conflit/conflitListe.tpl" );
		$_SESSION["conflit_table"] = "conflit";
		break;
		
	/*
	 * Display the detail of the record
	*/
	case "display":
		$smarty->assign ( "conflit", $dataClass->lireDetail ( $id ));
		$smarty->assign ( "corps", "conflit/conflitDisplay.tpl" );
		require_once 'modules/classes/intervention.class.php';
		$intervention = new Intervention($bdd, $ObjetBDDParam);
		$smarty->assign("intervention", $intervention->getListFromConflit($id));
		require_once 'modules/classes/entretien.class.php';
		$entretien = new Entretien($bdd, $ObjetBDDParam);
		$smarty->assign("entretien", $entretien->getListFromConflit($id));
		break;
		
	/*
	* open the form to modify the record
	* If is a new record, generate a new record with default value :
	* $_REQUEST["idParent"] contains the identifiant of the parent record
	*/
	case "change":
		$data = dataRead ( $dataClass, $id, "conflit/conflitChange.tpl", $_REQUEST["perimetre_id"] );
		require_once 'modules/classes/perimetre.class.php';
		$perimetre = new Perimetre($bdd, $ObjetBDDParam);
		$smarty->assign("perimetre", $perimetre->lireDetail($data["perimetre_id"]));
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
		
	case "getListAjaxJson":
		if (strlen($_REQUEST["objet_id"]) > 0) {
			$data = $dataClass->getListByObjet($_REQUEST["objet_id"]);
		
			echo json_encode ($data) ;
		}
		
}

?>
