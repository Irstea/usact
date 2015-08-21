<h2>Détail d'un entretien</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste </a>
&nbsp;
<a href="index.php?module=entretienChange&entretien_id={$entretien.entretien_id}" >Modifier...</a>
{include file="entretien/entretienDetail.tpl"}
<br>
{include file="entretien/expertDetail.tpl"}
<table class="noborder">
<tr>
<td>
<fieldset>
<legend>Conflits relatés</legend>
{if $droits.gestion == 1}
<a href="index.php?module=entretienConflitManage&entretien_id={$entretien.entretien_id}">Gérer les conflits rattachés...</a>
{/if}
{include file="conflit/conflitListSearch.tpl"}
</fieldset>
<br>
<fieldset>
<legend>Interventions évoquées</legend>
{if $droits.gestion == 1}
<a href="index.php?module=entretienInterventionManage&entretien_id={$entretien.entretien_id}">Gérer les interventions évoquées...</a>
{/if}
{include file="intervention/interventionList.tpl"}
</fieldset>
</td>
</tr>
</table>