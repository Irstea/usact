<?php

/**
 * Classe de manipulation de la table type_perimetre
 * 
 * @author jeremy.damey
 *
 */
class TypePerimetre extends ObjetBDD {
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
		$this->table = "type_perimetre";
		$this->id_auto = 1;
		$this->colonnes = array (
				"type_perimetre_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1,
						"defaultValue" => 0 
				),
				"type_perimetre_libelle" => array (
						"type" => 0
				)
		);
		$param ["fullDescription"] = 1;
		
		parent::__construct ( $link, $param );
	}
	
	/**
	 * Retourne la liste des type_perimetres en fonction des critères de recherche fournis
	 *
	 * @param unknown $param        	
	 *
	 */
	function getListeSearch($param) {
		if (! is_array ( $param ))
			$param = array ();
		$param = $this->encodeData($param);
		$sql = 'select type_perimetre_id,
				type_perimetre_libelle
				from ' .$this->table;
				
		/*
		 * Rajout des parametres de recherche
		 */
		if (strlen ( $param ["searchId"] ) > 0)
			$where .= ' where type_perimetre_id ='.$param["searchId"];
		
		$order = ' order by type_perimetre_id';
		
		return parent::getListeParam ( $sql . $where . $order);
	}
	
	function getListe() {
		$sql = 'select type_perimetre_id,
				type_perimetre_libelle
				from ' .$this->table
				.' order by type_perimetre_libelle';
	
		return parent::getListeParam ( $sql );
	}
	
	/**
	 * Retourne le detail de la fiche du type_perimetre selectionné du type_perimetre
	 * 
	 * @param unknown $id
	 * @return Ambigous <multitype:, boolean, $data>
	 */
	function lireDetail($id) {	
		if($id > 0)	
		{
			$id = $this->encodeData($id);
			$sql = 'select type_perimetre_id,
					type_perimetre_libelle
					from ' .$this->table
					.' where type_perimetre_id = '.$id
					.' order by type_perimetre_id';
			return parent::lireParam ( $sql );
		}
	}
}
?>
