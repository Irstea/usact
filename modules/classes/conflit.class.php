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
	private $sql = "select *
					from conflit
					natural join perimetre
					natural join objet_niv2
					natural join objet_niv1
					natural join type_perimetre
					left outer join bien_support_niv2 using (bien_support_niv2_id)
					left outer join bien_support_niv1 using (bien_support_niv1_id)		
					left outer join echelle using (echelle_id)
					";
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
						"type" => 1,
						"requis" => 1,
						"parentAttrib" => 1 
				),
				"conflit_login" => array (
						"type" => 0,
						"defaultValue" => "getLogin" 
				),
				"conflit_date_debut" => array (
						"type" => 2,
						"defaultValue" => "getDateJour" 
				),
				"conflit_date_debut_txt" => array (
						"type" => 0 
				),
				"conflit_date_fin" => array (
						"type" => 2 
				),
				"conflit_date_fin_txt" => array (
						"type" => 0 
				),
				"conflit_date_saisie" => array (
						"type" => 2,
						"defaultValue" => "getDateJour" 
				),
				"conflit_detail" => array (
						"type" => 0
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
		$param = $this->encodeData ( $param );

		/*
		 * Preparation de la clause where
		 */
		$where = " where ";
		$wb = false;
		if (strlen($param["libelle"])>0) {
			$wb == true ? $where .= " and ":$wb = true;
			if (is_numeric($param["libelle"])) {
				$where .= "conflit_id = ".$param["libelle"];
			} else {
				$where .= "upper(conflit_detail) like upper('%".$param["libelle"]."%')";
			}
		}
		if ($param["bien_support_niv2_id"]> 0 && is_numeric($param["bien_support_niv2_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "bien_support_niv2_id = ".$param["bien_support_niv2_id"];
		}
		if ($param["type_perimetre_id"]>0 && is_numeric($param["type_perimetre_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "type_perimetre_id = ".$param["type_perimetre_id"];
		}
		if ($param["echelle_id"]>0 && is_numeric($param["echelle_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "echelle_id = ".$param["echelle_id"];
		}
		if ($param["recurrence_id"]>0 && is_numeric($param["recurrence_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "recurrence_id = ".$param["recurrence_id"];
		}
		if ($param["objet_niv2_id"]>0 && is_numeric($param["objet_niv2_id"])) {
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "objet_niv2_id = ".$param["objet_niv2_id"];
		}
		
		/*
		 * Cas ou aucun critere de recherche
		 */
		if ($wb == false)
			$where = "";
		/*
		 * Clause de tri
		 */
		$order = ' order by conflit_id desc';		
		/*
		 * Execution de la recherche
		 */
		return parent::getListeParam ( $this->sql . $where . $order );
	}
	
	/**
	 * Retourne le detail de la fiche du conflit selectionné du conflit
	 *
	 * @param unknown $id        	
	 * @return Ambigous <multitype:, boolean, $data>
	 */
	function lireDetail($id) {
		if ($id > 0 && is_numeric ( $id )) {
			$where = " where conflit_id = " . $id;
			return parent::lireParam ( $this->sql . $where );
		}
	}

	/**
	 * Fonction retournant la liste des conflits correspondants a un objet
	 * @param int $objet_id
	 * @return tableau
	 */
	function getListByObjet($objet_id) {
		if( $objet_id > 0 && is_numeric($objet_id)) {
			$sql = "select conflit_id, conflit_detail
					from conflit
					natural join perimetre
					";
			$where = " where objet_niv2_id = ".$objet_id;
			$order = " order by conflit_id";
			return $this->getListeParam($sql.$where.$order);
		}
	}

	/**
	 * Recupere la liste des conflits associes a un entretien
	 * @param int $entretien_id
	 * @return tableau
	 */
	function getListFromEntretien($entretien_id) {
		if ($entretien_id > 0 && is_numeric($entretien_id)) {
			$sql = $this->sql." natural join entretien_conflit";
			$where = " where entretien_id = ".$entretien_id;
			$order = " order by conflit_id";
			return $this->getListeParam($sql.$where.$order);
		}
	}

	/**
	 * Recupere la liste des conflits associes a un article
	 * @param int $article_id
	 * @return tableau
	 */
	function getListFromArticle($article_id) {
		if ($article_id > 0 && is_numeric($article_id)) {
			$sql = $this->sql." natural join article_conflit
					left outer join action_type using (action_type_id)";
			$where = " where article_id = ".$article_id;
			$order = " order by conflit_id";
			return $this->getListeParam($sql.$where.$order);
		}
	}
	
}
?>

