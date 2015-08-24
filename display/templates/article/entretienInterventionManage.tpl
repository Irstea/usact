<script>
$(document).ready(function() {
	$("#acteurSearch").keyup(function () {
		var texte = $(this).val();
		if (texte.length > 2) {
		/*
		* declenchement de la recherche
		*/
		var url = "index.php?module=interventionSearchAjax";
		$.getJSON ( url, { "libelle": texte } , function( data ) {
			
			var options = '';
			var detail = '';
			 for (var i = 0; i < data.length; i++) {
				 acteur_physique_nom = !data[i].acteur_physique_nom ? "" : data[i].acteur_physique_nom;
				 acteur_moral_nom = !data[i].acteur_moral_nom ? "" : data[i].acteur_moral_nom;
				 role = !data[i].role_libelle ? "" : data[i].role_libelle;
			        options += '<option value="' + data[i].intervention_id + '">' 
			        + data[i].intervention_id + " - " + acteur_moral_nom +" " +acteur_physique_nom
			        + data[i].position_usage_activite_libelle + " " + role
			        + '</option>';
			      };				
			$("#intervention_id").html(options);
		} ) ;
		}
	});
});
</script>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
&nbsp;
<a href="index.php?module=articleDisplay&article_id={$article.article_id}" >
Retour au détail de l'article {$article.article_id}</a>
{include file="intervention/interventionList.tpl"}
<br>
<div class="formSaisie">
<fieldset>
<legend>Rattacher une nouvelle intervention</legend>
<form method="post" action="index.php">
<input type="hidden" name="article_id" value="{$article.article_id}">
<input type="hidden" name="module" value="articleInterventionWrite">

<dl>
<dt>Nom de l'acteur (pour recherche) :</dt>
<dd>
<input id="acteurSearch" class="commentaire">
</dd>
</dl>
<dl>
<dt>Intervention :</dt>
<dd><select id="intervention_id" name="intervention_id">
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
<legend>Supprimer une intervention relatée</legend>
<form method="post" action="index.php" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="article_id" value="{$article.article_id}">
<input type="hidden" name="module" value="articleInterventionDelete">
<dl><dt>Conflit à enlever :</dt>
<dd>
<select name="intervention_id">
<option value="">Sélectionnez l'intervention à enlever...</option>
{section name=lst loop=$intervention}
<option value="{$intervention[lst].intervention_id}">
{$intervention[lst].intervention_id} - {$intervention[lst].acteur_moral_nom} 
{$intervention[lst].acteur_physique_nom} - 
{$intervention[lst].position_usage_activite_libelle} - {$intervention[lst].role_libelle}
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


