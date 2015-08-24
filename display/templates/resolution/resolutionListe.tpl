<script>
$(document).ready(function() { 
	setDataTables("idListe");
} );
</script>
<table id="idListe" class="tableListe">
	<thead>
		<tr>
			<th class="center">
			<img src="display/images/edit.gif" height="20">
			</th>
			<th>Solution<br>proposée</th>
			<th>Conflit</th>
			<th>Échelle</th>
			<th>Niveau d'acteur</th>
			<th>Nature</th>			
			<th>Mode</th>						
			<th>Détails</th>			
		</tr>
	</thead>
	<tbody> {section name=lst loop=$resolution}
	<tr>
		<td class="center">
		<a href="index.php?module=resolutionDisplay&resolution_id={$resolution[lst].resolution_id}">
			<img src="display/images/edit.gif" height="20">
			{$resolution[lst].resolution_id}
		</a>
		</td>
		<td class="center">
		{if $resolution[lst].solution_proposee_id > 0}
		<a href="index.php?module=solutionProposeeDisplay&solution_proposee_id={$resolution[lst].solution_proposee_id}">
		{$resolution[lst].solution_proposee_id}
		</a>
		{/if}
		</td>
		<td>
		<a href="index.php?module=conflitDisplay&conflit_id={$resolution[lst].conflit_id}">
		{$resolution[lst]conflit_id} {$resolution[lst].type_perimetre_libelle}
		<br>
		{$resolution[lst].objet_niv1_libelle} {$resolution[lst].objet_niv2_libelle}
		</a>
		</td>
		<td>{$resolution[lst].resolution_echelle_libelle}</td>
		<td>{$resolution[lst].resolution_acteur_libelle}</td>
		<td>{$resolution[lst].resolution_nature_libelle}</td>
		<td>{$resolution[lst].resolution_mod_niv1_libelle}<br>
		{$resolution[lst].resolution_mod_niv2_libelle}</td>
		<td><span class="textareaDisplay">{$resolution[lst].resolution_detail}</span></td>			
	</tr>
	{/section} 
	</tbody>		
</table>
{/if}
<br>