<h2>Echelle :</h2>
<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=echelleChange&echelle_id=0">{$LANG.gestion.7}</a>
{if $isSearch == 1}
<a href="index.php?module=echelleChange&echelle_id=0">Nouvelle echelle</a>
<table id="idListe" class="tableListe">
	<thead>
		<tr>
			<th>Echelle</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td><a href="index.php?module=echelleChange&echelle_id={$data[lst].echelle_id}">{$data[lst].echelle_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}