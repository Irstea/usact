<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 24 août 2015
 */
 
class Article extends ObjetBDD {
	/**
	 * Constructeur de la classe
	 * @param instance ADODB $bdd
	 * @param array $param
	 */
	private $sql = "
			select * from article
			natural join journal";
	private $order = " order by journal_libelle, titre";
	function __construct($bdd,$param=null) {
		$this->param = $param;
		$this->table="article";
		$this->id_auto="1";
		$this->colonnes=array(
				"article_id"=>array("type"=>1,"key"=>1, "requis"=>1, "defaultValue"=>0),
				"journal_id"=>array("type"=>1, "requis"=>1),
				"titre"=>array("requis"=>1),
				"auteur"=>array("requis"=>1),
				"date_parution"=>array("type"=>2,"requis"=>1),
				"edition"=>array("type"=>0),
				"rubrique"=>array("type"=>0),
				"page"=>array("type"=>1),
				"entete"=>array("type"=>0),
				"piecejointe"=>array("type"=>0),
				"article_login"=>array("requis"=>1, "defaultValue"=>"getLogin"),				
				"article_date_saisie"=>array("type"=>2, "requis"=>1, "defaultValue"=>"getDateJour")
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($bdd,$param);
	}
	
	/**
	 * Retourne la liste des articles correspondants aux criteres fournis
	 * @param array $param
	 * @return tableau
	 */
	function getListSearch($param) {
		$param = $this->encodeData ( $param );
		$where = " where ";
		$wb = false;
		if (strlen ( $param ["libelle"] ) > 0) {
			$wb == true ? $where .= " and " : $wb = true;
			if (is_numeric ( $param ["libelle"] )) {
				$where .= "journal_id = " . $param ["libelle"];
			} else {
				$where .= "(upper(titre) like upper('%" . $param ["libelle"] . "%')";
				$where .= " or upper(auteur) like upper('%" . $param ["libelle"] . "%')";
				$where .= ")";
			}
		}
		if ($param ["journal_id"] > 0 && is_numeric ( $param ["journal_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "journal_id = " . $param ["journal_id"];
		}
		if ($wb == false)
			$where = "";
		$order = " order by journal_libelle, titre";
		return $this->getListeParam ( $this->sql . $where . $this->order );
	}

	/**
	 * Retourne la liste des articles correspondants a un conflit
	 * @param unknown $conflit_id
	 * @return tableau
	 */
	function getListFromConflit($conflit_id) {
		if (is_numeric($conflit_id) && $conflit_id > 0) {
			$sql = $this->sql." natural join article_conflit";
			$where = " where conflit_id = ".$conflit_id;
			return $this->getListeParam($sql.$where.$this->order);
		}
	}
	
	/**
	 * Retourne la liste des articles correspondants a un intervention
	 * @param unknown $intervention_id
	 * @return tableau
	 */
	function getListFromIntervention($intervention_id) {
		if (is_numeric($intervention_id) && $intervention_id > 0) {
			$sql = $this->sql." natural join article_intervention";
			$where = " where intervention_id = ".$intervention_id;
			return $this->getListeParam($sql.$where.$this->order);
		}
	}
	/**
	 * Surcharge de la fonction lire pour associer le journal
	 * {@inheritDoc}
	 * @see ObjetBDD::lire()
	 */
	function lire($id, $getDefault=false, $parentValue=0) {
		$data = array();
		if (is_numeric($id) && $id > 0) {
			$where = " where article_id = ".$id;
			$data = parent::lireParam($this->sql.$where);
		} elseif ($getDefault) {
			$data = parent::getDefaultValue($parentValue);
		}
		return $data;
	}
	
}
/**
 * ORM de gestion de la table article_conflit
 * @author quinton
 *
 */
class ArticleConflit extends ObjetBDD {
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "article_conflit";
		$this->id_auto = "0";
		$this->cleMultiple = "1";
		$this->colonnes=array(
				"article_id"=>array("type"=>1,"key"=>1, "requis"=>1),
				"conflit_id"=>array("type"=>1, "key"=>1, "requis"=>1),
				"action_type_id"=>array("type"=>1)
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}

}

/**
 * ORM de gestion de la table article_intervention
 * @author quinton
 *
 */
class ArticleIntervention extends ObjetBDD {
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "article_intervention";
		$this->id_auto = "0";
		$this->cleMultiple = "1";
		$this->colonnes=array(
				"article_id"=>array("type"=>1,"key"=>1, "requis"=>1),
				"intervention_id"=>array("type"=>1, "key"=>1, "requis"=>1));
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}

}
?>