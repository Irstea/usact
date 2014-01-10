<?php

/**
 * Création des classes et des requêtes de notre application
 */

/**
 * Classe permettant d'afficher les listes déroulantes (cf modalites)
 */
class Modalites extends ObjetBDD {
	/**
	 * Constructeur de la classe modalites
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->table="modalites";
		$this->cle="numeromodalite";
		$this->colonnes=array(
				"numeromodalite"=>array("type"=>1,"requis"=>1),
				"variable"=>array("type"=>0, "longueur"=>255, "requis"=>1),
				"modalite"=>array("type"=>0, "longueur"=>255, "requis"=>1),
				"sousmodalite"=>array("type"=>0, "longueur"=>255),
				"sousmodalite2"=>array("type"=>0, "longueur"=>255),
				"type"=>array("type"=>0, "longueur"=>255),
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
	
	/**
	 * Retourne les valeurs des listes déroulantes de typeconflit (table conflits)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	*/
	
	function getLconflitstypeconflit() {
		$sql="select variable, modalite
		from modalites
		where (modalites.variable like 'TypeConflit')
		order by modalite DESC";
	    return $this->getListeParam($sql);
	}
	
	
	/**
	 * Retourne les valeurs des listes déroulantes de biensupportniv1 (table conflits)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLconflitsbsniv1() {
		$sql="select variable, modalite
		from modalites
		where (modalites.variable like 'BienSupportNiv1')";
	    return $this->getListeParam($sql);
	}
	

	/**
	 * Recherche d'un bien support niveau 2 par rapport a bien support niveau 1 (table conflits) 
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLconflitsbsniv2($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select variable, modalite, sousmodalite
					from modalites 
					where (modalites.variable like 'BienSupportNiv2' and modalites.modalite like '%" . $nom . "%')
					order by sousmodalite";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["sousmodalite"] . '","value":"' . $value ["sousmodalite"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}
	

	/**
	 * Recherche d'un objet niveau 1 par rapport a typeconflit (table conflits) 
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLconflitsoniv1($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select variable, modalite, type
					from modalites 
					where (modalites.variable like 'ObjetNiv1' and modalites.type like '%" . $nom . "%')
					order by modalite";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["modalite"] . '","value":"' . $value ["modalite"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}
	
	
	/**
	 * Recherche d'un objet niveau 2 par rapport a objet 1  (table conflits)
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLconflitsoniv2($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select variable, modalite, sousmodalite
					from modalites 
					where (modalites.variable like 'ObjetNiv2' and modalites.modalite like '%" . $nom . "%')
					order by sousmodalite";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["sousmodalite"] . '","value":"' . $value ["sousmodalite"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}
	
	/**
	 * Retourne les valeurs des listes déroulantes de echelle (table conflits)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLconflitsechelle() {
		$sql="select distinct on (modalite) numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'Echelle')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs des listes déroulantes de recurrence (table conflits)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLconflitsrecurrence() {
		$sql="select distinct on (modalite) numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'Recurrence')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs de la liste type aborde (table aborde)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLarticlestypeaborde() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'TypeModeAction')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	

	/**
	 * Retourne les valeurs des listes déroulantes de statut (table acteurs)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLacteursstatut() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'Statut')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs des listes déroulantes de statutacteur (table acteurs)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLacteursstatutacteur() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'StatutActeur')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs des listes déroulantes de particulier (table acteurs)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLacteursparticulier() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'Particulier')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs des listes déroulantes de acteur niveau 1 (table acteurs)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLacteursniveau1() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'ActeurNiv1')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Recherche d'un acteur niveau 2 par rapport au niveau 1  (table acteurs)
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLacteursniveau2($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select variable, modalite, sousmodalite
					from modalites 
					where (modalites.variable like 'ActeurNiv2' and modalites.modalite like '%" . $nom . "%')
					order by sousmodalite";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["sousmodalite"] . '","value":"' . $value ["sousmodalite"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}
	
	/**
	 * Recherche d'un acteur niveau 3 par rapport au niveau 2  (table acteurs)
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLacteursniveau3($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select variable, modalite, sousmodalite, sousmodalite2
					from modalites 
					where (modalites.variable like 'ActeurNiv3' and modalites.sousmodalite like '%" . $nom . "%')
					order by sousmodalite";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["sousmodalite2"] . '","value":"' . $value ["sousmodalite2"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}
	
	/**
	 * Retourne les valeurs de la liste role (table interventions)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLinterventionsrole() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'Role')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs de la liste position usage activite (table interventions)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLinterventionsposusagact() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'PositionUsageActivite')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	

	/**
	 * Recherche d'un usage activite niv1 par rapport à position usage activité (table interventions)
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLinterventionsusagniv1($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select variable, modalite, type
					from modalites 
					where (modalites.variable like 'UsageActiviteNiv1' and modalites.type like '%" . $nom . "%')
					order by modalite";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["modalite"] . '","value":"' . $value ["modalite"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}
	
	/**
	 * Recherche d'un usage activité niv 2 par rapport usage activite niv 1(table interventions)
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLinterventionsusagniv2($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select variable, modalite, sousmodalite
					from modalites 
					where (modalites.variable like 'UsageActiviteNiv2' and modalites.modalite like '%" . $nom . "%')
					order by sousmodalite";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["sousmodalite"] . '","value":"' . $value ["sousmodalite"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}
	
	/**
	 * Retourne les valeurs de la liste revendication niv1 (table revendication)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLrevendicationsniv1() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'RevendicationNiv1')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Recherche d'une revendication niv1 par rapport revendication niv1(table revendication)
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLrevendicationsniv2($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select variable, modalite, sousmodalite
					from modalites 
					where (modalites.variable like 'RevendicationNiv2' and modalites.modalite like '%" . $nom . "%')
					order by sousmodalite";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["sousmodalite"] . '","value":"' . $value ["sousmodalite"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}
	
	/**
	 * Retourne les valeurs de la liste SupportRevendNiv1 (table revendication)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLrevendicationssupportniv1() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'SupportRevendNiv1')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Recherche d'un SupportRevendNiv2 par rapport SupportRevendNiv1 (table revendication)
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLrevendicationssupportniv2($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select variable, modalite, sousmodalite
					from modalites 
					where (modalites.variable like 'SupportRevendNiv2' and modalites.modalite like '%" . $nom . "%')
					order by sousmodalite";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["sousmodalite"] . '","value":"' . $value ["sousmodalite"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}
	
	/**
	 * Retourne les valeurs de la liste RegistreArgumNiv1 (table revendication)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLrevendicationsregistreniv1() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'RegistreArgumNiv1')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Recherche d'un RegistreArgumNiv2 par rapport RegistreArgumNiv1 (table revendication)
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLrevendicationsregistreniv2($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select variable, modalite, sousmodalite
					from modalites 
					where (modalites.variable like 'RegistreArgumNiv2' and modalites.modalite like '%" . $nom . "%')
					order by sousmodalite";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["sousmodalite"] . '","value":"' . $value ["sousmodalite"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}
	
	/**
	 * Retourne les valeurs de la liste TypeModeAction (table modesaction)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLmodesactiontypemodeact() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'TypeModeAction')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs de la liste ModeAction (table modesaction)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLmodesactionmodeact() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'ModeAction')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs de la liste EchelleAction (table modesaction)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLmodesactionechelleact() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'EchelleAction')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs de la liste Resolutionniv1 (table resolution)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLresolutionniv1() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'ResolutionNiv1')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs de la liste ResolutionNivSpat (table resolution)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLresolutionnivspat() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'ResolutionNivSpat')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs de la liste ResolutionNivActeur (table resolution)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLresolutionnivact() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'ResolutionNivActeur')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne les valeurs de la liste ModeResolutionNiv1 (table resolution)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLresolutionmodeniv1() {
		$sql="select numeromodalite, variable, modalite
		from modalites
		where (modalites.variable like 'ModeResolutionNiv1')
		order by modalite";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Recherche d'un ModeResolutionNiv2 par rapport ModeResolutionNiv1 (table resolution)
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLresolutionmodeniv2($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select variable, modalite, sousmodalite
					from modalites 
					where (modalites.variable like 'ModeResolutionNiv2' and modalites.modalite like '%" . $nom . "%')
					order by sousmodalite";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["sousmodalite"] . '","value":"' . $value ["sousmodalite"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}
}

/**
 * Classe permettant de manipuler la table conflits
 */

class Conflits extends ObjetBDD {
	/**
	 * Constructeur de la classe conflits
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param= $param;
		$this->table="conflits";
		$this->id_auto="1";
		$this->colonnes=array(
				"numconflit"=>array("type"=>1,"key"=>1, "requis"=>1, "defaultValue"=>0),
				"typeconflit"=>array("type"=>0, "requis"=>1),
				"biensupportniv1"=>array("type"=>0, "longueur"=>255),
				"biensupportniv2"=>array("type"=>0, "longueur"=>255),
				"objetniv1"=>array("type"=>0, "longueur"=>255),
				"objetniv2"=>array("type"=>0, "longueur"=>255),
				"echelle"=>array("type"=>0, "longueur"=>255),
				"recurrence"=>array("type"=>0, "longueur"=>255),
				"detailsconflits"=>array("type"=>0, "longueur"=>255),
				"perssaisieconf"=>array("type"=>0, "longueur"=>255, "requis"=>1),
				"datesaisieconf"=>array("type"=>2,"requis"=>1,"defaultValue"=>"getDateJour")
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
	
	/**
	 * Retourne la table conflits/conflitsExpr/ville/localisation (liste accueil)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRaccueil($param) {
		$sql='select conflits.numconflit,conflits.typeconflit,conflits.biensupportniv1,conflits.biensupportniv2,conflits.objetniv1,conflits.objetniv2, conflitsexpr.numconflitexpr, ville.numeroinsee, localisation.numerolocalisation, conflitsexpr.datedebut, conflitsexpr.datefin, ville.nomville, localisation.nomlocalisation
			  from conflits inner join conflitsexpr on conflits.numconflit=conflitsexpr.numconflit
				left outer join estsitue on conflits.numconflit=estsitue.numconflit
				full outer join ville on estsitue.numeroinsee=ville.numeroinsee
				left outer join estlocalise on conflits.numconflit=estlocalise.numconflit
				full outer join localisation on estlocalise.numerolocalisation=localisation.numerolocalisation';
		$where = '';
		/**
		 * Recherche de la chaine de caracteres typeconflit
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 */
		
		if (strlen($where)==0) {
				$param["zoneType"]=pg_escape_string($param["zoneType"]);			
				$where = ' where (conflits.typeconflit = \''.$param["zoneType"].'\')';
		} else {	
				if (strlen($param["zoneType"])>0) {
				$param["zoneType"]=pg_escape_string($param["zoneType"]);
				$where = ' and (conflits.typeconflit = \''.$param["zoneType"].'\')';
				}
		}
				
		/**
		 * Recherche de la chaine de caracteres BienSupportNiv1
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($where)==0) {
			$param["zoneBienS1"]=pg_escape_string($param["zoneBienS1"]);
			$where .= ' where (conflits.biensupportniv1 = \''.$param["zoneBienS1"].'\')';				
		} else {
			if (strlen($param["zoneBienS1"])>0) {
			$param["zoneBienS1"]=pg_escape_string($param["zoneBienS1"]);
			$where .= ' and (conflits.biensupportniv1 = \''.$param["zoneBienS1"].'\')';
			}
		}
		
		
		/**
		 * Recherche de la chaine de caracteres BienSupportNiv2
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($where)==0) {
			$param["zoneBienS2"]=pg_escape_string($param["zoneBienS2"]);
			$where .= ' where (conflits.biensupportniv2 = \''.$param["zoneBienS2"].'\')';				
		} else {
			if (strlen($param["zoneBienS2"])>0) {
			$param["zoneBienS2"]=pg_escape_string($param["zoneBienS2"]);	
			$where .= ' and (conflits.biensupportniv2 = \''.$param["zoneBienS2"].'\')';
			}
		}
		
		/**
		 * Recherche de la chaine de caracteres ObjetNiv1
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($where)==0) {
			$param["zoneObj1"]=pg_escape_string($param["zoneObj1"]);
			$where .= ' where (conflits.objetniv1 = \''.$param["zoneObj1"].'\')';
		} else {
			if (strlen($param["zoneObj1"])>0) {
			$param["zoneObj1"]=pg_escape_string($param["zoneObj1"]);
			$where .= ' and (conflits.objetniv1 = \''.$param["zoneObj1"].'\')';
			}
		}
		

		/**
		 * Recherche de la chaine de caracteres ObjetNiv2
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($where)==0) {
			$param["zoneObj2"]=pg_escape_string($param["zoneObj2"]);
			$where .= ' where (conflits.objetniv2 = \''.$param["zoneObj2"].'\')';
		} else {
			if (strlen($param["zoneObj2"])>0) {
			$param["zoneObj2"]=pg_escape_string($param["zoneObj2"]);
			$where .= ' and (conflits.objetniv2 = \''.$param["zoneObj2"].'\')';
			}
		}
	
		return parent::getListeParam($sql.$where);
	}
	
	
	/**
	 * Retourne la table Conflits
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRconflits($param) {
		$sql='select conflits.numconflit, conflits.typeconflit, conflits.biensupportniv1, conflits.biensupportniv2, conflits.objetniv1,
		conflits.objetniv2, ville.numeroinsee, ville.nomville		
		from conflits left outer join estsitue on conflits.numconflit=estsitue.numconflit
				full outer join ville on estsitue.numeroinsee=ville.numeroinsee';
		$where = '';
		/**
		 * Recherche de la chaine de caracteres typeconflit
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 */
		if (strlen($where)==0) {
			$where = ' where (conflits.typeconflit ilike \'%'.$param["zoneType"].'%\')';
		} else {	
			if (strlen($param["zoneType"])>0) {
			$where = ' where (conflits.typeconflit ilike \'%'.$param["zoneType"].'%\')';
		}
		}
		/**
		 * Recherche de la chaine de caracteres BienSupportNiv
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($where)==0) {
			$param["zoneBienS"]=pg_escape_string($param["zoneBienS"]);
			$where .= ' where (conflits.biensupportniv1 ilike \'%'.$param["zoneBienS"].'%\' 
						or conflits.biensupportniv2 ilike \'%'.$param["zoneBienS"].'%\')';
		} else {
			if (strlen($param["zoneBienS"])>0) {
			$param["zoneBienS"]=pg_escape_string($param["zoneBienS"]);	
			$where .= ' and (conflits.biensupportniv1 ilike \'%'.$param["zoneBienS"].'%\'
						or conflits.biensupportniv2 ilike \'%'.$param["zoneBienS"].'%\')';
			}
		}

		/**
		 * Recherche de la chaine de caracteres ObjetNiv
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		if (strlen($where)==0) {
			$param["zoneObj"]=pg_escape_string($param["zoneObj"]);
			$where .= ' where (conflits.objetniv1 ilike \'%'.$param["zoneObj"].'%\'
						or conflits.objetniv2 ilike \'%'.$param["zoneObj"].'%\')';
		} else {
			if (strlen($param["zoneObj"])>0) {
			$param["zoneObj"]=pg_escape_string($param["zoneObj"]);
			$where .= ' and (conflits.objetniv1 ilike \'%'.$param["zoneObj"].'%\'
						or conflits.objetniv2 ilike \'%'.$param["zoneObj"].'%\')';
			}
		}
	
		return parent::getListeParam($sql.$where);
	}
}


/**
 * Classe permettant de manipuler la table conflitsExpr
 */

class Conflitsexpr extends ObjetBDD {
	/**
	 * Constructeur de la classe conflitsExpr
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="conflitsexpr";
		$this->id_auto="1";
		$this->colonnes=array(
				"numconflitexpr"=>array("type"=>1,"key"=>1,"requis"=>1,"defaultValue"=>0),
				"numconflit"=>array("type"=>1,"requis"=>1, "parentAttrib"=>1),
				"datedebut"=>array("type"=>0, "requis"=>1),
				"datefin"=>array("type"=>0),
				"detailexpr"=>array("type"=>0, "longueur"=>255),
				"perssaisconfexp"=>array("type"=>0, "longueur"=>255, "requis"=>1),
				"datesaisconfexp"=>array("type"=>2,"requis"=>1,"defaultValue"=>"getDateJour")
				
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}

	/**
	 * Retourne la table ConflitsExpr 
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRconflitsexpr($param1,$param2) {
		$sql='select numconflitexpr, numconflit, datedebut, datefin, detailexpr
		from conflitsexpr
		where conflitsexpr.numconflit=' . $param1 . '';
		$and = '';
		
		/**
		 * Recherche de la chaine de caracteres zoneDebut
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		if (strlen($param2["zoneDebut"])>0) {
			$param2["zoneDebut"]=pg_escape_string($param2["zoneDebut"]);	
			$and .= ' and (conflitsexpr.datedebut ilike \'%'.$param2["zoneDebut"].'%\')';
		}
				
		return parent::getListeParam($sql.$and);
	}
}

/**
 * Classe permettant de manipuler la table ville
 */
class Ville extends ObjetBDD {
	/**
	 * Constructeur de la classe ville
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="ville";
		$this->colonnes=array(
				"numeroinsee"=>array("type"=>1,"key"=>1,"requis"=>1),
				"nomville"=>array("type"=>0, "requis"=>1),
				"departement"=>array("type"=>0, "requis"=>1)				
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
	
	/**
	 * Retourne la table Ville
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRville($param1, $param2) {
		$sql='select ville.numeroinsee, ville.nomville, ville.departement, localisation.numerolocalisation, localisation.nomlocalisation
				from conflits full outer join estsitue on conflits.numconflit=estsitue.numconflit full outer join ville on estsitue.numeroinsee=ville.numeroinsee 
	     		 full outer join estlocalise on conflits.numconflit=estlocalise.numconflit full outer join localisation on estlocalise.numerolocalisation=localisation.numerolocalisation
			  where conflits.numconflit=' . $param1 . '';
		$and = '';

		/**
		 * Recherche de la chaine de caracteres zoneNomville
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($and)==0) {
			$param2["zoneNomville"]=pg_escape_string($param2["zoneNomville"]);	
			$and .= ' and (ville.nomville ilike \'%'.$param2["zoneNomville"].'%\')';
		}
		
		return parent::getListeParam($sql.$and);
	}
	
	/**
	 * Retourne la liste déroulante des noms des villes
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLvillenomville() {
		$sql="select nomville
		from ville
		order by nomville";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Retourne la liste déroulante des departements
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLvilledepartement() {
		$sql="select distinct on (departement) departement
		from ville
		order by departement";
	    return $this->getListeParam($sql);
	}
	
	/**
	 * Recherche d'un numeroinsee et departement par rapport à la ville selectionnée (table ville)
	 * Retourne le resultat au format JSON, pour utilisation en ajax
	 * @param string $nom        	
	 */
	
	function getLvilleinsee($nom) {
		if (strlen ( $nom ) > 2) {
			$sql = "select numeroinsee, nomville, departement
					from ville
					where (ville.nomville ilike '%" . $nom . "%')";
			$data = $this->getListeParam ( $sql );
			$retour = '{"Liste":[';
			$flag = 0;
			foreach ( $data as $key => $value ) {
				if ($flag == 0)
					$flag = 1;
				else
					$retour .= ",";
				$retour .= '{"id":"' . $value ["numeroinsee"] . '","value":"' . $value ["numeroinsee"] . '"}';
			}
			$retour .= ']}';
			print ($retour) ;
		}
	}	
}


/**
 * Classe permettant de manipuler la table estsitue
 */
class Estsitue extends ObjetBDD {
	/**
	 * Constructeur de la classe estsitue
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="estsitue";
		$this->colonnes=array(
				"numconflit"=>array("type"=>1, "key"=>1,"requis"=>1,"parentAttrib"=>1),
				"numeroinsee"=>array("type"=>1, "key"=>1, "requis"=>1,"parentAttrib"=>1)						
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
}



/**
 * Classe permettant de manipuler la table Localisation
 */
class Localisation extends ObjetBDD {
	/**
	 * Constructeur de la classe localisation
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="localisation";
		$this->colonnes=array(
				"numerolocalisation"=>array("type"=>1,"key"=>1,"requis"=>1),
				"nomlocalisation"=>array("type"=>0, "requis"=>1),
				"numeroinsee"=>array("type"=>0, "requis"=>1,"parentAttrib"=>1)				
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
	
	/**
	 * Retourne la table Localisation
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRlocalisation($param1, $param2, $param3) {
		$sql='select localisation.numerolocalisation, localisation.nomlocalisation, localisation.numeroinsee
		from localisation, estlocalise
		where estlocalise.numconflit=' . $param1 . ' and estlocalise.numconflitexpr=' . $param2 . ' and estlocalise.numerolocalisation=localisation.numerolocalisation';
		$and = '';

		/**
		 * Recherche de la chaine de caracteres zoneNomlocalis
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($and)==0) {
			$param3["zoneNomlocalis"]=pg_escape_string($param3["zoneNomlocalis"]);	
			$and .= ' and (localisation.nomlocalisation ilike \'%'.$param3["zoneNomlocalis"].'%\')';
		}
		
		return parent::getListeParam($sql.$and);
	}
	
	/**
	 * Retourne la liste déroulante des noms des localisations
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getLlocalisationnomlocalisation() {
		$sql="select nomlocalisation
		from localisation
		order by nomlocalisation";
	    return $this->getListeParam($sql);
	}
	
}


/**
 * Classe permettant de manipuler la table estlocalise
 */
class Estlocalise extends ObjetBDD {
	/**
	 * Constructeur de la classe estlocalise
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="estlocalise";
		$this->colonnes=array(
				"numconflit"=>array("type"=>1, "key"=>1,"requis"=>1,"parentAttrib"=>1),
				"numerolocalisation"=>array("type"=>1, "key"=>1, "requis"=>1,"parentAttrib"=>1)	
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
}



/**
 * Classe permettant de manipuler la table acteurs
 */
class Acteurs extends ObjetBDD {
	/**
	 * Constructeur de la classe acteurs
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="acteurs";
		$this->id_auto="1";
		$this->colonnes=array(
			"numacteur"=>array("type"=>1,"key"=>1,"requis"=>1,"defaultValue"=>0),
		    "nomacteurmoral"=>array("type"=>0, "longueur"=>255),
		    "codepostalmoral"=>array("type"=>0, "longueur"=>255),
			"villemoral"=>array("type"=>0, "longueur"=>255),
			"acteurniv1"=>array("type"=>0, "longueur"=>255),
			"acteurniv2"=>array("type"=>0, "longueur"=>255),
			"acteurniv3"=>array("type"=>0, "longueur"=>255),		
			"nomacteurphysique"=>array("type"=>0, "longueur"=>255),			
			"codepostalphysique"=>array("type"=>0, "longueur"=>255),
			"villephysique"=>array("type"=>0, "longueur"=>255),	
			"statutacteur"=>array("type"=>0, "longueur"=>255),
			"detailstatutacteur"=>array("type"=>0, "longueur"=>255),
			"orgproduct"=>array("type"=>0, "longueur"=>255),
			"statutorgprod"=>array("type"=>0, "longueur"=>255),
			"detailorgprod"=>array("type"=>0, "longueur"=>255),
			"partipolitique"=>array("type"=>0, "longueur"=>255),		
			"statutpartipolitique"=>array("type"=>0, "longueur"=>255),
			"detailpartipolitique"=>array("type"=>0, "longueur"=>255),
			"syndicat"=>array("type"=>0, "longueur"=>255),
			"statutsyndicat"=>array("type"=>0, "longueur"=>255),
			"detailsyndicat"=>array("type"=>0, "longueur"=>255),
			"comitequartier"=>array("type"=>0, "longueur"=>255),
			"statutquartier"=>array("type"=>0, "longueur"=>255),
			"detailquartier"=>array("type"=>0, "longueur"=>255),
			"syndiccopropriete"=>array("type"=>0, "longueur"=>255),	
			"statutcopropriete"=>array("type"=>0, "longueur"=>255),
			"detailcopropriete"=>array("type"=>0, "longueur"=>255),
			"assopatricult"=>array("type"=>0, "longueur"=>255),
			"statutassopatricult"=>array("type"=>0, "longueur"=>255),
			"detailassopatricult"=>array("type"=>0, "longueur"=>255),
			"assoenvgeneraliste"=>array("type"=>0, "longueur"=>255),
			"statutassoenvgeneraliste"=>array("type"=>0, "longueur"=>255),
			"detailassoenvgeneraliste"=>array("type"=>0, "longueur"=>255),
			"assoenvlocalisee"=>array("type"=>0, "longueur"=>255),
			"statutassoenvlocalisee"=>array("type"=>0, "longueur"=>255),
			"detailassoenvlocalisee"=>array("type"=>0, "longueur"=>255),
			"assosportsnautiques"=>array("type"=>0, "longueur"=>255),
			"statutassosportsnautiques"=>array("type"=>0, "longueur"=>255),
			"detailassosportsnautiques"=>array("type"=>0, "longueur"=>255),
			"assosportspleinair"=>array("type"=>0, "longueur"=>255),
			"statutassosportspleinair"=>array("type"=>0, "longueur"=>255),
			"detailassosportspleinair"=>array("type"=>0, "longueur"=>255),
			"assochassepeche"=>array("type"=>0, "longueur"=>255),
			"statutassochassepeche"=>array("type"=>0, "longueur"=>255),
			"detailassochassepeche"=>array("type"=>0, "longueur"=>255),
			"autreassosportive"=>array("type"=>0, "longueur"=>255),
			"statutautreassosport"=>array("type"=>0, "longueur"=>255),
			"detailautreassosport"=>array("type"=>0, "longueur"=>255),
			"maire"=>array("type"=>0, "longueur"=>255),
			"conseillermunicipal"=>array("type"=>0, "longueur"=>255),
			"depute"=>array("type"=>0, "longueur"=>255),
			"deputeeuropeen"=>array("type"=>0, "longueur"=>255),		
			"senateur"=>array("type"=>0, "longueur"=>255),
			"presidentconseilregional"=>array("type"=>0, "longueur"=>255),
			"conseillerregional"=>array("type"=>0, "longueur"=>255),
			"presidentconseilgeneral"=>array("type"=>0, "longueur"=>255),
			"conseillergeneral"=>array("type"=>0, "longueur"=>255),
			"presidentepci"=>array("type"=>0, "longueur"=>255),		
			"membreepci"=>array("type"=>0, "longueur"=>255),
			"eluchambreconsulaire"=>array("type"=>0, "longueur"=>255),
			"candidatlisteelect"=>array("type"=>0, "longueur"=>255),
		    "autre"=>array("type"=>0, "longueur"=>255),
			"detailautre"=>array("type"=>0, "longueur"=>255),
			"particulier"=>array("type"=>0, "longueur"=>255),
			"perssaisieacteur"=>array("type"=>0, "longueur"=>255,"requis"=>1),
			"datesaisieacteur"=>array("type"=>2, "defaultValue"=>"getDateJour")				
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
	
	/**
	 * Retourne la table Acteurs
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRacteurs($param) {
		$sql='select numacteur, nomacteurmoral, villemoral, nomacteurphysique, villephysique, statutacteur
		from acteurs';
		$where = '';
		
		/**
		 * Recherche de la chaine de caracteres zoneNom
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($where)==0) {
			$param["zoneNom"]=pg_escape_string($param["zoneNom"]);	
			$where .= ' where (acteurs.nomacteurmoral ilike \'%'.$param["zoneNom"].'%\'
						or acteurs.nomacteurphysique ilike \'%'.$param["zoneNom"].'%\')';
		}
			
		/**
		 * Recherche de la chaine de caracteres zoneVille
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		if (strlen($where)==0) {
			$param["zoneVille"]=pg_escape_string($param["zoneVille"]);
			$where .= ' where (acteurs.villemoral ilike \'%'.$param["zoneVille"].'%\'
						or acteurs.villephysique ilike \'%'.$param["zoneVille"].'%\')';
		} else {
			if (strlen($param["zoneVille"])>0) {
			$param["zoneVille"]=pg_escape_string($param["zoneVille"]);
			$where .= ' and (acteurs.villemoral ilike \'%'.$param["zoneVille"].'%\'
						or acteurs.villephysique ilike \'%'.$param["zoneVille"].'%\')';
			}
		}

		return parent::getListeParam($sql.$where);
	}	
}


/**
 * Classe permettant de manipuler la table aborde
 */
class Aborde extends ObjetBDD {
	/**
	 * Constructeur de la classe aborde
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="aborde";
		$this->colonnes=array(
				"numconflitexpr"=>array("type"=>1, "key"=>1,"requis"=>1),
				"numarticle"=>array("type"=>1, "key"=>1, "requis"=>1),
				"typecontenu"=>array("type"=>0, "longueur"=>255)						
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
}


/**
 * Classe permettant de manipuler la table articles
 */
class Articles extends ObjetBDD {
	/**
	 * Constructeur de la classe articles
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="articles";
		$this->id_auto="1";
		$this->colonnes=array(
				"numarticle"=>array("type"=>1,"key"=>1,"requis"=>1,"defaultValue"=>0),
				"titrearticle"=>array("type"=>0, "longueur"=>255, "requis"=>1),
				"auteurarticle"=>array("type"=>0, "longueur"=>255, "requis"=>1),
				"dateparution"=>array("type"=>2, "requis"=>1),
				"nomjournal"=>array("type"=>0, "longueur"=>255, "requis"=>1),
				"edition"=>array("type"=>0, "longueur"=>255),
				"rubrique"=>array("type"=>0, "longueur"=>255),
				"page"=>array("type"=>1, "longueur"=>255),
				"entete"=>array("type"=>0, "longueur"=>255),
				"piecejointeart"=>array("type"=>0, "longueur"=>255,"defaultValue"=>NULL),
				"perssaisiearticle"=>array("type"=>0, "longueur"=>255, "requis"=>1),
				"datesaisiearticle"=>array("type"=>2,"requis"=>1,"defaultValue"=>"getDateJour")					
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}

	/**
	 * Retourne la table Article + Aborde
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */

	function getRarticles($param1,$param2) {
		$sql='select articles.numarticle, articles.titrearticle, articles.auteurarticle, articles.dateparution, articles.nomjournal, aborde.typecontenu
		from articles, aborde
		where articles.numarticle=aborde.numarticle and aborde.numconflitexpr=' . $param1 . ' ';
		$and = '';
		/**
		 * Recherche de la chaine de caracteres zoneTitre
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($and)==0) {
			$param2["zoneTitre"]=pg_escape_string($param2["zoneTitre"]);	
			$and .= ' and (articles.titrearticle ilike \'%'.$param2["zoneTitre"].'%\')';
		}		
	
		/**
		 * Recherche de la chaine de caracteres zoneAuteur
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		if (strlen($and)==0) {
			$param2["zoneAuteur"]=pg_escape_string($param2["zoneAuteur"]);
			$and .= ' and (articles.auteurarticle ilike \'%'.$param2["zoneAuteur"].'%\')';

		} else {
			if (strlen($param2["zoneAuteur"])>0) {
			$param2["zoneAuteur"]=pg_escape_string($param2["zoneAuteur"]);
			$and .= ' and (articles.auteurarticle ilike \'%'.$param2["zoneAuteur"].'%\')';
			}
		}

		/*
		* Recherche de la date Jour de DateParution
		* strlen : nb caracteres
	 	* ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		* .= coller à la suite
		*/
		
		if (strlen($param2["zoneDateParutionJ"])>0) {
			$and .= ' and (EXTRACT(DAY FROM articles.dateparution) =' .$param2["zoneDateParutionJ"]. ')';			
		}
		
		/*
		* Recherche de la date Mois de DateParution
		* strlen : nb caracteres
	 	* ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		* .= coller à la suite
		*/
		if (strlen($param2["zoneDateParutionM"])>0) {
			$and .= ' and (EXTRACT(MONTH FROM articles.dateparution) =' .$param2["zoneDateParutionM"]. ')';
		}
		
		/*
		* Recherche de la date Année de DateParution
		* strlen : nb caracteres
	 	* ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		* .= coller à la suite
		*/
		if (strlen($param2["zoneDateParutionA"])>0) {
			$and .= ' and (EXTRACT(YEAR FROM articles.dateparution) =' .$param2["zoneDateParutionA"]. ')';
		}
		

		return parent::getListeParam($sql.$and);
	}	
	
	/**
	 * Retourne la table Article
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */

	function getRarticles2($param1) {
		$sql='select articles.numarticle, articles.titrearticle, articles.auteurarticle, articles.dateparution, articles.nomjournal
		from articles';
		$where = '';
		/**
		 * Recherche de la chaine de caracteres zoneTitre
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($where)==0) {
			$param1["zoneTitre"]=pg_escape_string($param1["zoneTitre"]);	
			$where .= ' where (articles.titrearticle ilike \'%'.$param1["zoneTitre"].'%\')';
		}		
	
		/**
		 * Recherche de la chaine de caracteres zoneAuteur
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		if (strlen($where)==0) {
			$param1["zoneAuteur"]=pg_escape_string($param1["zoneAuteur"]);
			$where .= ' where (articles.auteurarticle ilike \'%'.$param1["zoneAuteur"].'%\')';

		} else {
			if (strlen($param1["zoneAuteur"])>0) {
			$param1["zoneAuteur"]=pg_escape_string($param1["zoneAuteur"]);
			$where .= ' and (articles.auteurarticle ilike \'%'.$param1["zoneAuteur"].'%\')';
			}
		}

		/*
		* Recherche de la date Jour de DateParution
		* strlen : nb caracteres
	 	* ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		* .= coller à la suite
		*/
		if (strlen($where)==0) {
			$where .= ' where (EXTRACT(DAY FROM articles.dateparution) =' .$param1["zoneDateParutionJ"]. ')';
		} else {
			if (strlen($param1["zoneDateParutionJ"])>0) {
			$where .= ' and (EXTRACT(DAY FROM articles.dateparution) =' .$param1["zoneDateParutionJ"]. ')';	
			}		
		}
		
		/*
		* Recherche de la date Mois de DateParution
		* strlen : nb caracteres
	 	* ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		* .= coller à la suite
		*/
		if (strlen($where)==0) {
			$where .= ' where (EXTRACT(MONTH FROM articles.dateparution) =' .$param1["zoneDateParutionM"]. ')';
		} else {
			if (strlen($param1["zoneDateParutionM"])>0) {
			$where .= ' and (EXTRACT(MONTH FROM articles.dateparution) =' .$param1["zoneDateParutionM"]. ')';
			}
		}
		/*
		* Recherche de la date Année de DateParution
		* strlen : nb caracteres
	 	* ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		* .= coller à la suite
		*/
		if (strlen($where)==0) {
			$where .= ' where (EXTRACT(YEAR FROM articles.dateparution) =' .$param1["zoneDateParutionA"]. ')';
		} else {
			if (strlen($param1["zoneDateParutionA"])>0) {
			$where .= ' and (EXTRACT(YEAR FROM articles.dateparution) =' .$param1["zoneDateParutionA"]. ')';
			}
		}
		

		return parent::getListeParam($sql.$where);
	}	

}


/**
 * Classe permettant de manipuler la table interventions
 */
class Interventions extends ObjetBDD {
	/**
	 * Constructeur de la classe interventions
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="interventions";
		$this->id_auto="1";
		$this->colonnes=array(
				"numinterv"=>array("type"=>1,"key"=>1,"requis"=>1,"defaultValue"=>0),
				"numacteur"=>array("type"=>1,"requis"=>1, "parentAttrib"=>1),
				"numconflitexpr"=>array("type"=>1,"requis"=>1, "parentAttrib"=>1),
				"dateentree"=>array("type"=>0, "requis"=>1),
				"datesortie"=>array("type"=>0),
				"role"=>array("type"=>0, "longueur"=>255),
				"positionusageactivite"=>array("type"=>0, "longueur"=>255, "requis"=>1),
				"usageactiviteniv1"=>array("type"=>0, "longueur"=>255),
				"usageactiviteniv2"=>array("type"=>0, "longueur"=>255),
				"detailsusage"=>array("type"=>0, "longueur"=>255),
				"perssaisieinterv"=>array("type"=>0, "longueur"=>255, "requis"=>1),
				"datesaisieinterv"=>array("type"=>2, "defaultValue"=>"getDateJour")
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
	
	/**
	 * Retourne la table Interventions (interventions + aborde + articles + cite)
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRinterventions($param1, $param2, $param3, $param4) {
		$sql='select interventions.numinterv, interventions.numacteur, interventions.numconflitexpr, interventions.dateentree, interventions.datesortie, interventions.role, interventions.positionusageactivite, interventions.usageactiviteniv1, interventions.usageactiviteniv2
		from interventions, aborde, articles, cite
		where aborde.numarticle=articles.numarticle and cite.numarticle=articles.numarticle and cite.numinterv=interventions.numinterv and interventions.numacteur=' . $param1 . ' and interventions.numconflitexpr=' . $param2 .' and aborde.numconflitexpr=' . $param2 .' and aborde.numarticle=' . $param3 .'';
		$and = '';
		/**
		 * Recherche de la chaine de caracteres zonePosusagact
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($and)==0) {
			$param4["zonePosusagact"]=pg_escape_string($param4["zonePosusagact"]);	
			$and .= ' and (interventions.positionusageactivite ilike \'%'.$param4["zonePosusagact"].'%\')';
					
		}
		
	
		/**
		 * Recherche de la chaine de caracteres UsagAct
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		if (strlen($and)==0) {
			$param4["zoneUsagact"]=pg_escape_string($param4["zoneUsagact"]);
			$and .= ' and (interventions.usageactiviteniv1 ilike \'%'.$param4["zoneUsagact"].'%\'
						or interventions.usageactiviteniv2 ilike \'%'.$param4["zoneUsagact"].'%\')';
		} else {
			if (strlen($param4["zoneUsagact"])>0) {
			$param4["zoneUsagact"]=pg_escape_string($param4["zoneUsagact"]);
			$and .= ' and (interventions.usageactiviteniv1 ilike \'%'.$param4["zoneUsagact"].'%\'
						or interventions.usageactiviteniv2 ilike \'%'.$param4["zoneUsagact"].'%\')';
			}
		}

		return parent::getListeParam($sql.$and);
	}	
	
	/**
	 * Retourne la table Interventions
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRinterventions2($param1, $param2, $param3) {
		$sql='select interventions.numinterv, interventions.numacteur, interventions.numconflitexpr, interventions.dateentree, interventions.datesortie, interventions.role, interventions.positionusageactivite, interventions.usageactiviteniv1, interventions.usageactiviteniv2
		from interventions
		where interventions.numacteur=' . $param1 . ' and interventions.numconflitexpr=' . $param2 .'';
		$and = '';
		/**
		 * Recherche de la chaine de caracteres zonePosusagact
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($and)==0) {
			$param3["zonePosusagact"]=pg_escape_string($param3["zonePosusagact"]);	
			$and .= ' and (interventions.positionusageactivite ilike \'%'.$param3["zonePosusagact"].'%\')';
					
		}
		
	
		/**
		 * Recherche de la chaine de caracteres UsagAct
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		if (strlen($and)==0) {
			$param3["zoneUsagact"]=pg_escape_string($param3["zoneUsagact"]);
			$and .= ' and (interventions.usageactiviteniv1 ilike \'%'.$param3["zoneUsagact"].'%\'
						or interventions.usageactiviteniv2 ilike \'%'.$param3["zoneUsagact"].'%\')';
		} else {
			if (strlen($param3["zoneUsagact"])>0) {
			$param3["zoneUsagact"]=pg_escape_string($param3["zoneUsagact"]);
			$and .= ' and (interventions.usageactiviteniv1 ilike \'%'.$param3["zoneUsagact"].'%\'
						or interventions.usageactiviteniv2 ilike \'%'.$param3["zoneUsagact"].'%\')';
			}
		}

		return parent::getListeParam($sql.$and);
	}	
}


/**
 * Classe permettant de manipuler la table cite
 */
class Cite extends ObjetBDD {
	/**
	 * Constructeur de la classe cite
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="cite";
		$this->colonnes=array(
				"numarticle"=>array("type"=>1, "key"=>1,"requis"=>1,"parentAttrib"=>1),
				"numinterv"=>array("type"=>1, "key"=>1, "requis"=>1,"parentAttrib"=>1)										
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
}


/**
 * Classe permettant de manipuler la table modesaction
 */
class Modesaction extends ObjetBDD {
	/**
	 * Constructeur de la classe modesaction
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="modesaction";
		$this->id_auto="1";
		$this->colonnes=array(
				"numaction"=>array("type"=>1,"key"=>1,"requis"=>1,"defaultValue"=>0),
				"numinterv"=>array("type"=>1,"requis"=>1, "parentAttrib"=>1),
				"typemodeaction"=>array("type"=>0, "longueur"=>255),
				"modeaction"=>array("type"=>0, "longueur"=>255),
				"echelleaction"=>array("type"=>0, "longueur"=>255),
				"dateaction"=>array("type"=>0, "longueur"=>255),
				"detailsactions"=>array("type"=>0, "longueur"=>255)						
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
	
	/**
	 * Retourne la table Modesaction
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRmodesaction($param1) {
		$sql='select numaction, numinterv, typemodeaction, modeaction, echelleaction, dateaction, detailsactions
		from modesaction
		where modesaction.numinterv=' . $param1 . '';
		
		return parent::getListeParam($sql.$and);
	}
	
}



/**
 * Classe permettant de manipuler la table revendications
 */
class Revendications extends ObjetBDD {
	/**
	 * Constructeur de la classe revendications
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="revendications";
		$this->id_auto="1";
		$this->colonnes=array(
				"numrevend"=>array("type"=>1,"key"=>1,"requis"=>1,"defaultValue"=>0),
				"numinterv"=>array("type"=>1,"requis"=>1, "parentAttrib"=>1),
				"revendicationniv1"=>array("type"=>0, "longueur"=>255),
				"revendicationniv2"=>array("type"=>0, "longueur"=>255),
				"detailsrevend"=>array("type"=>0, "longueur"=>255),
				"supportrevendniv1"=>array("type"=>0, "longueur"=>255),
				"supportrevendniv2"=>array("type"=>0, "longueur"=>255),
				"registreargumniv1"=>array("type"=>0, "longueur"=>255),
				"registreargumniv2"=>array("type"=>0, "longueur"=>255),
				"detailsargum"=>array("type"=>0, "longueur"=>255)								
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
	
	/**
	 * Retourne la table revendications
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRrevendications($param1) {
		$sql='select numrevend, numinterv, revendicationniv1, revendicationniv2, detailsrevend, supportrevendniv1, supportrevendniv2, registreargumniv1, registreargumniv2, detailsargum
		from revendications
		where revendications.numinterv=' . $param1 . '';
		
		return parent::getListeParam($sql.$and);
	}
}

/**
 * Classe permettant de manipuler la table solutionsprop
 */
class Solutions extends ObjetBDD {
	/**
	 * Constructeur de la classe solutions
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="solutionsprop";
		$this->id_auto="1";
		$this->colonnes=array(
				"numsolution"=>array("type"=>1,"key"=>1,"requis"=>1,"defaultValue"=>0),
				"numinterv"=>array("type"=>1,"requis"=>1, "parentAttrib"=>1),
				"solutionprop"=>array("type"=>0, "longueur"=>255)											
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
	
	
	/**
	 * Retourne la table solutions
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRsolutions($param1) {
		$sql='select numsolution, numinterv, solutionprop
		from solutionsprop
		where solutionsprop.numinterv=' . $param1 . '';
		
		return parent::getListeParam($sql.$and);
	}	
}


/**
 * Classe permettant de manipuler la table resolution
 */
class Resolution extends ObjetBDD {
	/**
	 * Constructeur de la classe resolution
	 * Instanciation de la classe et Initialisation des parametres
	 * @param $link; référence à la connexion ADODB $bdd
	 * @param $param (array); modifier dynamiquement le comportement de la classe
	 */
	function __construct($link,$param=null) {
		$this->param = $param;
		$this->table="resolution";
		$this->id_auto="1";
		$this->colonnes=array(
				"numresolution"=>array("type"=>1,"key"=>1,"requis"=>1,"defaultValue"=>0),
				"numconflitexpr"=>array("type"=>1,"requis"=>1, "parentAttrib"=>1),
				"numsolution"=>array("type"=>1, "parentAttrib"=>1),
				"resolutionniv1"=>array("type"=>0, "longueur"=>255),
				"resolutionnivspat"=>array("type"=>0, "longueur"=>255),		
				"resolutionnivacteur"=>array("type"=>0, "longueur"=>255),		
				"moderesolutionniv1"=>array("type"=>0, "longueur"=>255),	
				"moderesolutionniv2"=>array("type"=>0, "longueur"=>255),		
				"detailresolution"=>array("type"=>0, "longueur"=>255)								
		);
		if(!is_array($param)) $param==array();
		$param["fullDescription"]=1;
		parent::__construct($link,$param);
	}
	
	/**
	 * Retourne la table resolution
	 * (non-PHPdoc)
	 * @see plugins/objetBDD/ObjetBDD#getListe()
	 */
	
	function getRresolution($param1,$param2) {
		$sql='select numresolution, numconflitexpr, numsolution, resolutionniv1, resolutionnivspat, resolutionnivacteur, moderesolutionniv1, moderesolutionniv2, detailresolution
		from resolution
		where resolution.numconflitexpr=' . $param1 . '';
		$and = '';

		/**
		 * Recherche de la chaine de caracteres zone resolniv1
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($and)==0) {
			$param2["zoneResolniv1"]=pg_escape_string($param2["zoneResolniv1"]);	
			$and .= ' and (resolution.resolutionniv1 ilike \'%'.$param2["zoneResolniv1"].'%\')';			
		}		
	
		/**
		 * Recherche de la chaine de caracteres zone zoneResolmode
		 * strlen : nb caracteres
	 	 * ilike = comme (maj ou min) et % = commence ou finit par (ouvert sur la chaine)
		 * .= coller à la suite
		 */
		
		if (strlen($and)==0) {
			$param2["zoneResolmode"]=pg_escape_string($param2["zoneResolmode"]);
			$and .= ' and (resolution.moderesolutionniv1 ilike \'%'.$param2["zoneResolmode"].'%\' 
						or resolution.moderesolutionniv2 ilike \'%'.$param2["zoneResolmode"].'%\')';
		} else {
			if (strlen($param2["zoneResolmode"])>0) {
			$param2["zoneResolmode"]=pg_escape_string($param2["zoneResolmode"]);	
			$and .= ' and (resolution.moderesolutionniv1 ilike \'%'.$param2["zoneResolmode"].'%\'
						or resolution.moderesolutionniv2 ilike \'%'.$param2["zoneResolmode"].'%\')';
			}
		}
		return parent::getListeParam($sql.$and);	
	}
}

?>


