<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 13 août 2015
 */

/**
 * Classe generique pour gerer l'ensemble des tables de parametres
 * 
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
	function __construct($bdd, $nomTable, $param = null) {
		$this->param = $param;
		$this->table = $nomTable;
		$this->id_auto = "1";
		$this->colonnes [$nomTable . "_id"] = array (
				"type" => 1,
				"key" => 1,
				"requis" => 1,
				"defaultValue" => 0 
		);
		$this->colonnes [$nomTable . "_libelle"] = array (
				"type" => 0,
				"requis" => 1 
		);
		if (! is_array ( $param ))
			$param = array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	
	/**
	 * Fonction rajoutant des noms de champs generiques, pour faciliter l'affichage
	 * 
	 * @param array $data        	
	 * @return array
	 */
	function generalise(array $data, $is_collection = true) {
		if ($is_collection == true) {
			foreach ( $data as $key => $value ) {
				$data [$key] ["id"] = $value [$this->table . "_id"];
				$data [$key] ["libelle"] = $value [$this->table . "_libelle"];
			}
		} else {
			$data ["id"] = $data [$this->table . "_id"];
			$data ["libelle"] = $data [$this->table . "_libelle"];
		}
		return $data;
	}
	
	/**
	 * Surcharge de la fonction getListe pour gerer l'affichage des donnees de la table parente
	 * (non-PHPdoc)
	 * 
	 * @see ObjetBDD::getListe()
	 * @return array
	 */
	function getListe($order = 0) {
		$sql = "select * ";		
		$from = " from " . $this->table;
		if ($order != 0) {
			$order = " order by " . $order;
		} else
			$order = " order by 2";
		return $this->getListeParam ( $sql . $from . $order );
	}
}

/**
 * Classe generique pour gerer les tables de parametres de niveau 2
 * (avec reference a une table de parametres parente)
 * 
 * @author quinton
 *        
 */
class Parametre_niv2 extends ObjetBDD {
	public $nomTableParent;
	
	/**
	 * Constructeur
	 * 
	 * @param connexion $bdd        	
	 * @param string $nomTable        	
	 * @param string $nomTableParent        	
	 * @param array $param        	
	 */
	function __construct($bdd, $nomTable, $nomTableParent, $param = null) {
		$this->param = $param;
		$this->table = $nomTable;
		$this->nomTableParent = $nomTableParent;
		$this->id_auto = "1";
		$this->colonnes = array (
				$nomTable . "_id" => array (
						"type" => 1,
						"key" => 1,
						"requis" => 1,
						"defaultValue" => 0 
				),
				$nomTable . "_libelle" => array (
						"type" => 0,
						"requis" => 1 
				),
				$nomTableParent . "_id" => array (
						"type" => 1,
						"requis" => 1,
						"parentAttrib" => 1 
				) 
		);
		if (! is_array ( $param ))
			$param = array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	
	/**
	 * Surcharge de la fonction getListe pour gerer l'affichage des donnees de la table parente
	 * Ajout (le 19/10/2015) des champs $parentTable et $parentField, pour les tables objet_niv1 et
	 * usage_activite_niv1
	 * (non-PHPdoc)
	 * 
	 * @see ObjetBDD::getListe()
	 * @return array
	 */
	function getListe($order = 0, $parentTable = "", $parentId = 0) {
		$sql = "select * from " . $this->table . "
				natural join " . $this->nomTableParent;
		/*
		 * Ajout de la recherche par table super parente
		 */
		$where = "";
		if (strlen($parentTable) > 0 && $parentId > 0 && is_numeric($parentId)) {
			$sql .= " natural join ".$parentTable;
			$where = " where ".$parentTable."_id = ".$parentId;
		}
		$order != 0 ? $order = " order by " . $order : $order = " order by ".$this->nomTableParent."_libelle,
				".$this->table."_libelle";
		return $this->getListeParam ( $sql.$where.$order );
	}
	
	/**
	 * Fonction rajoutant des noms de champs generiques, pour faciliter l'affichage
	 * 
	 * @param array $data        	
	 * @return array
	 */
	function generalise(array $data, $is_collection = true) {
		if ($is_collection == true) {
			foreach ( $data as $key => $value ) {
				$data [$key] ["id"] = $value [$this->table . "_id"];
				$data [$key] ["libelle"] = $value [$this->table . "_libelle"];
				$data [$key] ["parent_libelle"] = $value [$this->nomTableParent . "_libelle"];
				$data [$key] ["parent_id"] = $value [$this->nomTableParent . "_id"];
			}
		} else {
			$data ["id"] = $data [$this->table . "_id"];
			$data ["libelle"] = $data [$this->table . "_libelle"];
			$data [$key] ["parent_id"] = $value [$this->nomTableParent . "_id"];
		}
		return $data;
	}
}
class Acteur_niv3 extends ObjetBDD {
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "acteur_niv3";
		$this->id_auto = "1";
		$this->colonnes = array (
				"acteur_niv3_id" => array (
						"type" => 1,
						"key" => 1,
						"requis" => 1,
						"defaultValue" => 0 
				),
				"acteur_niv3_libelle" => array (
						"type" => 0,
						"requis" => 1 
				),
				"acteur_niv2_id" => array (
						"type" => 0,
						"requis" => 1,
						"parentAttrib" => 1 
				) 
		);
		if (! is_array ( $param ))
			$param = array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	
	/**
	 * Retourne la liste avec les tables parentes attachees
	 * (non-PHPdoc)
	 * 
	 * @see ObjetBDD::getListe()
	 */
	function getListe($order = 0) {
		$sql = "select * from " . $this->table . "
				natural join acteur_niv2
				natural join acteur_niv1
				order by ";
		$order != 0 ? $sql .= $order : $sql .= " acteur_niv1_libelle, acteur_niv2_libelle, acteur_niv3_libelle";
		return $this->getListeParam ( $sql );
	}
}

/**
 * ORM de gestion de la table objet_niv1,
 * cree pour rajouter la colonne type_perimetre_id
 * 
 * @author quinton
 *        
 */
class Objet_niv1 extends ObjetBDD {
	function __construct($bdd, $param = null) {
		$this->table = "objet_niv1";
		$this->id_auto = "1";
		$this->colonnes = array (
				"objet_niv1_id" => array (
						"type" => 1,
						"key" => 1,
						"requis" => 1,
						"defaultValue" => 0 
				),
				"objet_niv1_libelle" => array (
						"type" => 0,
						"requis" => 1 
				),
				"type_perimetre_id" => array (
						"type" => 1,
						"defaultValue" => 2,
						"requis" => 1 
				) 
		);
		if (! is_array ( $param ))
			$param = array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	
	/**
	 * Surcharge de la fonction write pour rajouter la colonne type_perimetre_id
	 * (non-PHPdoc)
	 * 
	 * @see ObjetBDD::write()
	 */
	function write($data) {
		if (is_numeric ( $data ["select_id"] ) && $data ["select_id"] > 0)
			$data ["type_perimetre_id"] = $data ["select_id"];
		return parent::write ( $data );
	}
	
	/**
	 * Reecriture de la fonction generalise, pour prendre en compte le champ supplementaire
	 * (non-PHPdoc)
	 * 
	 * @see Parametre::generalise()
	 */
	function generalise($data, $is_collection = true) {
		if ($is_collection == true) {
			foreach ( $data as $key => $value ) {
				$data [$key] ["id"] = $value [$this->table . "_id"];
				$data [$key] ["libelle"] = $value [$this->table . "_libelle"];
				$data [$key] ["select_id"] = $value ["type_perimetre_id"];
				$data[$key]["select_libelle"] = $value ["type_perimetre_libelle"];
			}
		} else {
			$data ["id"] = $data [$this->table . "_id"];
			$data ["libelle"] = $data [$this->table . "_libelle"];
			$data ["select_id"] = $data ["type_perimetre_id"];
			$data["select_libelle"] = $data ["type_perimetre_libelle"];
		}
		return $data;
	}
	
	/**
	 * Surcharge de la fonction getListe pour gerer l'affichage des donnees de la table parente
	 * (non-PHPdoc)
	 *
	 * @see ObjetBDD::getListe()
	 * @return array
	 */
	function getListe($order = 0) {
		$sql = "select * ";	
		$from = " from " . $this->table;
		$from .= " natural join type_perimetre";
		if ($order != 0) {
			$order = " order by " . $order;
		} else
			$order = " order by 2";
		return $this->getListeParam ( $sql . $from . $order );
	}
	
}

/**
 * ORM de gestion de la table usage_activite_niv1,
 * cree pour rajouter la colonne position_usage_activite_id
 * 
 * @author quinton
 *        
 */
class Usage_activite_niv1 extends ObjetBDD {
	function __construct($bdd, $param = null) {
		$this->table = "usage_activite_niv1";
		$this->id_auto = "1";
		$this->colonnes = array (
				"usage_activite_niv1_id" => array (
						"type" => 1,
						"key" => 1,
						"requis" => 1,
						"defaultValue" => 0 
				),
				"usage_activite_niv1_libelle" => array (
						"type" => 0,
						"requis" => 1 
				),
				"position_usage_activite_id" => array (
						"type" => 1,
						"defaultValue" => 2,
						"requis" => 1 
				) 
		);
		if (! is_array ( $param ))
			$param = array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	
	/**
	 * Surcharge de la fonction write pour rajouter la colonne type_perimetre_id
	 * (non-PHPdoc)
	 * 
	 * @see ObjetBDD::write()
	 */
	function write($data) {
		if (is_numeric ( $data ["select_id"] ) && $data ["select_id"] > 0)
			$data ["position_usage_activite_id"] = $data ["select_id"];
		return parent::write ( $data );
	}
	
	/**
	 * Reecriture de la fonction generalise, pour prendre en compte le champ supplementaire
	 * (non-PHPdoc)
	 * 
	 * @see Parametre::generalise()
	 */
	function generalise($data, $is_collection = true) {
		if ($is_collection == true) {
			foreach ( $data as $key => $value ) {
				$data [$key] ["id"] = $value [$this->table . "_id"];
				$data [$key] ["libelle"] = $value [$this->table . "_libelle"];
				$data [$key] ["select_id"] = $value ["position_usage_activite_id"];
				$data [$key] ["select_libelle"] = $value ["position_usage_activite_libelle"];
			}
		} else {
			$data ["id"] = $data [$this->table . "_id"];
			$data ["libelle"] = $data [$this->table . "_libelle"];
			$data ["select_id"] = $data ["position_usage_activite_id"];
			$data["select_libelle"] = $data ["position_usage_activite_libelle"];
		}
		return $data;
	}
	/**
	 * Surcharge de la fonction getListe pour gerer l'affichage des donnees de la table parente
	 * (non-PHPdoc)
	 *
	 * @see ObjetBDD::getListe()
	 * @return array
	 */
	function getListe($order = 0) {
		$sql = "select * ";
		$from = " from " . $this->table;
		$from .= " natural join position_usage_activite";
		if ($order != 0) {
			$order = " order by " . $order;
		} else
			$order = " order by 2";
		return $this->getListeParam ( $sql . $from . $order );
	}
	
}

?>