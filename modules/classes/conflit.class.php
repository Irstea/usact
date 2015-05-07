<?php

/**
 * Classe de manipulation de la table conflit
 * 
 * @author jeremy.damey
 *
 */
class conflit extends ObjetBDD {
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
						"defaultValue" => 1 
				),
				"conflit_login_saisie" => array (
						"type" => 0,
						"requis" => 1
				),
				"conflit_date_debut" => array (
						"type" => 3 
				),
				"conflit_date_fin" => array (
						"type" => 3 
				),
				"conflit_date_saisie" => array (
						"type" => 3,
						"requis" => 1
				),
				"conflit_detail" => array (
						"type" => 0,
						"longueur" => 30
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
		$param = $this->encodeData($param);
		$sql = 'select conflit_id,
				conflit_login_saisie,
				conflit_date_debut,
				conflit_date_fin,
				conflit_date_saisie,
				conflit_detail 
				from ' .$this->table;
				
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
		$id = $this->encodeData($id);
		$sql = 'select conflit_id,
				conflit_login_saisie,
				conflit_date_debut,
				conflit_date_fin,
				conflit_date_saisie,
				conflit_detail 
				from ' .$this->table
				.' where conflit_id = '.$id
				.' order by conflit_id';
		return parent::lireParam ( $sql );
	}
}
?>

