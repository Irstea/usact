<script>
$(document).ready(function() {
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
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
&nbsp;
<a href="index.php?module=expertDisplay&expert_id={$expert.expert_id}">
Retour à l'expert n° {$expert.expert_id}
</a>

&nbsp;
<a href="index.php?module=entretienDisplay&entretien_id={$entretien.entretien_id}" >
Retour au détail de l'entretien {$entretien.entretien_id}</a>
{include file="conflit/conflitListSearch.tpl"}
<br>
<div class="formSaisie">
<fieldset>
<legend>Rattacher un nouveau conflit</legend>
<form method="post" action="index.php">
<input type="hidden" name="entretien_id" value="{$entretien.entretien_id}">
<input type="hidden" name="module" value="entretienConflitWrite">

<dl>
<dt>Objet du conflit (pour recherche) :</dt>
<dd>
<select id="conflitSearch">
<option value="">
Sélectionnez l'objet (niveau 2)...
</option>
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
<dd><select id="conflit_id" name="conflit_id">
</select>
</dd>
</dl>
<div class="formBouton">
<input class="submit" type="submit" value="Ajouter">
</div>
</form>
</fieldset>
</div>
<br>
<div class="formSaisie">
<fieldset>
<legend>Supprimer un conflit rattaché</legend>
<form method="post" action="index.php" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="entretien_id" value="{$entretien.entretien_id}">
<input type="hidden" name="module" value="entretienConflitDelete">
<dl><dt>Conflit à enlever :</dt>
<dd>
<select name="conflit_id">
<option value="">Sélectionnez le conflit à enlever...</option>
{section name=lst loop=$conflit}
<option value="{$conflit[lst].conflit_id}">
{$conflit[lst].conflit_id} - {$conflit[lst].type_perimetre_libelle} - {$conflit[lst].objet_niv2_libelle} - {$conflit[lst].bien_support_niv2_libelle}
</option>
{/section}
</select>
</dd>
</dl>
<div class="formBouton">
<input class="submit" type="submit" value="Enlever">
</div>
</form>
</fieldset>
</div>


