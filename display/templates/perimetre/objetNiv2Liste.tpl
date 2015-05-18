<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=objetNiv2Change&id=0">{$LANG.gestion.7}</a>
{include file="perimetre/objetNiv2Search.tpl"} 
{if $isSearch == 1}
<a href="index.php?module=objetNiv2Change&id=0">Nouveau objet de type 2</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>ID de l'objet niv2</th>
			<th>Libellé de l'objet niv2</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td style="text-align: center;"><a href="index.php?module=objetNiv2Display&id={$data[lst].objet_niv2_id}">
										{$data[lst].objet_niv2_id}</a></td>
		<td>{$data[lst].objet_niv2_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}