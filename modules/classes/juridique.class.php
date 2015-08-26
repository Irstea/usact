<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 25 août 2015
 */
 
/**
 * ORM de gestion de la table juridique
 * @author quinton
 *
 */
class Juridique extends ObjetBDD {
	
	private $sql = "
			select * from juridique
			natural join juridiction
			left outer join juridique_sous_domaine using (juridique_sous_domaine_id)
			left outer join nature_requete using (nature_requete_id)
			left outer join type_ouvrage_perm_constr using (type_ouvrage_perm_constr_id)
			left outer join nature_travaux using (nature_travaux_id)
			left outer join decision_cassation using (decision_cassation_id)
			left outer join decision_appel using (decision_appel_id)
			left outer join acte_contentieux using (acte_contentieux_id)
			";
	private $order = " order by arret_date, juridique_id";
	
	function __construct($bdd,$param=null) {
		$this->param = $param;
		$this->table="juridique";
		$this->id_auto="1";
		$this->colonnes=array(
				"juridique_id"=>array("type"=>1,"key"=>1, "requis"=>1, "defaultValue"=>0),
				"juridiction_id"=>array("type"=>1, "requis"=>1),
				"arret_num"=>array("type"=>0, "requis"=>1),
				"arret_date"=>array("type"=>2, "requis"=>1),
				"acte_date"=>array("type"=>2, "requis"=>1),
				"juridique_sous_domaine_id"=>array("type"=>1),
				"nature_requete_id"=>array("type"=>1),
				"type_ouvrage_perm_constr_id"=>array("type"=>1),
				"nature_travaux_id"=>array("type"=>1),
				"decision_cassation_id"=>array("type"=>1),
				"decision_appel_id"=>array("type"=>1),
				"acte_contentieux_id"=>array("type"=>1),
				"juridique_libelle"=>array("type"=>0),
				"objet_precision"=>array("type"=>0),
				"article1"=>array("type"=>0),
				"article2"=>array("type"=>0),
				"article3"=>array("type"=>0),
				"article4"=>array("type"=>0),
				"article5"=>array("type"=>0),
				"jugement_date_degre1"=>array("type"=>2),
				"jugement_date_degre2"=>array("type"=>2),
				"juridique_login"=>array("type"=>0,"requis"=>1),
				"juridique_date_saisie"=>array("type"=>2,"requis"=>1)
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($bdd,$param);
	}

	/**
	 * Recherche des actes juridiques en fonction des criteres fournis
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
				$where .= "juridique_id = ".$param["libelle"];
			} else {
				$where .= "(upper(juridique_libelle) like upper('%".$param["libelle"]."%')";
				$where .= " or upper(objet_precision) like upper('%".$param["libelle"]."%')";
				$where .= " or upper(article1) like upper('%".$param["libelle"]."%')";
				$where .= " or upper(article2) like upper('%".$param["libelle"]."%')";
				$where .= " or upper(article3) like upper('%".$param["libelle"]."%')";
				$where .= " or upper(article4) like upper('%".$param["libelle"]."%')";
				$where .= " or upper(article5) like upper('%".$param["libelle"]."%')";
				$where .= ")";
			}
		}
		if ($param["juridiction_id"]>0 && is_numeric($param["juridiction_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "juridiction_id = ".$param["juridiction_id"];
		}
		if ($param["juridique_sous_domaine_id"]>0 && is_numeric($param["juridique_sous_domaine_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "juridique_sous_domaine_id = ".$param["juridique_sous_domaine_id"];
		}
		if ($param["nature_requete_id"]>0 && is_numeric($param["nature_requete_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "nature_requete_id = ".$param["nature_requete_id"];
		}
		if ($param["nature_travaux_id"]>0 && is_numeric($param["nature_travaux_id"])){
			$wb == true ? $where .= " and ":$wb = true;
			$where .= "nature_travaux_id = ".$param["nature_travaux_id"];
		}
		if ($wb == false)
			$where = "";
		return $this->getListeParam($this->sql.$where.$this->order);		
	}
	
	/**
	 * Retourne la liste des actes juridiques relies a un conflit
	 * @param int $conflit_id
	 * @return tableau
	 */
	function getListFromConflit($conflit_id) {
		if ($conflit_id > 0 && is_numeric($conflit_id)) {
			$sql = $this->sql ." natural join juridique_conflit where conflit_id = ".$conflit_id;
			return $this->getListeParam($sql.$where.$this->order);
		}
	}

	/**
	 * Retourne le detail d'un acte juridique
	 * @param int $id
	 * @return array
	 */
	function getDetail($id) {
		if (is_numeric($id) && $id > 0) {
			$where = " where juridique_id = ".$id;
			return $this->lireParam($this->sql.$where);
		}
	}
	
}

/**
 * ORM de gestion de la table juridique_conflit
 * @author quinton
 *
 */
class JuridiqueConflit extends ObjetBDD {
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "juridique_conflit";
		$this->id_auto = "0";
		$this->cleMultiple = "1";
		$this->colonnes=array(
				"juridique_id"=>array("type"=>1,"key"=>1, "requis"=>1),
				"conflit_id"=>array("type"=>1, "key"=>1, "requis"=>1)
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}

}
?>