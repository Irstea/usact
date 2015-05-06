<?php

/**
 * class PDF
 * mise en forme par defaut des documents PDF generes
 */
/**
 * 
 * @author jeremy.damey
 *
 */
class PDF extends FPDF {
	/**
	 *
	 * Definition de l'icone utilisee
	 * 
	 * @param string $icone        	
	 *
	 */
	function setIcone($icone) {
		$this->icone = $icone;
	}
	/**
	 * Mise en place de l'entete
	 * (non-PHPdoc)
	 * 
	 * @see FPDF::Header()
	 *
	 */
	function Header() {
		// positionnement de l'icone
		$this->image ( $this->icone, 5, 5, 20, 20, 'JPEG' );
		// Definition de la police
		$this->SetFont ( "arial", "I", 14 );
		// Calcul de la largeur du titre et positionnement
		$w = $this->GetStringWidth ( $this->title ) + 6;
		$this->SetX ( (210 - $w) / 2 );
		// Ecriture du titre dans une cellule
		$this->Cell ( $w, 9, $this->title, 0, 0, 'C', false );
		// Insertion d'un saut de ligne
		$this->Ln ( 10 );
	}
	/**
	 * Definition du pied de page
	 * (non-PHPdoc)
	 * 
	 * @see FPDF::Footer()
	 *
	 */
	function Footer() {
		// Positionnement a 15mm du bas
		$this->SetY ( - 15 );
		// definition de la police
		//
		$this->SetFont ( "arial", "", 8 );
		// Recuperation du nombre de pages total
		$this->AliasNbPages ( 'nbpages' );
		// mise en place de la numerotation
		$this->Cell ( 0, 10, $this->PageNo () . '/nbpages', 0, 0, 'C' );
	}
	/**
	 * Creation de l'entete du tableau
	 * 
	 * @param int $hauteur
	 *        	: hauteur de chaque ligne
	 * @param array $largeur
	 *        	: liste des largeurs des colonnes
	 * @param arrray $titre
	 *        	: liste des intitules des colonnes
	 *        	
	 */
	function SetEnteteTableau($hauteur, $largeur, $titre) {
		// Definition du tableau - largeur des colonnes
		// Preparation de l'entete du tableau
		$this->SetFont ( 'arial', 'B', 10 );
		for($i = 0; $i < count ( $largeur ); $i ++) {
			$this->Cell ( $largeur [$i], $hauteur, $titre [$i], 1, 0, 'C' );
		}
		// saut de ligne
		$this->ln ();
	}
}
?>

