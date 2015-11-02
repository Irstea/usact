<h2>Détail d'un conflit</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste </a>
&nbsp;
{if $droits.gestion == 1}
<a href="index.php?module=conflitChange&conflit_id={$conflit.conflit_id}">Modifier...</a>
{/if}
{include file="conflit/conflitDetail.tpl"}
<br>
<table class="noborder">
<tr><td>

<fieldset>
<legend>Interventions</legend>
{if $droits.gestion == 1}
<a href="index.php?module=interventionChange&intervention_id=0&conflit_id={$conflit.conflit_id}">
Nouvelle intervention...
</a>
{/if}
{include file="intervention/interventionList.tpl"}
</fieldset>
<br>
<fieldset>
<legend>Entretiens relatant ce conflit</legend>
{include file="entretien/entretienList.tpl"}
</fieldset>
<br>
<fieldset>
<legend>Articles citant ce conflit</legend>
{include file="article/articleList.tpl"}
<br>
</fieldset>
<fieldset>
<legend>Affaires jurdiques traitant ce conflit</legend>
{include file="juridique/juridiqueList.tpl"}
</fieldset>
<fieldset>
<legend>Liste des résolutions</legend>
{if $droits.gestion == 1}
<a href="index.php?module=resolutionChange&resolution_id=0&conflit_id={$conflit.conflit_id}">
Nouvelle résolution...
</a>
{/if}
{include file="resolution/resolutionListe.tpl"}
<br>
</fieldset>

</td>
</tr>
</table>