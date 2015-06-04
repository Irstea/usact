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
				"recurrence_id" => array (
						"type" => 1
				),
				"perimetre_date_saisie" => array (
						"type" => 2
				),
				"perimetre_detail" => array (
						"type" => 0,
						"requis" => 1
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
		$sql = 'select perimetre.perimetre_id,
				perimetre.type_perimetre_id,
				perimetre.echelle_id,
				perimetre.bien_support_niv2_id,
				perimetre.objet_niv2_id,
				perimetre.recurrence_id,
				perimetre_detail,
				perimetre_login_saisie,
				type_perimetre_libelle,
				echelle_libelle,
				bien_support_niv2_libelle,
				bien_support_niv1_libelle,
				objet_niv2_libelle,
				objet_niv1_libelle,
				recurrence_libelle,
				conflit_date_debut				
				from perimetre
				left outer join bien_support_niv2 on perimetre.bien_support_niv2_id = bien_support_niv2.bien_support_niv2_id
				left outer join bien_support_niv1 on bien_support_niv2.bien_support_niv1_id = bien_support_niv1.bien_support_niv1_id
				left outer join type_perimetre on perimetre.type_perimetre_id = type_perimetre.type_perimetre_id
				left outer join echelle on perimetre.echelle_id = echelle.echelle_id
				left outer join objet_niv2 on perimetre.objet_niv2_id = objet_niv2.objet_niv2_id
				left outer join objet_niv1 on objet_niv2.objet_niv1_id = objet_niv1.objet_niv1_id
				left outer join recurrence on perimetre.recurrence_id = recurrence.recurrence_id 
				left outer join conflit on perimetre.perimetre_id = conflit.perimetre_id
				where objet_niv2.objet_niv1_id = objet_niv1.objet_niv1_id';
		
		/*
		 * Rajout des parametres de recherche
		 */
		if (strlen ( $param ["searchId"] ) > 0)
			$where .= ' and perimetre_id ='.$param["searchId"];
		
		if (strlen ( $param ["searchObjetNiv2"] ) > 0)
			$where2 .= ' and objet_niv2.objet_niv2_id ='.$param["searchObjetNiv2"];
				
		if (strlen ( $param ["searchObjetNiv1"] ) > 0)
			$where3 .= ' and objet_niv1.objet_niv1_id ='.$param["searchObjetNiv1"];
		
		if (strlen ( $param ["searchBienSupportNiv2"] ) > 0)
			$where4 .= ' and bien_support_niv2.bien_support_niv2_id ='.$param["searchBienSupportNiv2"];
		
		if (strlen ( $param ["searchBienSupportNiv1"] ) > 0)
			$where5 .= ' and bien_support_niv1.bien_support_niv1_id ='.$param["searchBienSupportNiv1"];
		
		if (strlen ( $param ["searchDateDebut"] ) > 0)
			$where5 .= ' and extract (year from conflit_date_debut) ='.$param["searchDateDebut"];
		
		$order = ' order by objet_niv2_libelle, bien_support_niv2_libelle';
		
		return parent::getListeParam ( $sql . $where . $where2 . $where3 . $where4 . $where5 . $where6 . $order);
	}
	
	function getListe() {
		$sql = 'select perimetre_id,
				perimetre.type_perimetre_id,
				perimetre.echelle_id,
				perimetre.bien_support_niv2_id,
				perimetre.objet_niv2_id,
				perimetre.recurrence_id,
				perimetre_date_saisie,
				perimetre_detail,
				perimetre_login_saisie,
				type_perimetre_libelle,
				echelle_libelle,
				bien_support_niv2_libelle,
				bien_support_niv1_libelle,
				objet_niv2_libelle,
				objet_niv1_libelle,
				recurrence_libelle
				from perimetre
				left outer join bien_support_niv2 on perimetre.bien_support_niv2_id = bien_support_niv2.bien_support_niv2_id
				left outer join bien_support_niv1 on bien_support_niv2.bien_support_niv1_id = bien_support_niv1.bien_support_niv1_id
				left outer join type_perimetre on perimetre.type_perimetre_id = type_perimetre.type_perimetre_id
				left outer join echelle on perimetre.echelle_id = echelle.echelle_id
				left outer join objet_niv2 on perimetre.objet_niv2_id = objet_niv2.objet_niv2_id
				left outer join objet_niv1 on objet_niv2.objet_niv1_id = objet_niv1.objet_niv1_id
				left outer join recurrence on perimetre.recurrence_id = recurrence.recurrence_id
				order by objet_niv2_libelle, bien_support_niv2_libelle, type_perimetre_libelle, echelle_libelle';
	
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
				perimetre.recurrence_id,
				perimetre_date_saisie,
				perimetre_detail,
				perimetre_login_saisie,
				type_perimetre_libelle,
				echelle_libelle,
				bien_support_niv2_libelle,
				bien_support_niv1_libelle,
				objet_niv2_libelle,
				objet_niv1_libelle,
				recurrence_libelle				
				from perimetre
				left outer join bien_support_niv2 on perimetre.bien_support_niv2_id = bien_support_niv2.bien_support_niv2_id
				left outer join bien_support_niv1 on bien_support_niv2.bien_support_niv1_id = bien_support_niv1.bien_support_niv1_id
				left outer join type_perimetre on perimetre.type_perimetre_id = type_perimetre.type_perimetre_id
				left outer join echelle on perimetre.echelle_id = echelle.echelle_id
				left outer join objet_niv2 on perimetre.objet_niv2_id = objet_niv2.objet_niv2_id
				left outer join objet_niv1 on objet_niv2.objet_niv1_id = objet_niv1.objet_niv1_id
				left outer join recurrence on perimetre.recurrence_id = recurrence.recurrence_id'							
				.' where perimetre_id = '.$id
				.' order by objet_niv2_libelle, bien_support_niv2_libelle';
			return parent::lireParam ( $sql );
		}
	}
}
?>