<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2015, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 23 oct. 2015
 */

/**
 * ORM de gestion de la table commune
 * @author quinton
 *
 */
class Commune extends ObjetBDD {
	/**
	 * Constructeur de la classe
	 * 
	 * @param
	 *        	instance ADODB $bdd
	 * @param array $param        	
	 */

	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "commune";
		$this->id_auto = "0";
		$this->colonnes = array (
				"insee"=>array("ley"=>1,"type"=>1, "requis"=>1),
				"commune_nom"=>array("requis"=>1),
				"departement"=>array("type"=>0),
				"commune_insee"=>array("type"=>0)
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}

	/**
	 * Retourne la liste des communes correspondant soit au numero insee, 
	 * soit a une partie du nom de la commune
	 * @param unknown $lSearch
	 * @return tableau
	 */
	function search($lSearch) {
		$sql = "select * from ".$this->table;
		$where = "";
		$order = " order by insee";
		$lSearch = $this->encodeData($lSearch);
		$long = strlen($lSearch);
		if ($long > 0) {
			$where = " where upper(commune_nom) like upper('%".$lSearch."%')
					or commune_insee = upper('$lSearch')";
			
		}
		return $this->getListeParam($sql.$where.$order);
	}
}

class Localisation extends ObjetBDD {
	private $sql = "select * from localisation natural join commune";
	private $order = " order by commune_insee, precision_adresse";
	

	/**
	 * Constructeur de la classe
	 *
	 * @param
	 *        	instance ADODB $bdd
	 * @param array $param
	 */

	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "localisation";
		$this->id_auto = "1";
		$this->colonnes = array (
				"localisation_id"=>array("key"=>1, "type"=>1, "requis"=>1, "defaultValue"=>0),
				"insee"=>array("type"=>1, "requis"=>1),
				"precision_adresse"=>array("type"=>0),
				"wgs84x"=>array("type"=>1),
				"wgs84y"=>array("type"=>1)
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}

	/**
	 * Recherche une localisation a partir de la commune ou du complement d'adresse
	 * @param unknown $lSearch
	 * @return tableau
	 */
	function search($lSearch) {
		$where = "";
		$lSearch = $this->encodeData($lSearch);
		$long = strlen($lSearch);
		if ($long > 0) {
			$where = " where upper(commune_nom) like upper('%".$lSearch."%')
			or commune_insee = upper('$lSearch')";
		}
		return $this->getListeParam($this->sql.$where.$this->order);
	}

	/**
	 * Retourne la liste des localisations attachees a un perimetre
	 * @param unknown $perimetre_id
	 * @return tableau
	 */
	function getListFromPerimetre($perimetre_id) {
		if (is_numeric($perimetre_id) && $perimetre_id > 0){
			$where = " where perimetre_id = ".$perimetre_id;
			$sql = $this->sql . " natural join perimetre_localisation";
			return $this->getListeParam($sql.$where.$this->order);
		}
			
	}
	/**
	 * Surcharge pour integrer la lecture de la commune
	 * {@inheritDoc}
	 * @see ObjetBDD::lire()
	 */
	function lire($id, $getDefault=false, $parentValue=0) {
		$data = array();
		if (is_numeric($id) && $id > 0) {
			$where = " where localisation_id = $id";
			$data = $this->lireParam($this->sql.$where);
		} elseif ($getDefault) {
			$data = $this->getDefaultValue($parentValue);
		}
		return $data;
	}
	

}
?>