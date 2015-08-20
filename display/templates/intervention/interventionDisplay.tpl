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

</td></tr>
</table>
{include file="conflit/conflitDetail.tpl"}
<br>
{include file="acteur/acteurDetail.tpl"}

