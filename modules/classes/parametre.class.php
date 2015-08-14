<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 13 août 2015
 */
 
/**
 * Classe generique pour gerer l'ensemble des tables de parametres
 * @author quinton
 *
 */
class Parametre extends ObjetBDD {
	/**
	 * 
	 * @param connexion $bdd
	 * @param string $nomTable
	 * @param array $param
	 */
	function __construct($bdd,$nomTable, $param=null) {
		$this->param = $param;
		$this->table=$nomTable;
		$this->id_auto="1";
		$this->colonnes=array(
				$nomTable."_id"=>array("type"=>1,"key"=>1, "requis"=>1, "defaultValue"=>0),
				$nomTable."_libelle"=>array("type"=>0,"requis"=>1)
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($bdd,$param);
	}

	/**
	 * Fonction rajoutant des noms de champs generiques, pour faciliter l'affichage
	 * @param array $data
	 * @return array
	 */
	function generalise(array $data,$is_collection = true) {
		if ($is_collection == true) {
		foreach ($data as $key=>$value) {
			$data[$key]["id"] = $value[$this->table."_id"];
			$data[$key]["libelle"] = $value[$this->table."_libelle"];
		}
		} else {
			$data["id"] = $data[$this->table."_id"];
			$data["libelle"] = $data[$this->table."_libelle"];
		}
		return $data;
	}
}

/**
 * Classe generique pour gerer les tables de parametres de niveau 2 
 * (avec reference a une table de parametres parente)
 * @author quinton
 *
 */
class Parametre_niv2 extends ObjetBDD {
	public $nomTableParent;

	/**
	 * Constructeur
	 * @param connexion $bdd
	 * @param string $nomTable
	 * @param string $nomTableParent
	 * @param array $param
	 */
	function __construct($bdd, $nomTable, $nomTableParent, $param=null) {
		$this->param = $param;
		$this->table=$nomTable;
		$this->nomTableParent = $nomTableParent;
		$this->id_auto="1";
		$this->colonnes=array(
				$nomTable."_id"=>array("type"=>1,"key"=>1, "requis"=>1, "defaultValue"=>0),
				$nomTable."_libelle"=>array("type"=>0,"requis"=>1),
				$nomTableParent."_id"=>array("type"=>1,"requis"=>1, "parentAttrib"=>1)
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($bdd,$param);
	}

	/**
	 * Surcharge de la fonction getListe pour gerer l'affichage des donnees de la table parente
	 * (non-PHPdoc)
	 * @see ObjetBDD::getListe()
	 * @return array
	 */
	function getListe($order=0) {
		$sql = "select * from ".$this->table."
				natural join ".$this->nomTableParent;
		if ($order != 0 ) {
			$sql .= " order by ".$order;
		} else 
			$sql .= " order by 2,3";
		return $this->getListeParam($sql);
	}
	
	/**
	 * Fonction rajoutant des noms de champs generiques, pour faciliter l'affichage
	 * @param array $data
	 * @return array
	 */
	function generalise(array $data,$is_collection = true) {
		if ($is_collection == true) {
			foreach ($data as $key=>$value) {
				$data[$key]["id"] = $value[$this->table."_id"];
				$data[$key]["libelle"] = $value[$this->table."_libelle"];
				$data[$key]["parent_libelle"] = $value[$this->nomTableParent."_libelle"];
				$data[$key]["parent_id"] = $value[$this->nomTableParent."_id"];
			}
		} else {
			$data["id"] = $data[$this->table."_id"];
			$data["libelle"] = $data[$this->table."_libelle"];
			$data[$key]["parent_id"] = $value[$this->nomTableParent."_id"];
		}
		return $data;
	}
}

class Acteur_niv3 extends ObjetBDD {
	function __construct($bdd, $param=null) {
		$this->param = $param;
		$this->table="acteur_niv3";
		$this->id_auto="1";
		$this->colonnes=array(
				"acteur_niv3_id"=>array("type"=>1,"key"=>1, "requis"=>1, "defaultValue"=>0),
				"acteur_niv3_libelle"=>array("type"=>0,"requis"=>1),
				"acteur_niv2_id"=>array("type"=>0, "requis"=>1, "parentAttrib"=>1)
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($bdd,$param);
	}

	/**
	 * Retourne la liste avec les tables parentes attachees
	 * (non-PHPdoc)
	 * @see ObjetBDD::getListe()
	 */
	function getListe($order=0) {
		$sql = "select * from ".$this->table."
				natural join acteur_niv2
				natural join acteur_niv1
				order by ";
		$order != 0 ? $sql .= $order : $sql .= " 2,3,4";
		return $this->getListeParam($sql);
	}
	
}


?>