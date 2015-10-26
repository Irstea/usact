<?php
/**
 * @author Eric Quinton
 * @copyright Copyright (c) 2014, IRSTEA / Eric Quinton
 * @license http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html LICENCE DE LOGICIEL LIBRE CeCILL-C
 *  Creation 7 avr. 2014
 *  
 *  Les classes fonctionnent avec les tables suivantes :
 *  
 CREATE TABLE mime_type
 (
 mime_type_id  serial     NOT NULL,
 content_type  varchar    NOT NULL,
 extension     varchar    NOT NULL
 );
 
 -- Column mime_type_id is associated with sequence public.mime_type_mime_type_id_seq
 
 
 ALTER TABLE mime_type
 ADD CONSTRAINT mime_type_pk
 PRIMARY KEY (mime_type_id);
 
 COMMENT ON TABLE mime_type IS 'Table des types mime, pour les documents associés';
 COMMENT ON COLUMN mime_type.content_type IS 'type mime officiel';
 COMMENT ON COLUMN mime_type.extension IS 'Extension du fichier correspondant';
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  1,  'application/pdf',  'pdf');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  2,  'application/zip',  'zip');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  3,  'audio/mpeg',  'mp3');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  4,  'image/jpeg',  'jpg');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES(  5,  'image/jpeg',  'jpeg');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  6,  'image/png',  'png');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  7,  'image/tiff',  'tiff');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  9,  'application/vnd.oasis.opendocument.text',  'odt');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  10,  'application/vnd.oasis.opendocument.spreadsheet',  'ods');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  11,  'application/vnd.ms-excel',  'xls');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  12,  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',  'xlsx');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  13,  'application/msword',  'doc');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  14,  'application/vnd.openxmlformats-officedocument.wordprocessingml.document',  'docx');
 
 INSERT INTO mime_type(  mime_type_id,  content_type,  extension)
 VALUES
 (  8,  'text/csv',  'csv');
 
 
 CREATE TABLE document
 (
 document_id           serial     NOT NULL,
 mime_type_id          integer    NOT NULL,
 document_date_import  date       NOT NULL,
 document_nom          varchar    NOT NULL,
 document_description  varchar,
 data                  bytea,
 size                  integer,
 thumbnail             bytea
 );
 
 -- Column document_id is associated with sequence public.document_document_id_seq
 
 
 ALTER TABLE document
 ADD CONSTRAINT document_pk
 PRIMARY KEY (document_id);
 
 ALTER TABLE document
 ADD CONSTRAINT mime_type_document_fk FOREIGN KEY (mime_type_id)
 REFERENCES mime_type (mime_type_id)
 ON UPDATE NO ACTION
 ON DELETE NO ACTION;
 
 COMMENT ON TABLE document IS 'Documents numériques rattachés à un poisson ou à un événement';
 COMMENT ON COLUMN document.document_nom IS 'Nom d''origine du document';
 COMMENT ON COLUMN document.document_description IS 'Description libre du document';
 */
/**
 * ORM de gestion de la table mime_type
 *
 * @author quinton
 *        
 */
class MimeType extends ObjetBDD {
	/**
	 * Constructeur de la classe
	 *
	 * @param Adodb_instance $bdd        	
	 * @param array $param        	
	 */
	function __construct($bdd, $param = null) {
		$this->param = $param;
		$this->table = "mime_type";
		$this->id_auto = 1;
		$this->colonnes = array (
				"mime_type_id" => array (
						"type" => 1,
						"key" => 1,
						"requis" => 1,
						"defaultValue" => 0 
				),
				"extension" => array (
						"type" => 0,
						"requis" => 1 
				),
				"content_type" => array (
						"type" => 0,
						"requis" => 1 
				) 
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	/**
	 * Retourne le numero de type mime correspondant a l'extension
	 *
	 * @param string $extension        	
	 * @return int
	 */
	function getTypeMime($extension) {
		if (strlen ( $extension ) > 0) {
			$extension = strtolower ( $this->encodeData ( $extension ) );
			$sql = "select mime_type_id from " . $this->table . " where extension = '" . $extension . "'";
			$res = $this->lireParam ( $sql );
			return $res ["mime_type_id"];
		}
	}
}
/**
 * Orm de gestion de la table document :
 * Stockage des pièces jointes
 *
 * @author quinton
 *        
 */
class Document extends ObjetBDD {
	public $temp = "temp"; // Chemin de stockage des images générées à la volée
	/**
	 * Constructeur de la classe
	 *
	 * @param Adodb_instance $bdd        	
	 * @param array $param        	
	 */
	function __construct($bdd, $param = null) {
		global $APPLI_nomDossierStockagePhotoTemp;
		if (strlen ($APPLI_nomDossierStockagePhotoTemp) > 0)
			$this->temp = $APPLI_nomDossierStockagePhotoTemp;
		$this->paramori = $param;
		$this->param = $param;
		$this->table = "document";
		$this->id_auto = 1;
		$this->colonnes = array (
				"document_id" => array (
						"type" => 1,
						"key" => 1,
						"requis" => 1,
						"defaultValue" => 0 
				),
				"mime_type_id" => array (
						"type" => 1,
						"requis" => 1 
				),
				"document_date_import" => array (
						"type" => 2,
						"requis" => 1 
				),
				"document_nom" => array (
						"type" => 0,
						"requis" => 1 
				),
				"document_description" => array (
						"type" => 0 
				),
				"data" => array (
						"type" => 0 
				),
				"thumbnail" => array (
						"type" => 0 
				),
				"size" => array (
						"type" => 1,
						"defaultValue" => 0 
				) 
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	/**
	 * Recupere les informations d'un document
	 *
	 * @param int $id        	
	 * @return array
	 */
	function getData($id) {
		if ($id > 0 && is_numeric ( $id )) {
			$sql = "select document_id, document_nom,  content_type, mime_type_id, extension
				from " . $this->table . "
				join mime_type using (mime_type_id)
				where document_id = " . $id;
			return $this->lireParam ( $sql );
		}
	}
	


	/**
	 * Fonction permettant de retourner la liste des documents en fonction de la commande
	 * sql passee en parametre.
	 * Elle stocke les documents ou les photos et vignettes dans le dossier temporaire,
	 * et retourne les chemins d'acces a ces documents
	 * @param string $sql
	 * @return array
	 */
	function documentSearch($sql) {
		if (strlen ($sql ) > 0) {
			$data = $this->getListeParam ( $sql );
			foreach ( $data as $key => $value ) {
				$data [$key] ["photo_name"] = $this->writeFileImage ( $value ["document_id"], 0 );
				if (in_array ( $value ["mime_type_id"], array (
						1,
						4,
						5,
						6,
						7
				) ))
					$data [$key] ["thumbnail_name"] = $this->writeFileImage ( $value ["document_id"], 2 );
			
				if (in_array ( $value ["mime_type_id"], array (
						4,
						5,
						6,
						7
				) ))
					$data [$key] ["photo800_name"] = $this->writeFileImage ( $value ["document_id"], 1 );
			}
			return $data;
		}
	}
	
	/**
	 * Ecriture d'un document
	 *
	 * @param array $file
	 *        	: tableau contenant les informations sur le fichier importé
	 *        	
	 * @param
	 *        	int individu_id : cle de l'enregistrement pere
	 * @param
	 *        	string description : description du contenu du document
	 * @return int
	 */
	function ecrire($file, $description = NULL) {
		if ($file ["error"] == 0 && $file ["size"] > 0 ) {
			/*
			 * Recuperation de l'extension
			 */
			$extension = $this->encodeData ( substr ( $file ["name"], strrpos ( $file ["name"], "." ) + 1 ) );
			$mimeType = new MimeType ( $this->connection, $this->paramori );
			$mime_type_id = $mimeType->getTypeMime ( $extension );
			if ($mime_type_id > 0) {
				$data = array ();
				$data ["document_nom"] = $file ["name"];
				$data ["size"] = $file ["size"];
				$data ["mime_type_id"] = $mime_type_id;
				$data ["document_description"] = $description;
				$data ["document_date_import"] = date ( "d/m/Y" );
				$data ["document_id"] = $file["document_id"];
				$dataDoc = array ();
				
				/*
				 * Recherche pour savoir s'il s'agit d'une image ou d'un pdf pour créer une vignette
				 */
				$extension = strtolower ( $extension );
				/*
				 * Ecriture du document
				 */
				$dataBinaire = fread ( fopen ( $file ["tmp_name"], "r" ), $file ["size"] );
				
				$dataDoc ["data"] = pg_escape_bytea ( $dataBinaire );
				if ($extension == "pdf" || $extension == "png" || $extension == "jpg") {
					$image = new Imagick ();
					$image->readImageBlob ( $dataBinaire );
					$image->setiteratorindex ( 0 );
					$image->resizeimage ( 200, 200, imagick::FILTER_LANCZOS, 1, true );
					$image->setformat ( "png" );
					$dataDoc ["thumbnail"] = pg_escape_bytea ( $image->getimageblob () );
				}
				/*
				 * suppression du stockage temporaire
				 */
				unset ( $file ["tmp_name"] );
				/*
				 * Ecriture dans la base de données
				 */
				$id = parent::ecrire ( $data );
				if ($id > 0) {
					$sql = "update " . $this->table . " set data = '" . $dataDoc ["data"] . "', thumbnail = '" . $dataDoc ["thumbnail"] . "' where document_id = " . $id;
					$this->executeSQL ( $sql );
				}
				return $id;
			}
		}
	}
	
	/**
	 * Fonction ecrivant les documents dans le dossier temporaire
	 * pour utilisation via un lien
	 *
	 * @param int $id
	 *        	: numero du document
	 * @param number $type
	 *        	: 0 : photo plein format, 1 : photo en resolution 800, 2, : vignette
	 * @return string
	 */
	function writeFileImage($id, $type = 0) {
		global $APPLI_code;
		if ($id > 0 && is_numeric ( $id )) {
			$data = $this->getData ( $id );
			$resolution = 800;
			/*
			 * Preparation du nom de la photo
			 */
			switch ($type) {
				case 1 :
					$colonne = "data";
					//$filename = $this->temp . '/' . $id . "x" . $resolution . "." . $data ["extension"];
					$filename = $APPLI_code."-".$id. "x" . $resolution .".".$data["extension"];
					break;
				case 2 :
					$colonne = "thumbnail";
					//$filename = $this->temp . '/' . $id . '_vignette.png';
					$filename = $APPLI_code."-".$id. '_vignette.png';
					break;
				default :
					$colonne = "data";
					$filename = $this->temp . '/' . $id . "-" . $data ["document_nom"];
					$filename = $APPLI_code."-".$id. "-".$data ["document_nom"];
			}
			
			/*
			 * Traitement des photos
			 */
			if (! file_exists ( $filename )) {
				$docRef = $this->getBlobReference ( $id, $colonne );
				if (($data ["mime_type_id"] == 4 || $data ["mime_type_id"] == 5 || $data ["mime_type_id"] == 6)) {
					$image = new Imagick ();
					$image->readImageFile ( $docRef );
					if ($type == 1) {
						/*
						 * Redimensionnement de la photo pour l'amener a la resolution d'affichage
						 */
						$resize = 0;
						$geo = $image->getimagegeometry ();
						if ($geo ["width"] > $resolution || $geo ["height"] > $resolution) {
							$resize = 1;
							/*
							 * Calcul de la résolution dans les deux sens
							 */
							if ($geo ["width"] > $resolution) {
								$resx = $resolution;
								$resy = $geo ["height"] * ($resolution / $geo ["width"]);
							} else {
								$resy = $resolution;
								$resx = $geo ["width"] * ($resolution / $geo ["height"]);
							}
						}
						if ($resize == 1) {
							$image->resizeImage ( $resx, $resy, imagick::FILTER_LANCZOS, 1 );
						}
					}
					$document = $image->getimageblob ();
				} else {
					/*
					 * Autres types de documents : ecriture directe du contenu
					 */
					rewind($docRef);
					$document = stream_get_contents($docRef);
					if ($document == false)
						printr("erreur de lecture ".$docRef);
				}
				/*
				 * Ecriture du document dans le dossier temporaire
				 */
				$handle = fopen ( $this->temp."/".$filename, 'wb' );
				fwrite ( $handle, $document );
				fclose ( $handle );
			}
			return $filename;
		}
	}
	
	/**
	 * Envoie un fichier au navigateur, pour affichage
	 * @param string $nomfile : nom du fichier stocke dans le dossier temporaire
	 * @param int $id : cle du document, necessaire pour recuperer le type mime
	 */
	function documentSent($nomfile, $id) {
		$id = $this->encodeData($id);
		$nomfile = $this->encodeData($nomfile);
		if(strlen($nomfile) > 0 && is_numeric($id) && $id > 0) {
			$filename = $this->temp."/".$nomfile;
			if (file_exists($filename)) {
				/*
				 * Lecture du type mime
				 */
				$data = $this->getData($id);
				if (strlen($data["content_type"]) > 0) {
					header("content-type: ".$data["content_type"]);
					header('Content-Transfer-Encoding: binary');
					ob_clean();
					flush();
					readfile($filename);
				}
			}
			
		}
	}
}


class DocumentUsact extends Document {
	public $resolution=800;
	public $modules=array("entretien", "juridique", "article");

	/**
	 * Retourne la liste des documents associes au type (evenement, poisson, bassin) et à la clé correspondante
	 * @param string $type
	 * @param int $id
	 * @return array
	 */
	function getListeDocument($type, $id) {
		if ( in_array($type, $this->modules) && $id > 0 && is_numeric($id)) {
				$sql = "select " . $type . "_id, document_id, document_date_import,
					document_nom, document_description, size, mime_type_id
					from document
					join " . $type . "_document using (document_id)
					where " . $type . "_id = " . $id . "
					order by document_date_import desc";
			$liste = $this->getListeParam ( $sql );
			/*
			 * Stockage des photos dans le dossier temporaire
			*/
			foreach ( $liste as $key => $value ) {
				$filenames = $this->writeFileImage($value["document_id"], $this->resolution);
				$liste[$key]["photo_name"] = $this->writeFileImage($value["document_id"], 0);
				$liste[$key]["photo_preview"] = $this->writeFileImage($value["document_id"], 1);
				$liste[$key]["thumbnail_name"] = $this->writeFileImage($value["document_id"], 2);
			}
			return ($liste);
		}
	}
	
}
/**
 * ORM permettant de gérer toutes les tables de liaison avec la table Document
 * @author quinton
 *
 */
class DocumentLie extends ObjetBDD {
	public $tableOrigine;
	/**
	 * Constructeur de la classe
	 *
	 * @param Adodb_instance $bdd
	 * @param array $param
	 */
	function __construct($bdd, $param = null, $nomTable="") {
		$this->param = $param;
		$this->paramori = $this->param;
		$this->tableOrigine = $nomTable;
		$this->table = $nomTable."_document";
		$this->id_auto = 0;
		$this->colonnes = array (
				$nomTable."_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1
				),
				"document_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1
				)
		);
		if (! is_array ( $param ))
			$param == array ();
		$param ["fullDescription"] = 1;
		parent::__construct ( $bdd, $param );
	}
	/**
	 * Reecriture de la fonction ecrire($data)
	 * (non-PHPdoc)
	 * @see ObjetBDD::ecrire()
	 */
	function ecrire ($data) {
		$nomChamp = $this->tableOrigine."_id";
		if ($data["document_id"] > 0 && $data[$nomChamp] > 0) {
			$sql = "insert into ".$this->table."
 					(document_id, ".$nomChamp.")
 					values
 					(".$data["document_id"].",".$data[$nomChamp].")";
			$rs = $this->executeSQL($sql);

			if (count($rs) > 0) {
				return 1;
			} else {
				return -1;
			}
		}
	}

	/**
	 * Supprime la reference au document dans la table liee
	 * (non-PHPdoc)
	 * @see ObjetBDD::supprimer()
	 */
	function supprimer($id) {
		if (is_numeric ($id) && $id > 0) {
			$this->supprimerChamp($id, "document_id");
		}
	}
	
	/**
	 * Retourne la liste des documents associes
	 * @param int $id
	 * @return array
	 */
	function getListeDocument ($id) {
		$documentUsact = new DocumentUsact($this->connection, $this->paramori);
		return $documentUsact->getListeDocument($this->tableOrigine, $id);
	}
}

?>

