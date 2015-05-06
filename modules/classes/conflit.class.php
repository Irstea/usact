<?php
/**
 * Classe permettant de manipuler la table personne_saisie_conflit
 * @author jeremy.damey
 *
 */
class personne_saisie_conflit extends ObjetBDD {
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
		$this->table = "arcachon.personne_saisie_conflit";
		$this->id_auto = 1;
		$this->colonnes = array (
				"personne_saisie_conflit_id" => array (
						"type" => 1,
						"requis" => 1,
						"defaultValue" => 0,
						"key" => 1 
				),
				"personne_saisie_conflit_nom" => array (
						"type" => 0,
						"requis" => 1 
				),
				"personne_saisie_conflit_prenom" => array (
						"type" => 0,
						"requis" => 1 
				),
				"personne_saisie_conflit_mail" => array (
						"type" => 0,
						"requis" => 1
				),
				"personne_saisie_conflit_date_naissance" => array (
						"type" => 3,
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
		$sql = 'select * from arcachon.personne_saisie_conflit
				order by arcachon.personne_saisie_conflit.personne_saisie_conflit_nom';
		return parent::getListeParam ( $sql );
	}
}


/**
 * Classe de manipulation de la table conflit
 * 
 * @author jeremy.damey
 *
 */
class conflit extends ObjetBDD {
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
		$this->table = "arcachon.conflit";
		$this->id_auto = 1;
		$this->colonnes = array (
				"conflit_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1,
						"defaultValue" => 0 
				),
				"personne_saisie_conflit_id" => array (
						"type" => 1,
						"requis" => 1,
						"defaultValue" => 0
				),
				"conflit_date_debut" => array (
						"type" => 3 
				),
				"conflit_date_fin" => array (
						"type" => 3 
				),
				"conflit_date_saisie" => array (
						"type" => 3
				),

				"conflit_detail" => array (
						"type" => 0,
						"requis" => 1,
						"longueur" => 30
				)
		);
		$param ["fullDescription"] = 1;
		
		parent::__construct ( $link, $param );
	}
	/**
	 * Retourne la liste des personnels en fonction des critères de recherche fournis
	 *
	 * @param unknown $param        	
	 *
	 */
	function getListeSearch($param) {
		$sql = 'select *
				from arcachon.personne_saisie_conflit,arcachon.conflit
				where arcachon.personne_saisie_conflit.personne_saisie_conflit_id = arcachon.conflit.personne_saisie_conflit_id';
				
		/*
		 * Rajout des parametres de recherche
		 */
		if (strlen ( $param ["searchId"] ) > 0)
			$where .= ' and arcachon.conflit.conflit_id ='.$param["searchId"];
		
		$order = ' order by arcachon.conflit.conflit_id';
		
		return parent::getListeParam ( $sql . $where . $order);
	}
	function lireDetail($id) {
		$sql = 'select *
				from arcachon.conflit,arcachon.personne_saisie_conflit
				where arcachon.personne_saisie_conflit.personne_saisie_conflit_id = arcachon.conflit.personne_saisie_conflit_id
				and arcachon.conflit.conflit_id = '.$id
				.'order by arcachon.conflit.conflit_id';
		return parent::lireParam ( $sql );
	}
}
?>

