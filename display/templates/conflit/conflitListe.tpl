<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=conflitChange&id=0">{$LANG.gestion.7}</a>
&nbsp
{include file="conflit/conflitSearch.tpl"} 
{if $isSearch == 1}
<a href="index.php?module=conflitChange&id=0">Nouveau conflit</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>Date début conflit</th>
			<th>Date fin conflit</th>
			<th>Date saisie conflit</th>
			<th>Détail du conflit</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td style="text-align: center;"><a href="index.php?module=conflitDisplay&id={$data[lst].conflit_id}">
										{$data[lst].conflit_date_debut}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_fin}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_saisie}</td>
		<td>{$data[lst].conflit_detail}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}