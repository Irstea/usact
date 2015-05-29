<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=conflitChange&id=0">{$LANG.gestion.7}</a>
&nbsp
{include file="conflit/conflitSearch.tpl"} 
{if $isSearch == 1}
<a href="index.php?module=conflitChange&id=0">Nouveau conflit</a>
<table id="idListe" class="tableListe">
	<thead>
		<tr>
			<th>Description</th>
			<th>Date début</th>
			<th>Date fin</th>
			<th>Date saisie</th>			
			<th>Description perimetre</th>			
			<th>Bien_support niv2</th>			
			<th>Type perimetre</th>			
			<th>Echelle perimetre</th>			
			<th>Objet niv2</th>			
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td><a href="index.php?module=conflitDisplay&id={$data[lst].conflit_id}">{$data[lst].conflit_detail}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_debut}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_fin}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_saisie}</td>		
		<td>{$data[lst].perimetre_detail}</td>		
		<td>{$data[lst].bien_support_niv2_libelle}</td>		
		<td>{$data[lst].type_perimetre_libelle}</td>		
		<td>{$data[lst].echelle_libelle}</td>		
		<td>{$data[lst].objet_niv2_libelle}</td>		
	</tr>
	{/section} </tdata>		
</table>
{/if}