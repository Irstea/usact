<?php

/**
 * Classe de manipulation de la table bien_support_niv2
 * 
 * @author jeremy.damey
 *
 */
class BienSupportNiv2 extends ObjetBDD {
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
		$this->table = "bien_support_niv2";
		$this->id_auto = 1;
		$this->colonnes = array (
				"bien_support_niv2_id" => array (
						"type" => 1,
						"requis" => 1,
						"key" => 1,
						"defaultValue" => 0 
				),
				"bien_support_niv1_id" => array (
						"type" => 1,
						"requis" => 0
				),
				"bien_support_niv2_libelle" => array (
						"type" => 0
				)
		);
		$param ["fullDescription"] = 1;
		
		parent::__construct ( $link, $param );
	}
	
	/**
	 * Retourne la liste des bien_support_niv2s en fonction des critères de recherche fournis
	 *
	 * @param unknown $param        	
	 *
	 */
	function getListeSearch($param) {
		if (! is_array ( $param ))
			$param = array ();
		$param = $this->encodeData($param);
		$sql = 'select bien_support_niv2_id,
				bien_support_niv2.bien_support_niv1_id,
				bien_support_niv2_libelle,
				bien_support_niv1_libelle
				from ' .$this->table .',bien_support_niv1 
				where bien_support_niv2.bien_support_niv1_id = bien_support_niv1.bien_support_niv1_id';
				
		/*
		 * Rajout des parametres de recherche
		 */
		if (strlen ( $param ["searchId"] ) > 0)
			$where .= ' and bien_support_niv2_id ='.$param["searchId"];
		
		$order = ' order by bien_support_niv2_id';
		
		return parent::getListeParam ( $sql . $where . $order);
	}
	
	function getListe() {
		$sql = 'select bien_support_niv2_id,
				bien_support_niv2.bien_support_niv1_id,
				bien_support_niv2_libelle,
				bien_support_niv1_libelle
				from ' .$this->table .',bien_support_niv1
				where bien_support_niv2.bien_support_niv1_id = bien_support_niv1.bien_support_niv1_id
				order by bien_support_niv2_id';
	
		return parent::getListeParam ( $sql );
	}
	
	/**
	 * Retourne le detail de la fiche du bien_support_niv2 selectionné du bien_support_niv2
	 * 
	 * @param unknown $id
	 * @return Ambigous <multitype:, boolean, $data>
	 */
	function lireDetail($id) {	
		if($id > 0)	
		{
			$id = $this->encodeData($id);
			$sql = 'select bien_support_niv2_id,
					bien_support_niv2.bien_support_niv1_id,
					bien_support_niv2_libelle,
					bien_support_niv1_libelle
					from ' .$this->table .',bien_support_niv1
					where bien_support_niv2.bien_support_niv1_id = bien_support_niv1.bien_support_niv1_id 
					and bien_support_niv2_id = '.$id
					.' order by bien_support_niv2_id';
			return parent::lireParam ( $sql );
		}
	}
	
	/*$("#recherche").keyup(function() {*/
		/*
		 * Traitement de la recherche d'une espèce/type
		 */
		/*var texte = $(this).val();
		if (texte.length > 2) {*/
			/*
			 * declenchement de la recherche
			 */
			/*var url = "index.php?module=bienSupportNiv2Search";
			$.getJSON ( url, { "bien_support_niv2_libelle": texte } , function( data ) {
				var options = '';
				for (var i = 0; i < data.length; i++) {
					options += '<option value="' + data[i].id + '">' + data[i].val + '</option>';
				};
				$("#bien_support_niv2_id").html(options);
			} ) ;
		};
	} );*/
	
}
?>
