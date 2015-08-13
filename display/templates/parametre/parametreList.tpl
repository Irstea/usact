<h2>Contenu de la table de paramètres : {$tableName}</h2>
{include file="example/exampleSearch.tpl"}
{if $isSearch == 1}
{if $droits["param"] == 1}
<a href="index.php?module=parametreChange&{$tableName}_id=0">
Nouveau...
</a>
{/if}
<script>
setDataTables("exampleListe");
</script>
<table id="parametre" class="tableaffichage">
<thead>
<tr>
<th>Clé</th>
<th>Libellé</th>
</tr>
</thead><tbody>
{section name=lst loop=$data}
<tr>
<td>
{if $droits["param"] == 1}
<a href="index.php?module=parametreChange&{$tableName}_id={$data[lst].id}">
{$data[lst].id}
</a>
{else}
{$data[lst].id}
{/if}
</td>
<td>{$data[lst].libelle}</td>
</tr>
{/section}
</tbody>
</table>
{/if}
