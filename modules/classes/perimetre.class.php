<?php
/**
 * Classe de manipulation de la table perimetre
 *
 * @author jeremy.damey
 *
 */
class perimetre extends ObjetBDD {
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
		$this->table = "perimetre";
		$this->id_auto = 1;
		$this->colonnes = array (
				"perimetre_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1,
						"defaultValue" => 0
				),
				"conflit_id" => array (
						"type" => 1
				),
				"type_perimetre_id" => array (
						"type" => 1
				),
				"echelle_id" => array (
						"type" => 1
				),
				"bien_support_niv2_id" => array (
						"type" => 1
				),
				"objet_niv2_id" => array (
						"type" => 1
				),
				"recurrence" => array (
						"type" => 1,
						"requis" => 1
				),
				"perimetre_date_saisie" => array (
						"type" => 3,
						"requis" => 1
				),
				"perimetre_detail" => array (
						"type" => 0
				),
				"perimetre_login_saisie" => array (
						"type" => 0
				)
		);
		$param ["fullDescription"] = 1;

		parent::__construct ( $link, $param );
	}

	/**
	 * Reecriture de la fonction getListe
	 * (non-PHPdoc)
	 *
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	function getListeSearch($param) {
		if (! is_array ( $param ))
			$param = array ();
		$param = $this->encodeData($param);
		$sql = 'select perimetre_id,
				perimetre.type_perimetre_id,
				perimetre.echelle_id,
				perimetre.bien_support_niv2_id,
				perimetre.objet_niv2_id,
				recurrence,
				perimetre_date_saisie,
				perimetre_detail,
				perimetre_login_saisie,
				type_perimetre_libelle,
				echelle_libelle,
				bien_support_niv2_libelle,
				objet_niv2_libelle				
				from perimetre
				left outer join conflit on perimetre.conflit_id = conflit.conflit_id
				left outer join bien_support_niv2 on perimetre.bien_support_niv2_id = bien_support_niv2.bien_support_niv2_id
				left outer join type_perimetre on perimetre.type_perimetre_id = type_perimetre.type_perimetre_id
				left outer join echelle on perimetre.echelle_id = echelle.echelle_id
				left outer join objet_niv2 on perimetre.objet_niv2_id = objet_niv2.objet_niv2_id';
		
		/*
		 * Rajout des parametres de recherche
		 */
		if (strlen ( $param ["searchId"] ) > 0)
			$where .= ' where perimetre_id ='.$param["searchId"];
		
		$order = ' order by perimetre_id';
		
		return parent::getListeParam ( $sql . $where . $order);
	}
	
	function getListe() {
		$sql = 'select perimetre_id,
				perimetre.type_perimetre_id,
				perimetre.echelle_id,
				perimetre.bien_support_niv2_id,
				perimetre.objet_niv2_id,
				recurrence,
				perimetre_date_saisie,
				perimetre_detail,
				perimetre_login_saisie,
				type_perimetre_libelle,
				echelle_libelle,
				bien_support_niv2_libelle,
				objet_niv2_libelle
				from perimetre
				left outer join conflit on perimetre.conflit_id = conflit.conflit_id
				left outer join bien_support_niv2 on perimetre.bien_support_niv2_id = bien_support_niv2.bien_support_niv2_id
				left outer join type_perimetre on perimetre.type_perimetre_id = type_perimetre.type_perimetre_id
				left outer join echelle on perimetre.echelle_id = echelle.echelle_id
				left outer join objet_niv2 on perimetre.objet_niv2_id = objet_niv2.objet_niv2_id
				order by perimetre_id';
	
		return parent::getListeParam ( $sql );
	}
	
	/**
	 * Retourne le detail de la fiche du périmetre selectionné 
	 *
	 * @param unknown $id
	 * @return Ambigous <multitype:, boolean, $data>
	 */
	function lireDetail($id) {
		if($id > 0)
		{
			$id = $this->encodeData($id);
			$sql = 'select perimetre_id,
				perimetre.type_perimetre_id,
				perimetre.echelle_id,
				perimetre.bien_support_niv2_id,
				perimetre.objet_niv2_id,
				recurrence,
				perimetre_date_saisie,
				perimetre_detail,
				perimetre_login_saisie,
				type_perimetre_libelle,
				echelle_libelle,
				bien_support_niv2_libelle,
				objet_niv2_libelle				
				from perimetre
				left outer join conflit on perimetre.conflit_id = conflit.conflit_id
				left outer join bien_support_niv2 on perimetre.bien_support_niv2_id = bien_support_niv2.bien_support_niv2_id
				left outer join type_perimetre on perimetre.type_perimetre_id = type_perimetre.type_perimetre_id
				left outer join echelle on perimetre.echelle_id = echelle.echelle_id
				left outer join objet_niv2 on perimetre.objet_niv2_id = objet_niv2.objet_niv2_id'							
				.' where perimetre_id = '.$id
				.' order by perimetre_id';
			return parent::lireParam ( $sql );
		}
	}
}
?>