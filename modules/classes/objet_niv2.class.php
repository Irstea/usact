<?php

/**
 * Classe de manipulation de la table objet_niv2
 * 
 * @author jeremy.damey
 *
 */
class ObjetNiv2 extends ObjetBDD {
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
		$this->table = "objet_niv2";
		$this->id_auto = 1;
		$this->colonnes = array (
				"objet_niv2_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1,
						"defaultValue" => 0 
				),
				"objet_niv1_id" => array (
						"type" => 1,
						"requis" => 0,
						"key" => 1,
						"defaultValue" => 0
				),
				"objet_niv2_libelle" => array (
						"type" => 0
				)
		);
		$param ["fullDescription"] = 1;
		
		parent::__construct ( $link, $param );
	}
	
	/**
	 * Retourne la liste des objet_niv2s en fonction des critères de recherche fournis
	 *
	 * @param unknown $param        	
	 *
	 */
	function getListeSearch($param) {
		if (! is_array ( $param ))
			$param = array ();
		$param = $this->encodeData($param);
		$sql = 'select objet_niv2_id,
				objet_niv2.objet_niv1_id,
				objet_niv2_libelle
				from ' .$this->table .',objet_niv1 
				where objet_niv2.objet_niv1_id = objet_niv1.objet_niv1_id';
				
		/*
		 * Rajout des parametres de recherche
		 */
		if (strlen ( $param ["searchId"] ) > 0)
			$where .= ' and objet_niv2_id ='.$param["searchId"];
		
		$order = ' order by objet_niv2_id';
		
		return parent::getListeParam ( $sql . $where . $order);
	}
	
	/**
	 * Retourne le detail de la fiche de l'objet niveau 2 selectionné
	 * 
	 * @param unknown $id
	 * @return Ambigous <multitype:, boolean, $data>
	 */
	function lireDetail($id) {	
		if($id > 0)	
		{
			$id = $this->encodeData($id);
			$sql = 'select objet_niv2_id,
					objet_niv2.objet_niv1_id,
					objet_niv2_libelle
					from ' .$this->table .',objet_niv1
					where objet_niv2.objet_niv1_id = objet_niv1.objet_niv1_id 
					and objet_niv2_id = '.$id
					.' order by objet_niv2_id';
			return parent::lireParam ( $sql );
		}
	}
}
?>
