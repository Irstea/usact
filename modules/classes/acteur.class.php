<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 18 août 2015
 */

/**
 * ORM de gestion de la table acteur
 *
 * @author quinton
 *        
 */
class Acteur extends ObjetBDD {
	private $sql = "
			select * 
			from acteur
			natural join acteur_niv3
			natural join acteur_niv2
			natural join acteur_niv1
			left outer join particulier_resident_type using (particulier_resident_type_id)
			";
	private $sqlSearch = "
			select distinct acteur.*, acteur_niv3_libelle, acteur_niv2_libelle, acteur_niv1_libelle,
			particulier_resident_type_libelle
			from acteur
			natural join acteur_niv3
			natural join acteur_niv2
			natural join acteur_niv1
			left outer join acteur_structure using (acteur_id)
			left outer join acteur_mandat using (acteur_id)
			left outer join particulier_resident_type using (particulier_resident_type_id)
			";
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "acteur";
		$this->id_auto = "1";
		$this->colonnes = array (
				"acteur_id" => array (
						"type" => 1,
						"key" => 1,
						"requis" => 1,
						"defaultValue" => 0 
				),
				"acteur_niv3_id" => array (
						"type" => 1,
						"requis" => 1 
				),
				"acteur_physique_nom" => array (
						"type" => 0 
				),
				"acteur_moral_nom" => array (
						"type" => 0 
				),
				"acteur_statut" => array (
						"type" => 0 
				),
				"acteur_statut_detail" => array (
						"type" => 0 
				),
				"commune_physique" => array (
						"type" => 0 
				),
				"cp_physique" => array (
						"type" => 0 
				),
				"commune_morale" => array (
						"type" => 0 
				),
				"cp_morale" => array (
						"type" => 0 
				),
				"acteur_date_saisie" => array (
						"type" => 2,
						"requis" => 1,
						"defaultValue" => "getDateJour" 
				),
				"acteur_login" => array (
						"type" => 0 ,
						"defaultValue" => "getLogin"
				),
				"particulier_resident_type_id" => array (
						"type" => 1 
				) 
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	
	/**
	 * Retourne le detail d'un acteur
	 *
	 * @param int $id        	
	 * @return array|NULL
	 */
	function getDetail($id) {
		if (is_numeric ( $id ) && $id > 0) {
			$where = " where acteur_id = " . $id;
			return $this->lireParam ( $this->sql . $where );
		} else
			return null;
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
		if (strlen ( $param ["libelle"] ) > 0) {
			$wb == true ? $where .= " and " : $wb = true;
			if (is_numeric ( $param ["libelle"] )) {
				$where .= "acteur_id = " . $param ["libelle"];
			} else {
				$where .= "(upper(acteur_physique_nom) like upper('%" . $param ["libelle"] . "%')";
				$where .= " or upper(acteur_moral_nom) like upper('%" . $param ["libelle"] . "%')";
				$where .= " or upper(commune_physique) like upper('%" . $param ["libelle"] . "%')";
				$where .= " or upper(commune_morale) like upper('%" . $param ["libelle"] . "%')";
				$where .= ")";
			}
		}
		if ($param ["acteur_niv3_id"] > 0 && is_numeric ( $param ["acteur_niv3_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "acteur_niv3_id = " . $param ["acteur_niv3_id"];
		}
		if ($param ["structure_type_id"] > 0 && is_numeric ( $param ["structure_type_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "structure_type_id = " . $param ["structure_type_id"];
		}
		if ($param ["mandat_type_id"] > 0 && is_numeric ( $param ["mandat_type_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "mandat_type_id = " . $param ["mandat_type_id"];
		}
		if ($wb == false)
			$where = "";
			/*
		 * Preparation de la clause de tri
		 */
		$order = " order by acteur_moral_nom, acteur_physique_nom";
		return $this->getListeParam ( $this->sqlSearch . $where . $order );
	}
}
/**
 * ORM de gestion de la table acteur_mandat
 *
 * @author quinton
 *        
 */
class ActeurMandat extends ObjetBDD {
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "acteur_mandat";
		$this->id_auto = "1";
		$this->colonnes = array (
				"acteur_mandat_id" => array (
						"type" => 1,
						"key" => 1,
						"requis" => 1,
						"defaultValue" => 0 
				),
				"acteur_id" => array (
						"type" => 1,
						"requis" => 1,
						"parentAttrib" => 1 
				),
				"mandat_type_id" => array (
						"type" => 1,
						"requis" => 1 
				),
				"mandat_detail" => array (
						"type" => 0 
				) 
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	
	/**
	 * Retourne la liste des mandats d'un acteur
	 *
	 * @param int $acteur_id        	
	 * @return tableau|NULL
	 */
	function getListFromActeur($acteur_id) {
		if (is_numeric ( $acteur_id ) && $acteur_id > 0) {
			$sql = "select * from acteur_mandat
					natural join mandat_type
					where acteur_id = " . $acteur_id . "
					order by mandat_type_libelle";
			return $this->getListeParam ( $sql );
		} else
			return null;
	}
}

/**
 * ORM de gestion de la table acteur_structure
 *
 * @author quinton
 *        
 */
class ActeurStructure extends ObjetBDD {
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "acteur_structure";
		$this->id_auto = "1";
		$this->colonnes = array (
				"acteur_structure_id" => array (
						"type" => 1,
						"key" => 1,
						"requis" => 1,
						"defaultValue" => 0 
				),
				"acteur_id" => array (
						"type" => 1,
						"requis" => 1,
						"parentAttrib" => 1 
				),
				"structure_type_id" => array (
						"type" => 1,
						"requis" => 1 
				),
				"structure_statut_detail" => array (
						"type" => 0 
				),
				"structure_statut" => array (
						"type" => 0 
				) 
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	
	/**
	 * Retourne la liste des structures d'un acteur
	 *
	 * @param int $acteur_id        	
	 * @return tableau|NULL
	 */
	function getListFromActeur($acteur_id) {
		if (is_numeric ( $acteur_id ) && $acteur_id > 0) {
			$sql = "select * from acteur_structure
					natural join structure_type
					where acteur_id = " . $acteur_id . "
					order by structure_type_libelle";
			return $this->getListeParam ( $sql );
		} else
			return null;
	}
}

?>