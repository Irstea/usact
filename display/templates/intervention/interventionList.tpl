<script>
$(document).ready(function() { 
var table = setDataTables("interventionListe", true, true );
table.fnSort( [ [2,'asc'], [1,'asc'] ] );
});
</script>
<table id="interventionListe" class="tableListe">
	<thead>
		<tr>
			<th class="center"><img src="display/images/edit.gif" height="20"></th>
			<th>Acteur</th>
			<th>Conflit</th>
			<th>Activité d'usage</th>
			<th>Position</th>
			<th>Date d'entrée</th>
			<th>Date de sortie</th>
			<th>Détail</th>
		</tr>
	</thead>
	<tbody>
	{section name=lst loop=$intervention}
	<tr>
	<td class="center">
	<a href="index.php?module=interventionDisplay&intervention_id={$intervention[lst].intervention_id}">
	<img src="display/images/edit.gif" height="20">
	{$intervention[lst].intervention_id}
	</a>
	</td>
	<td>
	{$intervention[lst].acteur_physique_nom} {$intervention[lst].acteur_moral_nom}
	</td>
	<td>
	{$intervention[lst].conflit_detail}
	</td>
	<td>
	{$intervention[lst].usage_activite_niv1_libelle} - {$intervention[lst].usage_activit_niv2_libelle}
	</td>
	<td>
	{$intervention[lst].intervention_date_entree}{$intervention[lst].intervention_date_entree_txt}
	</td>
	<td>
	{$intervention[lst].intervention_date_sortie}{$intervention[lst].intervention_date_sortie_txt}
	</td>
	<td><span class="textareaDisplay">{$intervention[lst].intervention_detail_usage}</span></td>
	</tr>
	{/section}
	</tbody>
</table>
<br>