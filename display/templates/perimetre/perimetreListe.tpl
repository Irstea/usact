<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=perimetreChange&id=0">{$LANG.gestion.7}</a>
{include file="perimetre/perimetreSearch.tpl"}
{if $isSearch == 1}
<a href="index.php?module=perimetreChange&id=0">Nouveau perimetre</a>
<table id="idListe" class="tableListe">
	<thead>
		<tr>
			<th>Descritpion</th>
			<th>Recurrence</th>
			<th>Date de saisie</th>			
			<th>Type</th>
			<th>Echelle</th>
			<th>Bien support niv2</th>
			<th>Objet_niv2</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td><a href="index.php?module=perimetreDisplay&id={$data[lst].perimetre_id}">{$data[lst].perimetre_detail}</td>
		<td style="text-align: center;">{$data[lst].recurrence}</td>
		<td style="text-align: center;">{$data[lst].perimetre_date_saisie}</td>		
		<td>{$data[lst].type_perimetre_libelle}</td>
		<td>{$data[lst].echelle_libelle}</td>
		<td>{$data[lst].bien_support_niv2_libelle}</td>
		<td>{$data[lst].objet_niv2_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}