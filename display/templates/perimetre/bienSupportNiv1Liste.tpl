<h2>Bien support niv1 :</h2>
<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=bienSupportNiv1Change&id=0">{$LANG.gestion.7}</a>
{if $isSearch == 1}
<a href="index.php?module=bienSupportNiv1Change&id=0">Nouveau bien support de niveau 1</a>
<table id="idListe" class="tableListe">
	<thead>
		<tr>
			<th>Bien support niv1</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td><a href="index.php?module=bienSupportNiv1Change&id={$data[lst].bien_support_niv1_id}">{$data[lst].bien_support_niv1_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}