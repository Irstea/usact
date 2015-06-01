<h2>Objet niv2 :</h2>
<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=objetNiv2Change&objet_niv2_id=0">{$LANG.gestion.7}</a>
{if $isSearch == 1}
<a href="index.php?module=objetNiv2Change&objet_niv2_id=0">Nouveau objet de niveau 2</a>
<table id="idListe" class="tableListe">
	<thead>
		<tr>
			<th>Objet niv2</th>
			<th>Objet niv1</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td><a href="index.php?module=objetNiv2Change&objet_niv2_id={$data[lst].objet_niv2_id}">{$data[lst].objet_niv2_libelle}</td>
		<td>{$data[lst].objet_niv1_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}