<h2>Détail d'un article</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste </a>
&nbsp;
<a href="index.php?module=articleChange&article_id={$article.article_id}" >Modifier...</a>
{include file="article/articleDetail.tpl"}
<table class="noborder">
<tr>
<td>
<fieldset>
<legend>Conflits évoqués</legend>
{if $droits.gestion == 1}
<a href="index.php?module=articleConflitManage&article_id={$article.article_id}">Gérer les conflits évoqués...</a>
{/if}
{include file="conflit/conflitListSearch.tpl"}
</fieldset>
<br>
<fieldset>
<legend>Interventions citées</legend>
{if $droits.gestion == 1}
<a href="index.php?module=articleInterventionManage&article_id={$article.article_id}">Gérer les interventions citées...</a>
{/if}
{include file="intervention/interventionList.tpl"}
</fieldset>
</td>
</tr>
</table>