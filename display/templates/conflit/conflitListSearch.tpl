<script>
$(document).ready(function() { 
	setDataTables("idListe");
});
</script>
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
	<tbody> {section name=lst loop=$conflit}
	<tr>
		<td class="center">
		<a href="index.php?module=conflitDisplay&conflit_id={$conflit[lst].conflit_id}&perimetre_id={$conflit[lst].perimetre_id}">
		<img src="display/images/edit.gif" height="20">
		{$conflit[lst].conflit_id}
		</a>
		</td>
		<td>{$conflit[lst].conflit_date_debut}{$conflit[lst].conflit_date_debut_txt}</td>
		<td>{$conflit[lst].conflit_date_fin}{$conflit[lst].conflit_date_fin_txt}</td>
		<td>{$conflit[lst].type_perimetre_libelle}</td>
		<td>{$conflit[lst].objet_niv1_libelle} - {$conflit[lst].objet_niv2_libelle}</td>
		<td>{$conflit[lst].bien_support_niv1_libelle} - {$conflit[lst].bien_support_niv2_libelle}</td>
		<td>{$conflit[lst].echelle_libelle}</td>
		<td><span class="textareaDisplay">{$conflit[lst].conflit_detail}</span></td>				
	</tr>
	{/section} 
	</tbody>	
		
</table>