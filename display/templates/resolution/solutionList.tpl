<script>
$(document).ready(function() { 
	setDataTables("solutionListe");
} );
</script>
<table id="solutionListe" class="tableListe">
	<thead>
		<tr>
			<th class="center">
			<img src="display/images/edit.gif" height="20">
			</th>
			<th>Acteur</th>
			<th>Solution proposée</th>
		</tr>
	</thead>
	<tbody>
	{section name=lst loop=$solution_proposee}
		<tr>
			<td>
			{if $droits.gestion == 1}
			<a href="index.php?module=solutionChange&solution_proposee_id={$solution_proposee[lst].solution_proposee_id}">
			<img src="display/images/edit.gif" height="20">{$solution_proposee[lst].solution_proposee_id}
			</a>
			{else}
			<img src="display/images/edit.gif" height="20">{$solution_proposee[lst].solution_proposee_id}
			{/if}
			</td>
			<td>{$solution_proposee[lst].acteur_moral_nom} {$solution_proposee[lst].acteur_physique_nom}</td>
			<td><span class="textareaDisplay">{$solution_proposee[lst].solution_proposee_libelle}</span></td>
		</tr>
	{/section}
	</tbody>
</table>