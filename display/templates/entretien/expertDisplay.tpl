<h2>Détail d'un expert</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste </a>
&nbsp;
<a href="index.php?module=expertChange&expert_id={$expert.expert_id}" >Modifier...</a>
{include file="entretien/expertDetail.tpl"}

<table class="noborder">
<tr>
<td>
<fieldset>
<legend>Entretiens réalisés</legend>
{if $droits.gestion == 1}
<a href="index.php?module=entretienChange&entretien_id=0&expert_id={$expert.expert_id}">
Nouvel entretien...
</a>
{/if}
{include file="entretien/entretienList.tpl"}
</fieldset>

</td>
</tr>
</table>