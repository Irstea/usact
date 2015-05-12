<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=typePerimetreChange&id=0">{$LANG.gestion.7}</a>
{include file="type_perimetre/typePerimetreSearch.tpl"} 
{if $isSearch == 1}
<a href="index.php?module=typePerimetreChange&id=0">Nouveau type de perimetre</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>ID du type de perimetre</th>
			<th>Libellé du type de perimetre</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td style="text-align: center;"><a href="index.php?module=typePerimetreDisplay&id={$data[lst].type_perimetre_id}">
										{$data[lst].type_perimetre_id}</a></td>
		<td>{$data[lst].type_perimetre_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}