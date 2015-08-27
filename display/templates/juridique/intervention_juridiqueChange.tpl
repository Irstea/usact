<script>
$(document).ready(function() {
	$(".selection").change(function() {
		/*
		* Traitement de la recherche d'une espèce/type
		*/
		var options = '<option value=""></option>';
		/*
		* declenchement de la recherche
		*/
		var variables = { "juridiction_id": $("#juridiction_id").val(),
				"nature_requete_id" : $("#nature_requete_id").val()	};
		var url = "index.php?module=juridiqueSearchAjax";
		options = $.getJSON ( url, variables,
			function( data ) {
			 for (var i = 0; i < data.length; i++) {
			        options += '<option value="' + data[i].juridique_id + '">' 
			        + data[i].juridique_id + " - "
			        + data[i].juridiction_libelle + " - "
			        + data[i].nature_requete_libelle + " - "
			        + data[i].arret_num + " " + data[i].arret_date
			        + '</option>';
			      };
			  $("#juridique_id").html(options);
		} ) ;
	} );
});
</script>
<h2>Nouveau/Modification d'une intervention juridique :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
&nbsp;
<a href="index.php?module=interventionDisplay&intervention_id={$data.intervention_id}" >
Retour au détail de l'intervention n° {$data.intervention_id}</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="intervention_juridique_id" value="{$data.intervention_juridique_id}">
<input type="hidden" name="module" value="intervention_juridiqueWrite">
<input type="hidden" name="intervention_id" value="{$data.intervention_id}">

<dl>
<dt>Rechercher un acte juridique :</dt>
<dd>
<select class="selection" name="juridiction_id" id="juridiction_id">
<option value=""></option>
{section name=lst loop=$juridiction}
<option value="{$juridiction[lst].juridiction_id}">{$juridiction[lst].juridiction_libelle}</option>
{/section}
</select>
<br>
<select class="selection" name="nature_requete_id" id="nature_requete_id">
<option value=""></option>
{section name=lst loop=$nature_requete}
<option value="{$nature_requete[lst].nature_requete_id}">{$nature_requete[lst].nature_requete_libelle}</option>
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Acte juridique<span class="red">*</span> :</dt>
<select name="juridique_id" id="juridique_id">
<option value="{$data.juridique_id}">
{$data.juridique_id} - {$juridique.juridiction_libelle} - {$juridique.nature_requete_libelle} - {$juridique.arret_num} {$juridique.arret_date}
</option>
</select>
</dl>


<dl>
<dt>Position de l'acteur<span class="red">*</span> :</dt>
<dd><select name="position_acteur_id">
{section name=lst loop=$position_acteur}
<option value="{$position_acteur[lst].position_acteur_id}" {if $position_acteur[lst].position_acteur_id == $data.position_acteur_id}selected{/if}>
{$position_acteur[lst].position_acteur_libelle}
</option>
{/section}
</select>
</dl>

<dl><dt>Pétitionnaire ?</dt>
<dd>
<input name="petitionnaire" type="radio" value="0" {if $data.petitionnaire == 0}checked{/if}>non&nbsp;
<input name="petitionnaire" type="radio" value="1" {if $data.petitionnaire == 1}checked{/if}>oui&nbsp;
<input name="petitionnaire" type="radio" value="" {if $data.petitionnaire == ""}checked{/if}>indéfini
</dd>
</dl>

<dl>
<dt>Qualité de l'appel :</dt>
<dd><select name="qualite_appel_id">
<option value="" {if $data.qualite_appel_id == ""}selected{/if}></option>
{section name=lst loop=$qualite_appel}
<option value="{$qualite_appel[lst].qualite_appel_id}" {if $qualite_appel[lst].qualite_appel_id == $data.qualite_appel_id}selected{/if}>
{$qualite_appel[lst].qualite_appel_libelle}
</option>
{/section}
</select>
</dl>

<dl>
<dt>Qualité du pourvoi :</dt>
<dd><select name="qualite_pourvoi_id">
<option value="" {if $data.qualite_pourvoi_id == ""}selected{/if}></option>
{section name=lst loop=$qualite_appel}
<option value="{$qualite_appel[lst].qualite_appel_id}" {if $qualite_appel[lst].qualite_appel_id == $data.qualite_pourvoi_id}selected{/if}>
{$qualite_appel[lst].qualite_appel_libelle}
</option>
{/section}
</select>
</dl>

<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>

<div class="formBouton">
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="intervention_juridique_id" value="{$data.intervention_juridique_id}">
<input type="hidden" name="intervention_id" value="{$data.intervention_id}">
<input type="hidden" name="module" value="intervention_juridiqueDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>