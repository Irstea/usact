<?php

/**
 * Classe de base pour gerer des parametres de recherche
 * Classe non instanciable, a heriter
 * L'instance doit etre conservee en variable de session
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
 * Classe de gestion des parametres de recherche de la table conflits/conflitsExpr/ville/localisation
 *
 */
class Raccueil extends SearchParam {    
    function __construct() {
        $this->param = array ("zoneType"=>"","zoneBienS1"=>"","zoneBienS2"=>"","zoneObj1"=>"","zoneObj2"=>"");
        parent::__construct();
    }
}


/**
 * Classe de gestion des parametres de recherche de la table conflits
 *
 */
class Rconflits extends SearchParam {    
    function __construct() {
        $this->param = array ("zoneType"=>"","zoneBienS"=>"","zoneObj"=>"");
        parent::__construct();
    }
}
  

/**
 * Classe de gestion des parametres de recherche de la table conflitsexpr
 *
 */
class Rconflitsexpr extends SearchParam {    
    function __construct() {
        $this->param = array ("zoneDebut"=>"");
        parent::__construct();
    }
}


/**
 * Classe de gestion des parametres de recherche de la table ville
 *
 */
class Rville extends SearchParam {    
    function __construct() {
        $this->param = array ("zoneNomville"=>"");
        parent::__construct();
    }
}


/**
 * Classe de gestion des parametres de recherche de la table localisation
 *
 */
class Rlocalisation extends SearchParam {    
    function __construct() {
        $this->param = array ("zoneNomlocalis"=>"");
        parent::__construct();
    }
}


/**
 * Classe de gestion des parametres de recherche de la table acteurs
 *
 */
class Racteurs extends SearchParam {    
    function __construct() {
        $this->param = array ("zoneNom"=>"", "zoneVille"=>"");
        parent::__construct();
    }
}


/**
 * Classe de gestion des parametres de recherche de la table articles
 *
 */
class Rarticles extends SearchParam {    
    function __construct() {
        $this->param = array ("zoneTitre"=>"", "zoneAuteur"=>"", "zoneDateParutionJ"=>"","zoneDateParutionM"=>"", "zoneDateParutionA"=>"");
        parent::__construct();
    }
}


/**
 * Classe de gestion des parametres de recherche de la table interventions
 *
 */
class Rinterventions extends SearchParam {    
    function __construct() {
        $this->param = array ("zonePosusagact"=>"", "zoneUsagact"=>"");
        parent::__construct();
    }
}


/**
 * Classe de gestion des parametres de recherche de la table modes action
 *
 */
class Rmodesaction extends SearchParam {    
    function __construct() {
        $this->param = array ("zoneTypmodact"=>"", "zoneModact"=>"");
        parent::__construct();
    }
}

/**
 * Classe de gestion des parametres de recherche de la table revendications
 *
 */
class Rrevendications extends SearchParam {    
    function __construct() {
        $this->param = array ("zoneRevend"=>"", "zoneSuprevend"=>"", "zoneRegrevend"=>"");
        parent::__construct();
    }
}

/**
 * Classe de gestion des parametres de recherche de la table solutionsprop
 *
 */
class Rsolutions extends SearchParam {    
    function __construct() {
        $this->param = array ("zoneSolution"=>"");
        parent::__construct();
    }
}

/**
 * Classe de gestion des parametres de recherche de la table resolution
 *
 */
class Rresolution extends SearchParam {    
    function __construct() {
        $this->param = array ("zoneResolniv1"=>"", "zoneResolmode"=>"");
        parent::__construct();
    }
}

?>
