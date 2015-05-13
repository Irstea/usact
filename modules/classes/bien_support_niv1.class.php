<?php

/**
 * Classe de manipulation de la table bien_support_niv1
 * 
 * @author jeremy.damey
 *
 */
class BienSupportNiv1 extends ObjetBDD {
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
		$this->table = "bien_support_niv1";
		$this->id_auto = 1;
		$this->colonnes = array (
				"bien_support_niv1_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1,
						"defaultValue" => 0 
				),
				"bien_support_niv1_libelle" => array (
						"type" => 0
				)
		);
		$param ["fullDescription"] = 1;
		
		parent::__construct ( $link, $param );
	}
	
	/**
	 * Retourne la liste des bien_support_niv1s en fonction des critères de recherche fournis
	 *
	 * @param unknown $param        	
	 *
	 */
	function getListeSearch($param) {
		if (! is_array ( $param ))
			$param = array ();
		$param = $this->encodeData($param);
		$sql = 'select bien_support_niv1_id,
				bien_support_niv1_libelle
				from ' .$this->table;
				
		/*
		 * Rajout des parametres de recherche
		 */
		if (strlen ( $param ["searchId"] ) > 0)
			$where .= ' where bien_support_niv1_id ='.$param["searchId"];
		
		$order = ' order by bien_support_niv1_id';
		
		return parent::getListeParam ( $sql . $where . $order);
	}
	
	/**
	 * Retourne le detail de la fiche du bien_support_niv1 selectionné du bien_support_niv1
	 * 
	 * @param unknown $id
	 * @return Ambigous <multitype:, boolean, $data>
	 */
	function lireDetail($id) {	
		if($id > 0)	
		{
			$id = $this->encodeData($id);
			$sql = 'select bien_support_niv1_id,
					bien_support_niv1_libelle
					from ' .$this->table
					.' where bien_support_niv1_id = '.$id
					.' order by bien_support_niv1_id';
			return parent::lireParam ( $sql );
		}
	}
}
?>
