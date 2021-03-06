<?php
/**
 * Classe de base pour gerer des parametres de recherche
 * Classe non instanciable, a heriter
 * L'instance doit etre conservee en variable de session
 * @author Eric Quinton
 *
 */
class SearchParam {
	/**
	 * Tableau des parametres geres par la classe
	 * La liste des parametres doit etre declaree dans la fonction construct
	 *
	 * @var array
	 */
	public $param;
	/**
	 * Indique si la lecture des parametres a ete realisee au moins une fois
	 * Permet ainsi de declencher ou non la recherche
	 *
	 * @var int
	 */
	public $isSearch;
	/**
	 * Constructeur de la classe
	 * A rappeler systematiquement pour initialiser isSearch
	 */
	function __construct() {
		if (! is_array ( $this->param ))
			$this->param = array ();
		$this->isSearch = 0;
	}
	/**
	 * Stocke les parametres fournis
	 *
	 * @param array $data        	
	 */
	function setParam($data) {
		foreach ( $this->param as $key => $value ) {
			/*
			 * Recherche si une valeur de $data correspond a un parametre
			 */
			if (isset ( $data [$key] ))
				$this->param [$key] = $data [$key];
		}
		/*
		 * Gestion de l'indicateur de recherche
		 */
		if ($data ["isSearch"] == 1)
			$this->isSearch = 1;
	}
	/**
	 * Retourne les parametres existants
	 */
	function getParam() {
		return $this->param;
	}
	/**
	 * Indique si la recherche a ete deja lancee
	 *
	 * @return int
	 */
	function isSearch() {
		if ($this->isSearch == 1) {
			return 1;
		} else {
			return 0;
		}
	}
}
/**
 * Exemple d'instanciation
 *
 * @author Eric Quinton
 *        
 */
class SearchExample extends SearchParam {
	function __construct() {
		$this->param = array (
				"comment" => "",
				"dateExample" => date ( 'd/m/Y' ) 
		);
		parent::__construct ();
	}
}

/**
 * Classe de gestion des parametres de recherche de la table Perimetre
 *
 * @author Jeremy Damey
 *        
 */
class SearchPerimetre extends SearchParam {
	function __construct() {
		$this->param = array (
				"bien_support_niv2_id" => "",
				"objet_niv2_id" => "",
				"libelle" => "",
				"type_perimetre_id" => "",
				"echelle_id" => "",
				"recurrence_id" => "",
				"insee" => "" /*,
				"objet_niv1_id"=>"",
				"bien_support_niv1_id"=>""	*/			
		);
		parent::__construct ();
	}
}
/**
 * Classe de recherche des acteurs
 * @author quinton
 *
 */
class SearchActeur extends SearchParam {
	function __construct() {
		$this->param = array (
				"libelle" => "",
				"acteur_niv3_id" => "",
				"mandat_type_id" => "",
				"structure_type_id" => "" 
		);
		parent::__construct();
	}
}

class SearchIntervention extends SearchParam {
	function __construct() {
		$this->param = array (
				"usage_activite_niv2_id"=>"",
				"role_id"=>"",
				"position_usage_activite_id"=>"",
				"bien_support_niv2_id" => "",
				"objet_niv2_id" => ""
				);
		parent::__construct();
	}
}

class SearchExpert extends SearchParam {
	function __construct() {
		$this->param = array("libelle"=>"");
		parent::__construct();
	}
}

class SearchArticle extends SearchParam {
	function __construct() {
		$this->param = array("journal_id"=>"","libelle"=>"");
		parent::__construct();
	}
}

class SearchResolution extends SearchParam {
	function __construct() {
		$this->param = array(
				"resolution_echelle_id"=>"",
				"resolution_nature_id"=>"",
				"resolution_acteur_id"=>"",
				"resolution_mode_niv2_id"=>"",
				"libelle"=>"");
		parent::__construct();
	}
}

class SearchJuridique extends SearchParam {
	function __construct() {
		$this->param = array(
				"juridiction_id"=>"",
				"juridique_sous_domaine_id"=>"",
				"nature_requete_id"=>"",
				"nature_travaux_id"=>"",
				"libelle"=>"");
		parent::__construct();
	}
	
}
?>