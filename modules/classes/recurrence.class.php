<?php

/**
 * Classe de manipulation de la table recurrence
 * 
 * @author jeremy.damey
 *
 */
class recurrence extends ObjetBDD {
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
		$this->table = "recurrence";
		$this->id_auto = 1;
		$this->colonnes = array (
				"recurrence_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1,
						"defaultValue" => 0 
				),
				"recurrence_libelle" => array (
						"type" => 0,
						"requis" => 1
				)
		);
		$param ["fullDescription"] = 1;
		
		parent::__construct ( $link, $param );
	}
	
	/**
	 * Retourne la liste des recurrences en fonction des critères de recherche fournis
	 *
	 * @param unknown $param        	
	 *
	 */
	function getListeSearch($param) {
		if (! is_array ( $param ))
			$param = array ();
		$param = $this->encodeData($param);
		$sql = 'select recurrence_id,
				recurrence_libelle
				from ' .$this->table;
				
		/*
		 * Rajout des parametres de recherche
		 */
		if (strlen ( $param ["searchId"] ) > 0)
			$where .= ' where recurrence_id ='.$param["searchId"];
		
		$order = ' order by recurrence_libelle';
		
		return parent::getListeParam ( $sql . $where . $order);
	}
	
	function getListe() {
		$sql = 'select recurrence_id,
				recurrence_libelle
				from ' .$this->table
				.' order by recurrence_libelle';
	
		return parent::getListeParam ( $sql . $where . $order);
	}
	
	/**
	 * Retourne le detail de la fiche du recurrence selectionné du recurrence
	 * 
	 * @param unknown $id
	 * @return Ambigous <multitype:, boolean, $data>
	 */
	function lireDetail($id) {	
		if($id > 0)	
		{
			$id = $this->encodeData($id);
			$sql = 'select recurrence_id,
					recurrence_libelle
					from ' .$this->table
					.' where recurrence_id = '.$id
					.' order by recurrence_libelle';
			return parent::lireParam ( $sql );
		}
	}
}
?>
