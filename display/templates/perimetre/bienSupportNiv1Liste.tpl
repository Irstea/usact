<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=bienSupportNiv1Change&id=0">{$LANG.gestion.7}</a>
{include file="perimetre/bienSupportNiv1Search.tpl"} 
{if $isSearch == 1}
<a href="index.php?module=bienSupportNiv1Change&id=0">Nouveau bien de support de type 1</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>ID du bien de support niv1 </th>
			<th>Libellé du bien de support niv1</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td style="text-align: center;"><a href="index.php?module=bienSupportNiv1Display&id={$data[lst].bien_support_niv1_id}">
										{$data[lst].bien_support_niv1_id}</a></td>
		<td>{$data[lst].bien_support_niv1_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}