<h2>Recurrence :</h2>
<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=recurrenceChange&recurrence_id=0">{$LANG.gestion.7}</a>
{if $isSearch == 1}
<a href="index.php?module=recurrenceChange&recurrence_id=0">Nouvelle recurrence</a>
<table id="idListe" class="tableListe">
	<thead>
		<tr>
			<th>Récurrence</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td><a href="index.php?module=recurrenceChange&recurrence_id={$data[lst].recurrence_id}">{$data[lst].recurrence_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}