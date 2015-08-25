<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 24 août 2015
 */
 
class Resolution extends ObjetBDD {
	/**
	 * Constructeur de la classe
	 * @param instance ADODB $bdd
	 * @param array $param
	 */
	private $sql = "
			select * 
			from resolution
			left outer join resolution_echelle using (resolution_echelle_id)
			left outer join resolution_nature using (resolution_nature_id)
			left outer join resolution_acteur using (resolution_acteur_id)
			left outer join resolution_mode_niv2 using (resolution_mode_niv2_id)
			left outer join resolution_mode_niv1 using (resolution_mode_niv1_id)
			left outer join solution_proposee using (solution_proposee_id)
			natural join conflit
			natural join perimetre
			natural join type_perimetre
			natural join objet_niv2
			natural join objet_niv1
			";
	private $order = " order by resolution_id ";
	
	function __construct($bdd,$param=null) {
		$this->param = $param;
		$this->table="resolution";
		$this->id_auto="1";
		$this->colonnes=array(
				"resolution_id"=>array("type"=>1,"key"=>1, "requis"=>1, "defaultValue"=>0),
				"conflit_id"=>array("type"=>1, "requis"=>1, "parentAttrib"=>1),
				"solution_proposee_id"=>array("type"=>1),
				"resolution_echelle_id"=>array("type"=>1),
				"resolution_nature_id"=>array("type"=>1),
				"resolution_acteur_id"=>array("type"=>1),
				"resolution_mode_niv2_id"=>array("type"=>1),
				"resolution_detail"=>array("type"=>0)
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($bdd,$param);
	}
	/**
	 * Recherche des resolutions en fonction des parametres fournis
	 * @param unknown $param
	 * @return tableau
	 */
	function getListeSearch($param) {
		$param = $this->encodeData($param);
		/*
		 * Preparation de la clause where
		 */
		$where = " where ";
		$wb = false;
		if (strlen($param["libelle"])>0) {
			$wb == true ? $where .= " and ":$wb = true;
			if (is_numeric($param["libelle"])) {
				$where .= "resolution_id = ".$param["libelle"];
			} else {
				$where .= "upper(resolution_detail) like upper('%".$param["libelle"]."%')";
			}
		}
		if ($param["resolution_mode_niv2_id"]>0 && is_numeric($param["resolution_mode_niv2_id"])) {
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "resolution_mode_niv2_id = ".$param["resolution_mode_niv2_id"];
		}
		if ($param["resolution_acteur_id"]>0 && is_numeric($param["resolution_acteur_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "resolution_acteur_id = ".$param["resolution_acteur_id"];
		}
		if ($param["nature_id"]>0 && is_numeric($param["nature_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "nature_id = ".$param["nature_id"];
		}
		if ($param["resolution_echelle_id"]>0 && is_numeric($param["resolution_echelle_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "resolution_echelle_id = ".$param["resolution_echelle_id"];
		}
		if ($wb == false)
			$where = "";
		/*
		 * Preparation de la clause de tri
		 */
		return $this->getListeParam($this->sql.$where.$this->order);
	}

	/**
	 * Lit le detail de la resolution
	 * @param int $id
	 * @return array
	 */
	function lireDetail($id) {
		if (is_numeric($id) && $id > 0){
			$sql = $this->sql." where resolution_id = ".$id ;
			return $this->lireParam($sql);
		}
	}

	/**
	 * Retourne la liste des resolutions pour un conflit
	 * @param int $conflit_id
	 * @return tableau
	 */
	function getListFromConflit($conflit_id) {
		if ($conflit_id > 0 && is_numeric($conflit_id)) {
			$sql = $this->sql ." where conflit_id = ".$conflit_id;
			return $this->getListeParam($sql.$where.$this->order);
		}
	}
	
	/**
	 * Retourne la liste des resolutions pour une solution proposee
	 * @param int $solution_proposee_id
	 * @return tableau
	 */
	function getListFromSolutionProposee($solution_proposee_id) {
		if ($solution_proposee_id > 0 && is_numeric($solution_proposee_id)) {
			$sql = $this->sql ." where solution_proposee_id = ".$solution_proposee_id;
			return $this->getListeParam($sql.$where.$this->order);
		}
	}
}

/**
 * ORM de gestion de la table solution_proposee
 * @author quinton
 *
 */
class Solution extends ObjetBDD {
	private $sql = "
			select * from solution_proposee
			natural join intervention
			natural join acteur";
	private $order = "
			 order by intervention_date_entree, solution_proposee_id";
	
	function __construct($bdd,$param=null) {
		$this->param = $param;
		$this->table="solution_proposee";
		$this->id_auto="1";
		$this->colonnes=array(
				"solution_proposee_id"=>array("type"=>1,"key"=>1, "requis"=>1, "defaultValue"=>0),
				"intervention_id"=>array("type"=>1, "requis"=>1, "parentAttrib"=>1),
				"solution_proposee_libelle"=>array("type"=>0)
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($bdd,$param);
	}

	/**
	 * Retourne la liste des solutions proposees pour une intervention
	 * @param int $intervention_id
	 * @return tableau
	 */
	function getListFromIntervention ($intervention_id) {
		if ($intervention_id > 0 && is_numeric($intervention_id)){
			$where = " where intervention_id = ".$intervention_id;
			return $this->getListeParam($this->sql.$where.$this->order);
		}
	}

	/**
	 * Retourne la liste des solutions proposees correspondant a un conflit
	 * @param unknown $conflit_id
	 * @return tableau
	 */
	function getListFromConflit ($conflit_id) {
		if ($conflit_id > 0 && is_numeric($conflit_id)){
			$where = " where conflit_id = ".$conflit_id;
			return $this->getListeParam($this->sql.$where.$this->order);
		}
	}

	/**
	 * Retourne le detail de la solution proposee
	 * @param int $id
	 * @return array
	 */
	function getDetail($id) {
		if ($id > 0 && is_numeric($id)){
			$where = " where solution_proposee_id = ".$id;
			$data = $this->lireParam($this->sql.$where);
			$data = $this->formatDatesVersLocal($data, array("intervention_date_entree", "intervention_date_sortie"));
			return ($data);
		}
	}
	
	
}

?>