<h2>Détail d'une intervention</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste </a>
&nbsp;
{if $droits.gestion == 1}
<a href="index.php?module=interventionChange&intervention_id={$intervention.intervention_id}">Modifier...</a>
{/if}
{include file="intervention/interventionDetail.tpl"}
<br>
<table class="noborder">
<tr><td>
<fieldset>
<legend>Actions</legend>
{if $droits.gestion == 1}
<a href="index.php?module=actionChange&intervention_id={$intervention.intervention_id}&action_id=0">
Nouvelle action...
</a>
{/if}
{include file="intervention/actionList.tpl"}
</fieldset>
<br>
<fieldset>
<legend>Revendications</legend>
{if $droits.gestion == 1}
<a href="index.php?module=revendicationChange&intervention_id={$intervention.intervention_id}&revendication_id=0">
Nouvelle revendication...
</a>
{/if}
{include file="intervention/revendicationList.tpl"}
</fieldset>
<fieldset>
<legend>Solutions proposées</legend>
{if $droits.gestion == 1}
<a href="index.php?module=solutionChange&solution_proposee_id=0&intervention_id={$intervention.intervention_id}">
Nouvelle solution...
</a>
{/if}
{include file="resolution/solutionList.tpl"}
<br>
</fieldset>
<fieldset>
<legend>Affaires juridiques impliquant cette intervention</legend>
{if $droits.gestion == 1}
<a href="index.php?module=intervention_juridiqueChange&intervention_juridique_id=0&intervention_id={$intervention.intervention_id}">
Nouvelle affaire juridique...
</a>
{/if}
{include file="juridique/interventionJuridiqueList.tpl"}
<br>
</fieldset>
<fieldset>
<legend>Articles citant cette intervention</legend>
{include file="article/articleList.tpl"}
<br>
</fieldset>
<fieldset>
<legend>Entretiens évoquant cette intervention</legend>
{include file="entretien/entretienList.tpl"}
<br>
</fieldset>


</td></tr>
</table>
{include file="conflit/conflitDetail.tpl"}
<br>
{include file="acteur/acteurDetail.tpl"}

