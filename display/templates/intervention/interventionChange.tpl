<script>
$(document).ready(function() {
	$("#acteurSearch").keyup(function() {
		/*
		* Traitement de la recherche d'une espèce/type
		*/
		var texte = $(this).val();
		if (texte.length > 2) {
			/*
			* declenchement de la recherche
			*/
			var url = "index.php?module=acteurSearchAjax";
			$.getJSON ( url, { "libelle": texte } , function( data ) {
				var options = '';
				var moral = '';
				var physique = '';
				 for (var i = 0; i < data.length; i++) {
					 moral = !data[i].acteur_moral_nom ? "" : data[i].acteur_moral_nom;
					 physique = !data[i].acteur_physique_nom ? "" : data[i].acteur_physique_nom;
				        options += '<option value="' + data[i].acteur_id + '">' 
				        + data[i].acteur_id + " - "+ moral 
				        + " " + physique
				        + '</option>';
				      };				
				$("#acteur_id").html(options);
			} ) ;
		};
	} );
	$("#conflitSearch").change(function () {
		var id = $(this).val();
		/*
		* declenchement de la recherche
		*/
		var url = "index.php?module=conflitSearchAjax";
		$.getJSON ( url, { "objet_id": id } , function( data ) {
			var options = '';
			var detail = '';
			 for (var i = 0; i < data.length; i++) {
				 detail = !data[i].conflit_detail ? "" : data[i].conflit_detail;
			        options += '<option value="' + data[i].conflit_id + '">' 
			        + data[i].conflit_id + " - " + detail
			        + '</option>';
			      };				
			$("#conflit_id").html(options);
		} ) ;
	});
});
</script>

<h2>Nouveau/Modification d'une intervention :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
&nbsp;
<a href="index.php?module=interventionDisplay&intervention_id={$data.intervention_id}">Retour au détail de la fiche</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="intervention_id" value="{$data.intervention_id}">
<input type="hidden" name="module" value="interventionWrite">

<fieldset>
<legend>Intervention {if $data.intervention_id > 0}n° {$data.intervention_id}{/if}</legend>
<dl>
<dt>Acteur :</dt>
<dd>
<input id="acteurSearch" placeholder="Nom à rechercher..." class="commentaire" autofocus>
<br>
<select id="acteur_id" name="acteur_id">
<option value="{$data.acteur_id}">
{$acteur.acteur_id} - {$acteur.acteur_moral_nom} {$acteur.acteur_physique_nom}
</option>
</select>
</dd>
</dl>
<dl>
<dt>Objet du conflit (pour recherche) :</dt>
<dd>
<select id="conflitSearch">
{section name=lst loop=$objet_niv2}
<option value="{$objet_niv2[lst].objet_niv2_id}" {if $conflit.objet_niv2_id == $objet_niv2[lst].objet_niv2_id}selected{/if}>
{$objet_niv2[lst].objet_niv1_libelle} - {$objet_niv2[lst].objet_niv2_libelle}
</option>
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Conflit :</dt>
<select id="conflit_id" name="conflit_id">
<option value="{$data.conflit_id}">
{$conflit.conflit_id} - {$conflit.conflit_detail}
</option>
</select>
</dl>
<dl>
<dt>Activité d'usage :</dt>
<dd>
<select name="usage_activite_niv2_id">
<option value="" {if $data.usage_activite_niv2_id == ""}selected{/if}>
</option>
{section name=lst loop=$usage_activite_niv2}
<option value="{$usage_activite_niv2[lst].usage_activite_niv2_id}" {if $usage_activite_niv2[lst].usage_activite_niv2_id == $data.usage_activite_niv2_id}selected{/if}>
{$usage_activite_niv2[lst].usage_activite_niv1_libelle} - {$usage_activite_niv2[lst].usage_activite_niv2_libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Position<span class="red">*</span> : </dt>
<dd>
<select name="position_usage_activite_id">
{section name=lst loop=$position_usage_activite}
<option value="{$position_usage_activite[lst].position_usage_activite_id}" {if $position_usage_activite[lst].position_usage_activite_id == $data.position_usage_activite_id}selected{/if}>
{$position_usage_activite[lst].position_usage_activite_libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Rôle :</dt>
<dd>
<select name="role_id">
<option value="" {if $data.role_id == ""}selected{/if}>
</option>
{section name=lst loop=$role}
<option value="{$role[lst].role_id}" {if $role[lst].role_id == $data.role_id}selected{/if}>
{$role[lst].role_libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Détail :</dt>
<dd><textarea name="intervention_detail_usage">{$data.intervention_detail}</textarea></dd>
</dl>

<dl>
<dt>Date d'entrée :</dt>
<dd><input class="date" name="intervention_date_entree" value="{$data.intervention_date_entree}">
(<input name="intervention_date_entree_txt" value="{$data.intervention_date_entree_txt}" placeholder="date non formatée">)</dd>
</dl>


<dl>
<dt>Date de sortie :</dt>
<dd><input class="date" name="intervention_date_sortie" value="{$data.intervention_date_sortie}">
(<input name="intervention_date_sortie_txt" value="{$data.intervention_date_sortie_txt}" placeholder="date non formatée">)
</dd>
</dl>
</fieldset>


<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
{if $data.intervention_id > 0}
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="intervention_id" value="{$data.intervention_id}">
<input type="hidden" name="acteur_id" value="{$data.acteur_id}">
<input type="hidden" name="conflit_id" value="{$data.conflit_id}">
<input type="hidden" name="module" value="interventionDelete">
<div class="formBouton">
<input type="submit" value="Supprimer">
</div>
</form>
{/if}
</div>

<span class="red">*</span><span class="messagebas">Champ obligatoire</span>
