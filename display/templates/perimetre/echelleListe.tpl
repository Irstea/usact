<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=echelleChange&id=0">{$LANG.gestion.7}</a>
&nbsp
{if $isSearch == 1}
<a href="index.php?module=echelleChange&id=0">Nouvelle echelle</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>Libellé de l'echelle</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td><a href="index.php?module=echelleDisplay&id={$data[lst].echelle_id}">{$data[lst].echelle_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}