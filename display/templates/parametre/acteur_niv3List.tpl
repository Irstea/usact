<h2>Contenu de la table de paramètres : acteur_niv3</h2>
{if $droits["param"] == 1}
<a href="index.php?module=acteur_niv3Change&acteur_niv3_id=0">
Nouveau...
</a>
{/if}
<script>
setDataTables("parametre_niv3");
</script>
<table id="parametre_niv3" class="tableaffichage">
<thead>
<tr>
<th>Clé</th>
<th>Niveau 1</th>
<th>Niveau 2</th>
<th>Niveau 3</th>
</tr>
</thead><tbody>
{section name=lst loop=$data}
<tr>
<td>
{if $droits["param"] == 1}
<a href="index.php?module=acteur_niv3Change&acteur_niv3_id={$data[lst].acteur_niv3_id}">
{$data[lst].acteur_niv3_id}
</a>
{else}
{$data[lst].acteur_niv3_id}
{/if}
</td>
<td>{$data[lst].acteur_niv1_libelle}</td>
<td>{$data[lst].acteur_niv2_libelle}</td>
<td>{$data[lst].acteur_niv3_libelle}</td>
</tr>
{/section}
</tbody>
</table>
<br>