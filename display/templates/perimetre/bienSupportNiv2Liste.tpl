<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=bienSupportNiv2Change&id=0">{$LANG.gestion.7}</a>
{include file="perimetre/bienSupportNiv2Search.tpl"} 
{if $isSearch == 1}
<a href="index.php?module=bienSupportNiv2Change&id=0">Nouveau bien support de type 2</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>ID de du bien support niv2</th>
			<th>Libellé du bien support niv2</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td style="text-align: center;"><a href="index.php?module=bienSupportNiv2Display&id={$data[lst].bien_support_niv2_id}">
										{$data[lst].bien_support_niv2_id}</a></td>
		<td>{$data[lst].bien_support_niv2_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}