<h2>Détail d'un acte juridique</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste </a>
&nbsp;
<a href="index.php?module=juridiqueChange&juridique_id={$juridique.juridique_id}" >Modifier...</a>
{include file="juridique/juridiqueDetail.tpl"}
<table class="noborder">
<tr>
<td>
<fieldset>
<legend>Conflits évoqués</legend>
{if $droits.gestion == 1}
<a href="index.php?module=juridiqueConflitManage&juridique_id={$juridique.juridique_id}">Gérer les conflits évoqués...</a>
{/if}
{include file="conflit/conflitListSearch.tpl"}
</fieldset>
<br>
</td>
</tr>
</table>