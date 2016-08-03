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
include_once 'modules/conflit/perimetre.function.php';


$dataClass = new Perimetre( $bdd, $ObjetBDDParam );
$keyName = "perimetre_id";
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
		$smarty->assign("table", "perimetre");
		if ($searchPerimetre->isSearch () == 1) {
			$data = $dataClass->getListeSearch ( $dataRecherche );
			$smarty->assign ( "data", $data );
			$smarty->assign ( "isSearch", 1 );
		}
		$smarty->assign ( "dataSearch", $dataRecherche );
		$smarty->assign ( "corps", "conflit/perimetreListe.tpl" );
		$_SESSION["conflit_table"] = "perimetre";
		break;
		
	/*
	 * Display the detail of the record
	*/
	case "display":
		$smarty->assign ( "perimetre", $dataClass->lireDetail ( $id ) );
		$smarty->assign ( "corps", "conflit/perimetreDisplay.tpl" );
		/*
		 * Recherche les conflits rattaches
		 */
		require_once 'modules/classes/conflit.class.php';
		$conflit = new Conflit($bdd, $ObjetBDDParam);
		$smarty->assign("conflit", $conflit->getListFromParent($id,3));
		require_once 'modules/classes/localisation.class.php';
		$localisation = new Localisation($bdd, $ObjetBDDParam);
		$dataLocalisation = $localisation->getListFromPerimetre($id);
		$smarty->assign("localisation", $dataLocalisation);
		/*
		 * Recherche s'il existe une localisation gps, pour afficher la carte
		 */
		$gps = false;
		foreach ($dataLocalisation as $value) {
			if (strlen($value["wgs84x"]) > 0 && strlen($value["wgs84y"]) > 0) {
				$gps = true;
				$x = $value["wgs84x"];
				$y = $value["wgs84y"];
				break;
			}		
		}
		if ($gps)
			$smarty->assign("mapDisplay", 1);
			$smarty->assign("centreX", $x);
			$smarty->assign("centreY", $y);
		break;
		
	/*
	* open the form to modify the record
	* If is a new record, generate a new record with default value :
	* $_REQUEST["idParent"] contains the identifiant of the parent record
	*/
	case "change":
		setSmartyPerimetreParam();
		$data = dataRead ( $dataClass, $id, "conflit/perimetreChange.tpl" );
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
