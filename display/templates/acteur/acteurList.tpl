<script>
$(document).ready(function() { 
var table = setDataTables("acteurListe", true, true );
table.fnSort( [ [2,'asc'], [1,'asc'] ] );
});
</script>
<table id="acteurListe" class="tableListe">
	<thead>
		<tr>
			<th class="center"><img src="display/images/edit.gif" height="20"></th>
			<th>Personne<br>physique</th>
			<th>Personne<br>morale</th>
			<th>Type</th>
			<th>Statut</th>
			<th>Statut détaillé</th>
			<th>Type de résidence<br>particulier</th>								
		</tr>
	</thead>
	<tbody> 
	{section name=lst loop=$data}
	<tr>
		<td class="center">
		<a href="index.php?module=acteurDisplay&acteur_id={$data[lst].acteur_id}">
		<img src="display/images/edit.gif" height="20">
		{$data[lst].acteur_id}
		</a>
		</td>
		<td>{$data[lst].acteur_physique_nom}
		{if strlen($data[lst].commune_physique) > 0}
		<br>{$data[lst].commune_physique} ({$data[lst].cp_physique})
		{/if}
		</td>
		<td>{$data[lst].acteur_moral_nom}
		{if strlen($data[lst].commune_morale) > 0}
		<br>{$data[lst].commune_morale} ({$data[lst].cp_morale})
		{/if}
		</td>
		<td>{$data[lst].acteur_niv1_libelle} - 
		{$data[lst].acteur_niv2_libelle} - 
		{$data[lst].acteur_niv3_libelle}
		</td>
		<td>
		{$data[lst].acteur_statut}
		</td>
		<td>
		<span class="textareaDisplay">{$data[lst].acteur_statut_detail}</span>
		</td>
		<td>{$data[lst].particulier_resident_type_libelle}</td>
	</tr>
	{/section}
	</tbody>
</table>
<br>