<?php
/**
 * Classe de manipulation de la table perimetre
 *
 * @author jeremy.damey
 *
 */
class Perimetre extends ObjetBDD {
	/**
	 * instanciation de la classe, et initialisation des parametres
	 *
	 * @param $link; reference
	 *        	a la connexion adoDB - $bdd
	 * @return void
	 *
	 */
	private $sql = "select * from perimetre
					natural join type_perimetre
					natural join objet_niv2
					natural join objet_niv1
					left outer join echelle using (echelle_id)
					left outer join bien_support_niv2 using (bien_support_niv2_id)
					left outer join bien_support_niv1 using (bien_support_niv1_id)
					left outer join recurrence using (recurrence_id)
					";
	function __construct($link, $param = NULL) {
		if (! is_array ( $param ))
			$param = array ();
		$this->paramori = $param;
		$this->table = "perimetre";
		$this->id_auto = 1;
		$this->colonnes = array (
				"perimetre_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1,
						"defaultValue" => 0 
				),
				"type_perimetre_id" => array (
						"type" => 1 
				),
				"echelle_id" => array (
						"type" => 1 
				),
				"bien_support_niv2_id" => array (
						"type" => 1 
				),
				"objet_niv2_id" => array (
						"type" => 1 
				),
				"recurrence_id" => array (
						"type" => 1 
				),
				"perimetre_date_saisie" => array (
						"type" => 2,
						"defaultValue" => "getDateJour" 
				),
				"perimetre_detail" => array (
						"type" => 0 
				),
				"perimetre_login" => array (
						"type" => 0,
						"defaultValue" => "getLogin" 
				) 
		);
		$param ["fullDescription"] = 1;
		
		parent::__construct ( $link, $param );
	}
	
	/**
	 * Fonction permettant de lire un perimetre avec les tables liees
	 * 
	 * @param int $id        	
	 * @return array|NULL
	 */
	function lireDetail($id) {
		if (is_numeric ( $id ) && $id > 0) {
			$sql = $this->sql . " where perimetre_id = " . $id;
			return $this->lireParam ( $sql );
		} else
			return null;
	}
	
	/**
	 * Fonction ramenant la liste des perimetres en fonction des parametres
	 * de recherche fournis
	 * 
	 * @param array $param        	
	 * @return array
	 */
	function getListeSearch($param) {
		$param = $this->encodeData ( $param );
		$sql = $this->sql;
		/*
		 * Preparation de la clause where
		 */
		$where = " where ";
		$wb = false;
		if (strlen ( $param ["libelle"] ) > 0) {
			$wb == true ? $where .= " and " : $wb = true;
			if (is_numeric ( $param ["libelle"] )) {
				$where .= "perimetre_id = " . $param ["libelle"];
			} else {
				$where .= "upper(perimetre_detail) like upper('%" . $param ["libelle"] . "%')";
			}
		}
		if ($param ["objet_niv2_id"] > 0 && is_numeric ( $param ["objet_niv2_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "objet_niv2_id = " . $param ["objet_niv2_id"];
		}
		/*
		 * if ($param["objet_niv1_id"]>0 && is_numeric($param["objet_niv1_id"])) {
		 * $wb == true ? $where .= " and ":$wb = true;
		 * $where .= "objet_niv1_id = ".$param["objet_niv1_id"];
		 * }
		 */
		if ($param ["bien_support_niv2_id"] > 0 && is_numeric ( $param ["bien_support_niv2_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "bien_support_niv2_id = " . $param ["bien_support_niv2_id"];
		}
		/*
		 * if ($param["bien_support_niv1_id"]> 0 && is_numeric($param["bien_support_niv1_id"])){
		 * $wb == true ? $where .= " and ":$wb = true;
		 * $where .= "bien_support_niv1_id = ".$param["bien_support_niv1_id"];
		 * }
		 */
		if ($param ["type_perimetre_id"] > 0 && is_numeric ( $param ["type_perimetre_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "type_perimetre_id = " . $param ["type_perimetre_id"];
		}
		if ($param ["echelle_id"] > 0 && is_numeric ( $param ["echelle_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "echelle_id = " . $param ["echelle_id"];
		}
		if ($param ["recurrence_id"] > 0 && is_numeric ( $param ["recurrence_id"] )) {
			$wb == true ? $where .= " and " : $wb = true;
			$where .= "recurrence_id = " . $param ["recurrence_id"];
		}
		
		if ($wb == false)
			$where = "";
			/*
		 * Preparation de la clause de tri
		 */
		$order = " order by type_perimetre_libelle, bien_support_niv1_libelle, bien_support_niv2_libelle";
		return $this->getListeParam ( $sql . $where . $order );
	}
	/**
	 * Fonction ajoutant une localisation au perimetre
	 * @param int $localisationId
	 * @param int $perimetreId
	 */
	function localisationAdd($localisationId, $perimetreId) {
		if (is_numeric ( $localisationId ) && $localisationId > 0 && is_numeric ( $perimetreId ) && $perimetreId > 0) {
			$sql = "select * from perimetre_localisation 
					where localisation_id = " . $localisationId . "
					and perimetre_id = " . $perimetreId;
			$data = $this->lireParam ( $sql );
			if (is_null ( $data ["localisation_id"] )) {
				$data ["localisation_id"] = $localisationId;
				$data ["perimetre_id"] = $perimetreId;
				$pl = new Perimetre_localisation($this->connection, $this->paramori);
				$pl->ecrire($data);
			}
		}
	}

	/**
	 * Supprime la reference a une localisation d'un perimetre
	 * @param int $localisationId
	 * @param int $perimetreId
	 * @return code
	 */
	function localisationRemove($localisationId, $perimetreId) {
		if (is_numeric ( $localisationId ) && $localisationId > 0 && is_numeric ( $perimetreId ) && $perimetreId > 0) {
			$sql = "delete from perimetre_localisation
					where localisation_id = " . $localisationId . "
					and perimetre_id = " . $perimetreId;
			return $this->executeSQL($sql);
		}			
	}
}

/**
 * ORM de gestion de la table perimetre_localisation,
 * utilise pour mettre a jour les localisations rattachees a un perimetre
 * 
 * @author quinton
 *        
 */
class Perimetre_localisation extends ObjetBDD {
	function __construct($link, $param = NULL) {
		if (! is_array ( $param ))
			$param = array ();
		$this->table = "perimetre_localisation";
		$this->id_auto = 0;
		$this->colonnes = array (
				"perimetre_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1 
				),
				"localisation_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1 
				) 
		);
		$param ["fullDescription"] = 1;
		
		parent::__construct ( $link, $param );
	}
}
?>