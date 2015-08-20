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
Rattacher un nouveau conflit
{/if}
{include file="conflit/conflitListSearch.tpl"}
</fieldset>
<br>
</td>
</tr>
</table>