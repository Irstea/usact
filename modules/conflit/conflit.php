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
$dataClass = new conflit( $bdd, $ObjetBDDParam );
$id = $_REQUEST ["id"];

switch ($t_module ["param"]) {
	
	/*
	 * Display the list of all records of the table
	 */
	/*
	 * Gestion des criteres de recherche
	 */
	case "list":
		$searchConflit->setParam ( $_REQUEST );
		$dataRecherche = $searchConflit->getParam ();
		if ($searchConflit->isSearch () == 1) {
			$data = $dataClass->getListeSearch ( $dataRecherche );
			$smarty->assign ( "data", $data );
			$smarty->assign ( "isSearch", 1 );
		}
		$smarty->assign ( "conflitSearch", $dataRecherche );
		$smarty->assign ( "corps", "conflit/conflitListe.tpl" );
		break;
		
	/*
	 * Display the detail of the record
	*/
	case "display":
		$data = $dataClass->lireDetail ( $id );
		$smarty->assign ( "data", $data );
		$smarty->assign ( "corps", "conflit/conflitDisplay.tpl" );
		break;
		
	/*
	* open the form to modify the record
	* If is a new record, generate a new record with default value :
	* $_REQUEST["idParent"] contains the identifiant of the parent record
	*/
	case "change":
		dataRead ( $dataClass, $id, "conflit/conflitChange.tpl" );
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
		
	case "pdf":
/*
* Generation de la liste au format PDF
*/
include_once ("plugins/fpdf17/fpdf.php");
		include_once ("modules/classes/pdf.class.php");
		/*
		 * Recuperation de la liste des enregistrements en fonction des parametres de recherche
		 */
		$data = $dataClass->getListeSearch ( $searchConflit->getParam () );
		/*
		 * Definition de la classe et taille du document
		 */
		$pdf = new PDF ( 'P', 'mm', 'A4' );
		/*
		 * definition de l'icone
		 */
		
		$pdf->setIcone ( "display/images/tux-lamp.jpg" );
		$pdf->SetFont ( 'Arial', '', 10 );
		$pdf->SetMargins ( 5, 20, 20 );
		/*
		 * Definition des proprietes du PDF (carte de visite)
		 */
		$pdf->SetAuthor ( $_SESSION ["login"] );
		$pdf->SetSubject ( "Liste des conflits" );
		$pdf->SetKeywords ( "Personne saisissant les conflits" );
		// Definition du titre
		$pdf->SetTitle ( "Liste des conflits" );
		/*
		 * Definition du tableau - largeur des colonnes
		 */
		$largeur = array (
				20,
				30,
				40,
				40,
				40, 
				30
		);
		$largeurTotale = 140 + $pdf->lMargin;
		$titreTableau = array (
				"ID conflit",
				utf8_decode ( "Nom - Prénom" ),
				utf8_decode("Date début"),
				"Date fin",
				"Date saisie",
				utf8_decode("Détail conflit")
		);
		$hauteur = 6;
		$nbLigne = 0;
		$nbPage = 1;
		/*
		 * Traitement de chaque item de la liste des conflits
		 */
		foreach ( $data as $key => $value ) {
			/*
			 * Generation de l'entete du tableau
			 */
			if ($nbLigne == 0) {
				if ($nbPage > 1) {
					/*
					 * Fermeture du tableau sur la page precedente
					 */
					$pdf->Line ( $pdf->lMargin, $pdf->GetY (), $largeurTotale, $pdf->GetY () );
				}
				/*
				 * Creation d'une nouvelle page
				 */
				$pdf->AddPage ();
				$nbPage ++;
				$pdf->SetEnteteTableau ( $hauteur, $largeur, $titreTableau );
				$pdf->SetFont ( 'arial', '', 10 );
			}
			/*
			 * Affichage des informations
			 */
			$pdf->Cell ( $largeur [0], $hauteur, $value ["conflit_id"], "LR", 0, 'C' );
			$pdf->Cell ( $largeur [1], $hauteur, utf8_decode ( $value ["personne_saisie_conflit_nom"] ) . ' ' . utf8_decode ( $value ["personne_saisie_conflit_prenom"] ), "LR", 0, 'C' );
			$pdf->Cell ( $largeur [2], $hauteur, $value ["conflit_date_debut"], "LR", 0, 'C' );
			$pdf->Cell ( $largeur [3], $hauteur, $value ["conflit_date_fin"], "LR", 0, 'C' );
			$pdf->Cell ( $largeur [4], $hauteur, $value ["conflit_date_saisie"], "LR", 0, 'C' );
			$pdf->Cell ( $largeur [5], $hauteur, $value ["conflit_detail"], "LR", 0, 'C' );
			$pdf->Ln ();
			$nbLigne ++;
			if ($nbLigne > 10) {
				$nbLigne = 0;
			}
		}
		/*
		 * Terminaison du tableau
		 */
		$pdf->Line ( $pdf->lMargin, $pdf->GetY (), $largeurTotale, $pdf->GetY () );
		/*
		 * Envoi du PDF au navigateur
		 */
		$pdf->Output ( "ListeConflit.pdf", "I" );
		break;
}
?>

