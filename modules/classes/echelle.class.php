<?php

/**
 * Classe de manipulation de la table echelle
 * 
 * @author jeremy.damey
 *
 */
class Echelle extends ObjetBDD {
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
		$this->table = "echelle";
		$this->id_auto = 1;
		$this->colonnes = array (
				"echelle_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1,
						"defaultValue" => 0 
				),
				"echelle_libelle" => array (
						"type" => 0
				)
		);
		$param ["fullDescription"] = 1;
		
		parent::__construct ( $link, $param );
	}
	
	/**
	 * Retourne la liste des echelles en fonction des critères de recherche fournis
	 *
	 * @param unknown $param        	
	 *
	 */
	function getListeSearch($param) {
		if (! is_array ( $param ))
			$param = array ();
		$param = $this->encodeData($param);
		$sql = 'select echelle_id,
				echelle_libelle
				from ' .$this->table;
				
		/*
		 * Rajout des parametres de recherche
		 */
		if (strlen ( $param ["searchId"] ) > 0)
			$where .= ' where echelle_id ='.$param["searchId"];
		
		$order = ' order by echelle_id';
		
		return parent::getListeParam ( $sql . $where . $order);
	}
	
	function getListe() {
		$sql = 'select echelle_id,
				echelle_libelle
				from ' .$this->table
				.' order by echelle_libelle';
	
		return parent::getListeParam ( $sql . $where . $order);
	}
	
	/**
	 * Retourne le detail de la fiche du echelle selectionné du echelle
	 * 
	 * @param unknown $id
	 * @return Ambigous <multitype:, boolean, $data>
	 */
	function lireDetail($id) {	
		if($id > 0)	
		{
			$id = $this->encodeData($id);
			$sql = 'select echelle_id,
					echelle_libelle
					from ' .$this->table
					.' where echelle_id = '.$id
					.' order by echelle_id';
			return parent::lireParam ( $sql );
		}
	}
}
?>
