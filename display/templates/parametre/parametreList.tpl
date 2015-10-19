<h2>Contenu de la table de paramètres : {$tableName}</h2>
{if $droits["param"] == 1}
<a href="index.php?module={$tableName}Change&{$tableName}_id=0">
Nouveau...
</a>
{/if}
<script>
$(document).ready(function() { 
setDataTables("parametre", true, true);
} );
</script>
<table id="parametre" class="tableaffichage">
<thead>
<tr>
<th>Clé</th>
<th>Libellé</th>
{if strlen($colonneSupp) > 0}
<th>{$colonneSupp}</th>
{/if}
</tr>
</thead><tbody>
{section name=lst loop=$data}
<tr>
<td>
{if $droits["param"] == 1}
<a href="index.php?module={$tableName}Change&{$tableName}_id={$data[lst].id}">
{$data[lst].id}
</a>
{else}
{$data[lst].id}
{/if}
</td>
<td>{$data[lst].libelle}</td>
{if strlen($colonneSupp) > 0}
<td>{$data[lst].selectfield}</td>
{/if}
</tr>
{/section}
</tbody>
</table>
<br>
