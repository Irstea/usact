<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=objetNiv1Change&id=0">{$LANG.gestion.7}</a>
{include file="perimetre/objetNiv1Search.tpl"} 
{if $isSearch == 1}
<a href="index.php?module=objetNiv1Change&id=0">Nouveau objet de type 1</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>ID du type de perimetre</th>
			<th>Libellé du type de perimetre</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td style="text-align: center;"><a href="index.php?module=objetNiv1Display&id={$data[lst].objet_niv1_id}">
										{$data[lst].objet_niv1_id}</a></td>
		<td>{$data[lst].objet_niv1_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}