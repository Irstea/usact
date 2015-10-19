<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 20 août 2015
 */

/**
 * ORM de gestion de la table expert
 *
 * @author quinton
 *        
 */
class Expert extends ObjetBDD {
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "expert";
		$this->id_auto = "1";
		$this->colonnes=array(
				"expert_id"=>array("type"=>1,"key"=>1, "requis"=>1, "defaultValue"=>0),
				"acteur_id"=>array("type"=>1),
				"expert_nom"=>array("requis"=>1),
				"expert_prenom"=>array("requis"=>1),
				"sexe"=>array("requis"=>1,"pattern"=>"#[FH]#", "defaultValue"=>"H"),
				"commune_residence"=>array("type"=>0),
				"lien_territoire"=>array("requis"=>1),
				"activite_assoc"=>array("type"=>0),
				"activite_prof"=>array("requis"=>1),
				"annee_naissance"=>array("type"=>1)
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	
	/**
	 * Recherche de la liste des experts
	 *
	 * @param array $param        	
	 * @return tableau
	 */
	function getListeSearch($param) {
		$param = $this->encodeData ( $param );
		$sql = "select * from expert";
		$where = " where ";
		$wb = false;
		if (strlen ( $param ["libelle"] ) > 0) {
			$wb == true ? $where .= " and " : $wb = true;
			if (is_numeric ( $param ["libelle"] )) {
				$where .= "expert_id = " . $param ["libelle"];
			} else {
				$where .= "(upper(expert_nom) like upper('%" . $param ["libelle"] . "%')";
				$where .= " or upper(commune_residence) like upper('%" . $param ["libelle"] . "%')";
				$where .= " or upper(lien_territoire) like upper('%" . $param ["libelle"] . "%')";
				$where .= " or upper(activite_prof) like upper('%" . $param ["libelle"] . "%')";
				$where .= ")";
			}
		}
		if ($wb == false)
			$where = "";
			/*
		 * Preparation de la clause de tri
		 */
		$order = " order by expert_nom, expert_prenom";
		return $this->getListeParam ( $sql . $where . $order );
	}
}

/**
 * ORM de gestion de la table entretien
 * @author quinton
 *
 */
class Entretien extends ObjetBDD {
	private $sql = "select * from entretien";
	
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "entretien";
		$this->id_auto = "1";
		$this->colonnes=array(
				"entretien_id"=>array("type"=>1,"key"=>1, "requis"=>1, "defaultValue"=>0),
				"expert_id"=>array("type"=>1, "requis"=>1, "parentAttrib"=>1),
				"entretien_date"=>array("type"=>2, "requis"=>1),
				"institution"=>array("requis"=>1),
				"statut"=>array("requis"=>1),
				"localisation"=>array("requis"=>1),
				"binome"=>array("requis"=>1),
				"entretien_login"=>array("type"=>0, "defaultValue"=>"getLogin"),
				"entretien_date_saisie"=>array("type"=>2, "defaultValue"=>"getDateJour"),
				"piece_jointe"=>array("type"=>0)
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}

	/**
	 * Retourne la liste des entretiens se rapportant a un conflit
	 * @param unknown $conflit_id
	 * @return tableau
	 */
	function getListFromConflit($conflit_id) {
		if ($conflit_id > 0 && is_numeric($conflit_id)) {
			$sql = $this->sql." natural join entretien_conflit";
			$where = " where conflit_id = ".$conflit_id;
			$order = " order by conflit_id";
			return $this->getListeParam($sql.$where.$order);
		}
	}

	/**
	 * Retourne la liste des entretiens se rapportant à une intervention
	 * @param unknown $intervention_id
	 * @return tableau
	 */
	function getListFromIntervention($intervention_id) {
		if (is_numeric($intervention_id) && $intervention_id > 0) {
			$sql = $this->sql. " natural join entretien_intervention";
			$where = " where intervention_id = ".$intervention_id;
			$order = " order by intervention_id";
			return $this->getListeParam($sql.$where.$order);
		}
	}
}

/**
 * ORM de gestion de la table entretien_conflit
 * @author quinton
 *
 */
class EntretienConflit extends ObjetBDD {
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "entretien_conflit";
		$this->id_auto = "0";
		$this->cleMultiple = "1";
		$this->colonnes=array(
				"entretien_id"=>array("type"=>1,"key"=>1, "requis"=>1),
				"conflit_id"=>array("type"=>1, "key"=>1, "requis"=>1));
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
		}
		
}

/**
 * ORM de gestion de la table entretien_intervention
 * @author quinton
 *
 */
class EntretienIntervention extends ObjetBDD {
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "entretien_intervention";
		$this->id_auto = "0";
		$this->cleMultiple = "1";
		$this->colonnes=array(
				"entretien_id"=>array("type"=>1,"key"=>1, "requis"=>1),
				"intervention_id"=>array("type"=>1, "key"=>1, "requis"=>1));
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}

}
?>