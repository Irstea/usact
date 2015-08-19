<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 19 août 2015
 */

/**
 * ORM de gestion de la table intervention
 * @author quinton
 *
 */


class Intervention extends ObjetBDD {
	private $sql = "
		select * from intervention
		natural join position_usage_activite
		natural join conflit
		natural join acteur
		left outer join usage_activite_niv2 using (usage_activite_niv2_id)
		left outer join usage_activite_niv1 using (usage_activite_niv1_id)
		left outer join role using (role_id)
		natural join perimetre
		left outer join bien_support_niv2 using (bien_support_niv2_id)
		left outer join objet_niv2 using (objet_niv2_id)
		";
	
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "intervention";
		$this->id_auto = "1";
		$this->colonnes = array (
				"intervention_id" => array (
						"type" => 1,
						"key" => 1,
						"requis" => 1,
						"defaultValue" => 0 
				),
				"conflit_id" => array( "type"=>1, "requis"=>1, "parentAttrib"=>1),
				"acteur_id" => array("type"=>1, "requis"=>1),
				"role_id" => array("type"=>1),
				"usage_activite_niv2_id"=>array("type"=>1),
				"position_usage_activite_id"=>array("type"=>1, "requis"=>1),
				"intervention_date_entree"=>array("type"=>2),
				"intervention_date_entree_txt"=>array("type"=>0),
				"intervention_date_sortie"=>array("type"=>2),
				"intervention_date_sortie_txt"=>array("type"=>0),
				"intervention_detail_usage"=>array("type"=>0)
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	
	/**
	 * Retourne la liste des acteurs en fonction des criteres fournis
	 *
	 * @param array $param
	 * @return tableau
	 */
	function getListeSearch($param) {
		$param = $this->encodeData ( $param );
		$where = " where ";
		$wb = false;
		
		if ($param ["usage_activite_niv2_id"] > 0 && is_numeric ( $param ["usage_activite_niv2_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "usage_activite_niv2_id = " . $param ["usage_activite_niv2_id"];
		}
		if ($param ["role_id"] > 0 && is_numeric ( $param ["role_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "role_id = " . $param ["role_id"];
		}
		if ($param ["position_usage_activite_id"] > 0 && is_numeric ( $param ["position_usage_activite_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "position_usage_activite_id = " . $param ["position_usage_activite_id"];
		}
		if ($param["objet_niv2_id"]>0 && is_numeric($param["objet_niv2_id"])) {
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "objet_niv2_id = ".$param["objet_niv2_id"];
		}
		if ($param["bien_support_niv2_id"]> 0 && is_numeric($param["bien_support_niv2_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "bien_support_niv2_id = ".$param["bien_support_niv2_id"];
		}
		
		if ($wb == false)
			$where = "";
		/*
		 * Preparation de la clause de tri
		 */
		$order = "";
		return $this->getListeParam ( $this->sql . $where . $order );
	}
	
	/**
	 * Retourne le detail d'une intervention
	 *
	 * @param int $id
	 * @return array|NULL
	 */
	function getDetail($id) {
		if (is_numeric ( $id ) && $id > 0) {
			$where = " where intervention_id = " . $id;
			return $this->lireParam ( $this->sql . $where );
		} else
			return null;
	}

	/**
	 * Retourne la liste des interventions pour un acteur
	 * @param int $acteur_id
	 * @return tableau|NULL
	 */
	function getListFromActeur($acteur_id) {
		if (is_numeric($acteur_id) && $acteur_id > 0) {
			$where = " where acteur_id = ".$acteur_id;
			$order = " order by intervention_date_entree desc";
			return $this->getListeParam($this->sql.$where.$order);
		}
		else 
			return null;
	}
	
	/**
	 * Retourne la liste des interventions pour un conflit
	 * @param int $conflit_id
	 * @return tableau|NULL
	 */
	function getListFromConflit($conflit_id) {
		if (is_numeric($conflit_id) && $conflit_id > 0) {
			$where = " where conflit_id = ".$conflit_id;
			$order = " order by intervention_date_entree desc";
			return $this->getListeParam($this->sql.$where.$order);
		}
		else
			return null;
	}
	
}



?>