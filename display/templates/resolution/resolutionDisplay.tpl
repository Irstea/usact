<h2>Détail d'une résolution</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste </a>
&nbsp;
{if $droits.gestion == 1}
<a href="index.php?module=resolutionChange&resolution_id={$resolution.resolution_id}">Modifier...</a>
{/if}
{include file="resolution/resolutionDetail.tpl"}
<br>
{include file="resolution/solutionDetail.tpl"}
<br>
{include file="conflit/conflitDetail.tpl"}