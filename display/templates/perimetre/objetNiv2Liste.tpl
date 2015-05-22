<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=objetNiv2Change&id=0">{$LANG.gestion.7}</a>
&nbsp 
{if $isSearch == 1}
<a href="index.php?module=objetNiv2Change&id=0">Nouveau objet de niveau 2</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>Libellé de l'objet niv2</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td><a href="index.php?module=objetNiv2Display&id={$data[lst].objet_niv2_id}">{$data[lst].objet_niv2_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}