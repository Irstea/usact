<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=bienSupportNiv2Change&id=0">{$LANG.gestion.7}</a>
{if $isSearch == 1}
<a href="index.php?module=bienSupportNiv2Change&id=0">Nouveau bien support de niveau 2</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>Bien support niv2</th>
			<th>Bien support niv1</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td><a href="index.php?module=bienSupportNiv2Display&id={$data[lst].bien_support_niv2_id}">{$data[lst].bien_support_niv2_libelle}</td>
		<td>{$data[lst].bien_support_niv1_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}