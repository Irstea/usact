<?php

/**
 * Classe de manipulation de la table conflit
 * 
 * @author jeremy.damey
 *
 */
class Conflit extends ObjetBDD {
	/**
	 * instanciation de la classe, et initialisation des parametres
	 *
	 * @param $link; reference
	 *        	a la connexion adoDB - $bdd
	 * @return void
	 *
	 */
	function __construct($link, $param = NULL) {
		if (! is_array ( $param ))
			$param = array ();
		$this->table = "conflit";
		$this->id_auto = 1;
		$this->colonnes = array (
				"conflit_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1,
						"defaultValue" => 0 
				),
				"perimetre_id" => array (
						"type" => 1
				),
				"conflit_login_saisie" => array (
						"type" => 0
				),
				"conflit_date_debut" => array (
						"type" => 2 
				),
				"conflit_date_fin" => array (
						"type" => 2 
				),
				"conflit_date_saisie" => array (
						"type" => 2,
						"requis" => 0
				),
				"conflit_detail" => array (
						"type" => 0,
						"requis" => 1
				)
		);
		$param ["fullDescription"] = 1;
		
		parent::__construct ( $link, $param );
	}
	
	/**
	 * Retourne la liste des conflits en fonction des critères de recherche fournis
	 *
	 * @param unknown $param        	
	 *
	 */
	function getListeSearch($param) {
		if (! is_array ( $param ))
			$param = array ();
		$param = $this->encodeData($param);
		$sql = 'select conflit_id,
				conflit.perimetre_id,
				conflit_login_saisie,
				conflit_date_debut,
				conflit_date_fin,
				conflit_date_saisie,
				conflit_detail,
				perimetre_detail,
				bien_support_niv2_libelle,
				type_perimetre_libelle,
				echelle_libelle,
				objet_niv2_libelle 
				from ' .$this->table
				.' left outer join perimetre on conflit.perimetre_id = perimetre.perimetre_id
					left outer join bien_support_niv2 on perimetre.bien_support_niv2_id = bien_support_niv2.bien_support_niv2_id
					left outer join type_perimetre on perimetre.type_perimetre_id = type_perimetre.type_perimetre_id
					left outer join echelle on perimetre.echelle_id = echelle.echelle_id
					left outer join objet_niv2 on perimetre.objet_niv2_id = objet_niv2.objet_niv2_id';
				
		/*
		 * Rajout des parametres de recherche
		 */
		if (strlen ( $param ["searchId"] ) > 0)
			$where .= ' where conflit_id ='.$param["searchId"];
		
		$order = ' order by conflit_id';
		
		return parent::getListeParam ( $sql . $where . $order);
	}
	
	/**
	 * Retourne le detail de la fiche du conflit selectionné du conflit
	 * 
	 * @param unknown $id
	 * @return Ambigous <multitype:, boolean, $data>
	 */
	function lireDetail($id) {	
		if($id > 0)	
		{
			$id = $this->encodeData($id);
			$sql = 'select conflit_id,
					conflit.perimetre_id,
					conflit_login_saisie,
					conflit_date_debut,
					conflit_date_fin,
					conflit_date_saisie,
					conflit_detail,
					perimetre_detail,
					bien_support_niv2_libelle,
					type_perimetre_libelle,
					echelle_libelle,
					objet_niv2_libelle
					from ' .$this->table
					.' left outer join perimetre on conflit.perimetre_id = perimetre.perimetre_id
					left outer join bien_support_niv2 on perimetre.bien_support_niv2_id = bien_support_niv2.bien_support_niv2_id
					left outer join type_perimetre on perimetre.type_perimetre_id = type_perimetre.type_perimetre_id
					left outer join echelle on perimetre.echelle_id = echelle.echelle_id
					left outer join objet_niv2 on perimetre.objet_niv2_id = objet_niv2.objet_niv2_id
						where conflit_id = '.$id
					.' order by conflit_id';
			return parent::lireParam ( $sql );
		}
	}
}
?>

