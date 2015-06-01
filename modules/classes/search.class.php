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
	 * @var array
	 */
	public $param;
	/**
	 * Indique si la lecture des parametres a ete realisee au moins une fois
	 * Permet ainsi de declencher ou non la recherche
	 * @var int
	 */
	public $isSearch;
	/**
	 * Constructeur de la classe
	 * A rappeler systematiquement pour initialiser isSearch
	 */
	function __construct() {
		if (!is_array ($this->param)) $this->param = array();
		$this->isSearch = 0;
	}
	/**
	 * Stocke les parametres fournis
	 * @param array $data
	 */
	function setParam ($data) {
		foreach ($this->param as $key => $value) {
			/*
			 * Recherche si une valeur de $data correspond a un parametre
			*/
			if (isset($data[$key]))
				$this->param[$key] = $data[$key];
		}
		/*
		 * Gestion de l'indicateur de recherche
		*/
		if ($data["isSearch"] == 1) $this->isSearch = 1;
	}
	/**
	 * Retourne les parametres existants
	 */
	function getParam() {
		return $this->param;
	}
	/**
	 * Indique si la recherche a ete deja lancee
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
 * @author Eric Quinton
 *
 */
class SearchExample extends SearchParam {
	function __construct() {
		$this->param = array ("comment" => "", "dateExample"=> date('d/m/Y'));
		parent::__construct();
	}
}

/**
 * Classe de gestion des parametres de recherche de la table Conflit
 * @author Jeremy Damey
 *
 */
class SearchConflit extends SearchParam {
	function __construct() {
		$this->param = array ("searchId" => "");
		parent::__construct();
	}
}

/**
 * Classe de gestion des parametres de recherche de la table Perimetre
 * @author Jeremy Damey
 *
 */
class SearchPerimetre extends SearchParam {
	function __construct() {
		$this->param = array ("searchId" => "");
		parent::__construct();
	}
}

/**
 * Classe de gestion des parametres de recherche de la table Echelle
 * @author Jeremy Damey
 *
 */
class SearchEchelle extends SearchParam {
	function __construct() {
		$this->param = array ("searchId" => "");
		parent::__construct();
	}
}

/**
 * Classe de gestion des parametres de recherche de la table Recurrence
 * @author Jeremy Damey
 *
 */
class SearchRecurrence extends SearchParam {
	function __construct() {
		$this->param = array ("searchId" => "");
		parent::__construct();
	}
}

/**
 * Classe de gestion des parametres de recherche de la table TypePerimetre
 * @author Jeremy Damey
 *
 */
class SearchTypePerimetre extends SearchParam {
	function __construct() {
		$this->param = array ("searchId" => "");
		parent::__construct();
	}
}

/**
 * Classe de gestion des parametres de recherche de la table ObjetNiv1
 * @author Jeremy Damey
 *
 */
class SearchObjetNiv1 extends SearchParam {
	function __construct() {
		$this->param = array ("searchId" => "");
		parent::__construct();
	}
}

/**
 * Classe de gestion des parametres de recherche de la table ObjetNiv2
 * @author Jeremy Damey
 *
 */
class SearchObjetNiv2 extends SearchParam {
	function __construct() {
		$this->param = array ("searchId" => "");
		parent::__construct();
	}
}

/**
 * Classe de gestion des parametres de recherche de la table BienSupportNiv1
 * @author Jeremy Damey
 *
 */
class SearchBienSupportNiv1 extends SearchParam {
	function __construct() {
		$this->param = array ("searchId" => "");
		parent::__construct();
	}
}

/**
 * Classe de gestion des parametres de recherche de la table BienSupportNiv2
 * @author Jeremy Damey
 *
 */
class SearchBienSupportNiv2 extends SearchParam {
	function __construct() {
		$this->param = array ("searchId" => "");
		parent::__construct();
	}
}
?>