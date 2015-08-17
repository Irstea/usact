<script>
	setDataTables("idListe");
</script>
<h2>Liste des conflits</h2>
{include file="conflit/perimetreSearch.tpl"} 
{if $isSearch == 1}
<table id="idListe" class="tableListe">
	<thead>
		<tr>
			<th class="center"><img src="display/images/edit.gif" height="20"></th>
			<th>Date début</th>
			<th>Date fin</th>
			<th>Type</th>
			<th>Objet</th>
			<th>bien support</th>			
			<th>Échelle</th>
			<th>Détail</th>									
		</tr>
	</thead>
	<tbody> {section name=lst loop=$data}
	<tr>
		<td class="center">
		<a href="index.php?module=conflitDisplay&conflit_id={$conflitData[lst].conflit_id}&perimetre_id={$data.perimetre_id}">
		<img src="display/images/edit.gif" height="20">
		{$conflitData[lst].conflit_id}
		</a>
		</td>
		<td>{$data[lst].conflit_date_debut}{$data[lst].conflit_date_debut_txt}</td>
		<td>{$data[lst].conflit_date_fin}{$data[lst].conflit_date_fin_txt}</td>
		<td>{$data[lst].type_perimetre_libelle}</td>
		<td>{$data[lst].objet_niv1_libelle} - {$data[lst].objet_niv2_libelle}</td>
		<td>{$data[lst].bien_support_niv1_libelle} - {$data[lst].bien_support_niv2_libelle}</td>
		<td>{$data[lst].echelle_libelle}</td>
		<td><span class="textareaDisplay">{$data[lst].conflit_detail}</span></td>				
	</tr>
	{/section} 
	</tbody>	
		
</table>
<br>
{/if}