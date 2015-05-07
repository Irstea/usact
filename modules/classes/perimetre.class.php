<?php
/**
 * Classe permettant de manipuler la table bien_support_niv1
 *
 * @author jeremy.damey
 *
 */
class bien_support_niv1 extends ObjetBDD {
	/**
	 * Instanciation de la classe et initialisation des parametres
	 *
	 * @param $link; reference
	 *        	a la connexion adoDB - $bdd
	 * @return void
	 */
	function __construct($link, $param = NULL) {
		if (! is_array ( $param ))
			$param = array ();
		$this->table = "bien_support_niv1";
		$this->id_auto = 1;
		$this->colonnes = array (
				"bien_support_niv1_id" => array (
						"type" => 1,
						"requis" => 1,
						"defaultValue" => 1,
						"key" => 1
				),
				"bien_support_niv1_libelle" => array (
						"type" => 0,
						"requis" => 1
				)
		);
		$param ["fullDescription"] = 1;
		parent::__construct ( $link, $param );
	}

	/**
	 * Reecriture de la fonction getListe
	 * (non-PHPdoc)
	 *
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	function getListe() {
		$sql = 'select bien_support_niv1_libelle
				from' .$this->table;
		return parent::getListeParam ( $sql );
	}
}

/**
 * Classe permettant de manipuler la table bien_support_niv2
 *
 * @author jeremy.damey
 *
 */
class bien_support_niv2 extends ObjetBDD {
	/**
	 * Instanciation de la classe et initialisation des parametres
	 *
	 * @param $link; reference
	 *        	a la connexion adoDB - $bdd
	 * @return void
	 */
	function __construct($link, $param = NULL) {
		if (! is_array ( $param ))
			$param = array ();
		$this->table = "bien_support_niv2";
		$this->id_auto = 1;
		$this->colonnes = array (
				"bien_support_niv2_id" => array (
						"type" => 1,
						"requis" => 1,
						"defaultValue" => 1,
						"key" => 1
				),
				"bien_support_niv1_id" => array (
						"type" => 0,
						"requis" => 1,
						"defaultValue" => 1
				),
				"bien_support_niv2_libelle" => array (
						"type" => 0,
						"requis" => 1
				)
		);
		$param ["fullDescription"] = 1;
		parent::__construct ( $link, $param );
	}

	/**
	 * Reecriture de la fonction getListe
	 * (non-PHPdoc)
	 *
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	function getListe() {
		$sql = 'select bien_support_niv2_libelle
				from' .$this->table .', bien_support_niv1
				where bien_support_niv2.bien_support_niv1_id = bien_support_niv1.bien_support_niv1_id';
		return parent::getListeParam ( $sql );
	}
}

/**
 * Classe permettant de manipuler la table objet_niv1
 *
 * @author jeremy.damey
 *
 */
class objet_niv1 extends ObjetBDD {
	/**
	 * Instanciation de la classe et initialisation des parametres
	 *
	 * @param $link; reference
	 *        	a la connexion adoDB - $bdd
	 * @return void
	 */
	function __construct($link, $param = NULL) {
		if (! is_array ( $param ))
			$param = array ();
		$this->table = "objet_niv1";
		$this->id_auto = 1;
		$this->colonnes = array (
				"objet_niv1_id" => array (
						"type" => 1,
						"requis" => 1,
						"defaultValue" => 1,
						"key" => 1
				),
				"objet_niv1_libelle" => array (
						"type" => 0,
						"requis" => 1
				)
		);
		$param ["fullDescription"] = 1;
		parent::__construct ( $link, $param );
	}

	/**
	 * Reecriture de la fonction getListe
	 * (non-PHPdoc)
	 *
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	function getListe() {
		$sql = 'select objet_niv1_libelle
				from' .$this->table;
		return parent::getListeParam ( $sql );
	}
}

/**
 * Classe permettant de manipuler la table objet_niv2
 *
 * @author jeremy.damey
 *
 */
class objet_niv2 extends ObjetBDD {
	/**
	 * Instanciation de la classe et initialisation des parametres
	 *
	 * @param $link; reference
	 *        	a la connexion adoDB - $bdd
	 * @return void
	 */
	function __construct($link, $param = NULL) {
		if (! is_array ( $param ))
			$param = array ();
		$this->table = "objet_niv2";
		$this->id_auto = 1;
		$this->colonnes = array (
				"objet_niv2_id" => array (
						"type" => 1,
						"requis" => 1,
						"defaultValue" => 1,
						"key" => 1
				),
				"objet_niv1_id" => array (
						"type" => 0,
						"requis" => 1,
						"defaultValue" => 1
				),
				"objet_niv2_libelle" => array (
						"type" => 0,
						"requis" => 1
				)
		);
		$param ["fullDescription"] = 1;
		parent::__construct ( $link, $param );
	}

	/**
	 * Reecriture de la fonction getListe
	 * (non-PHPdoc)
	 *
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	function getListe() {
		$sql = 'select objet_niv2_libelle
				from' .$this->table .', objet_niv1
				where objet_niv2.objet_niv1_id = objet_niv1.objet_niv1_id';
		return parent::getListeParam ( $sql );
	}
}

/**
 * Classe permettant de manipuler la table type_perimetre
 *
 * @author jeremy.damey
 *
 */
class type_perimetre extends ObjetBDD {
	/**
	 * Instanciation de la classe et initialisation des parametres
	 *
	 * @param $link; reference
	 *        	a la connexion adoDB - $bdd
	 * @return void
	 */
	function __construct($link, $param = NULL) {
		if (! is_array ( $param ))
			$param = array ();
		$this->table = "type_perimetre";
		$this->id_auto = 1;
		$this->colonnes = array (
				"type_perimetre_id" => array (
						"type" => 1,
						"requis" => 1,
						"defaultValue" => 1,
						"key" => 1
				),
				"type_perimetre_libelle" => array (
						"type" => 0,
						"requis" => 1
				)
		);
		$param ["fullDescription"] = 1;
		parent::__construct ( $link, $param );
	}

	/**
	 * Reecriture de la fonction getListe
	 * (non-PHPdoc)
	 *
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	function getListe() {
		$sql = 'select type_perimetre_libelle
				from' .$this->table;
		return parent::getListeParam ( $sql );
	}
}

/**
 * Classe permettant de manipuler la table echelle
 *
 * @author jeremy.damey
 *
 */
class echelle extends ObjetBDD {
	/**
	 * Instanciation de la classe et initialisation des parametres
	 *
	 * @param $link; reference
	 *        	a la connexion adoDB - $bdd
	 * @return void
	 */
	function __construct($link, $param = NULL) {
		if (! is_array ( $param ))
			$param = array ();
		$this->table = "echelle";
		$this->id_auto = 1;
		$this->colonnes = array (
				"echelle_id" => array (
						"type" => 1,
						"requis" => 1,
						"defaultValue" => 1,
						"key" => 1
				),
				"echelle_libelle" => array (
						"type" => 0,
						"requis" => 1
				)
		);
		$param ["fullDescription"] = 1;
		parent::__construct ( $link, $param );
	}

	/**
	 * Reecriture de la fonction getListe
	 * (non-PHPdoc)
	 *
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	function getListe() {
		$sql = 'select echelle_libelle
				from' .$this->table;
		return parent::getListeParam ( $sql );
	}
}

/**
 * Classe de manipulation de la table perimetre
 *
 * @author jeremy.damey
 *
 */
class perimetre extends ObjetBDD {
	/**
	 * instanciation de la classe, et initialisation des parametres
	 *
	 * @param $link; reference
	 *        	a la connexion adoDB - $bdd
	 * @return void
	 *
	 */
	function __construct($link, $param = NULL) {
		if (! is_array ( $param ))
			$param = array ();
		$this->table = "perimetre";
		$this->id_auto = 1;
		$this->colonnes = array (
				"perimetre_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1,
						"defaultValue" => 1
				),
				"conflit_id" => array (
						"type" => 1,
						"defaultValue" => 1
				),
				"type_perimetre_id" => array (
						"type" => 1,
						"defaultValue" => 1
				),
				"personne_saisie_perimetre_id" => array (
						"type" => 1,
						"defaultValue" => 1
				),
				"echelle_id" => array (
						"type" => 1,
						"defaultValue" => 1
				),
				"bien_support_niv2_id" => array (
						"type" => 1,
						"defaultValue" => 1
				),
				"objet_niv2_id" => array (
						"type" => 1,
						"defaultValue" => 1
				),
				"recurrence" => array (
						"type" => 1,
						"requis" => 1
				),
				"perimetre_date_saisie" => array (
						"type" => 3,
						"requis" => 1
				),
				"perimetre_detail" => array (
						"type" => 0,
						"longeur" => 30
				)
		);
		$param ["fullDescription"] = 1;

		parent::__construct ( $link, $param );
	}

	/**
	 * Reecriture de la fonction getListe
	 * (non-PHPdoc)
	 *
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	function getListe() {
		$sql = 'select perimetre_id,
				recurrence,
				perimetre_date_saisie,
				perimetre_detail,
				bien_support_niv2_libelle,
				type_perimetre_libelle,
				echelle_libelle,
				objet_niv2_libelle,
				personne_saisie_perimetre_nom,
				personne_saisie_perimetre_prenom,
				personne_saisie_perimetre_mail,
				conflit_date_debut,
				conflit_date_fin,
				conflit_date_saisie,
				conflit_detail
				from perimetre, personne_saisie_perimetre, conflit, bien_support_niv2, objet_niv2, type_perimetre, echelle
				where perimetre.conflit_id = conflit.conflit_id
				and perimetre.bien_support_niv2_id = bien_support_niv2.bien_support_niv2_id
				and perimetre.type_perimetre_id = type_perimetre.type_perimetre_id
				and perimetre.personne_saisie_perimetre_id = personne_saisie_perimetre.personne_saisie_perimetre_id
				and perimetre.echelle_id = echelle.echelle_id
				and perimetre.objet_niv2_id = objet_niv2.objet_niv2_id';
		return parent::getListeParam ( $sql );
	}
}
?>