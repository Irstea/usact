<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=objetNiv1Change&id=0">{$LANG.gestion.7}</a>
{if $isSearch == 1}
<a href="index.php?module=objetNiv1Change&id=0">Nouveau objet de niveau 1</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>Libellé de l'objet niv1</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td><a href="index.php?module=objetNiv1Display&id={$data[lst].objet_niv1_id}">{$data[lst].objet_niv1_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}