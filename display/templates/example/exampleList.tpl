<h2>Liste EXEMPLE</h2>
{if $droits["gestion"] == 1}
<a href="index.php?module=exampleModif&idExample=0">
Nouveau...
</a>
{/if}
<script>
setDataTables("exampleListe");
</script>
<table id="exampleListe" class="tableaffichage">
<thead>
<tr>
<th>Date</th>
<th>Commentaire</th>
<th>Origine</th>
</tr>
</thead><tdata>
{section name=lst loop=$data}
<tr>
<td>
{if $droits["gestion"] == 1}
<a href="index.php?module=exampleModif&idExample={$data[lst].idExample}">
{$data[lst].dateExample}
</a>
{else}
{$data[lst].dateExamplee}
{/if}
</td>
<td>{$data[lst].comment}</td>
</tr>
{/section}
</tdata>
</table>
