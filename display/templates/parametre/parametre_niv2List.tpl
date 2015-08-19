<h2>Contenu de la table de paramètres : {$tableName}</h2>
{if $droits["param"] == 1}
<a href="index.php?module={$tableName}Change&{$tableName}_id=0">
Nouveau...
</a>
{/if}
<script>
$(document).ready(function() { 
setDataTables("parametre_niv2");
} );
</script>
<table id="parametre_niv2" class="tableaffichage">
<thead>
<tr>
<th>Clé</th>
<th>Niveau 1</th>
<th>Niveau 2</th>
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
<td>{$data[lst].parent_libelle}</td>
<td>{$data[lst].libelle}</td>
</tr>
{/section}
</tbody>
</table>
<br>
