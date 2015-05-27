<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=perimetreChange&id=0">{$LANG.gestion.7}</a>
{include file="perimetre/perimetreSearch.tpl"}
{if $isSearch == 1}
<a href="index.php?module=perimetreChange&id=0">Nouveau perimetre</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>Recurrence du périmetre</th>
			<th>Date de saisie du périmetre</th>
			<th>Détail sur le périmetre</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td>{$data[lst].recurrence}</td>
		<td><a href="index.php?module=perimetreDisplay&id={$data[lst].perimetre_id}">{$data[lst].perimetre_date_saisie}</td>
		<td>{$data[lst].perimetre_detail}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}