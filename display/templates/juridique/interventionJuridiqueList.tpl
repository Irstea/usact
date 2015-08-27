<table id="intervention_juridiqueListe" class="tableListe">
	<thead>
		<tr>
			<th class="center"><img src="display/images/edit.gif" height="20"></th>
			<th>Acte juridique</th>
			<th>Inervention : acteur</th>
			<th>Position<br>de l'acteur</th>
			<th>Pétitionnaire ?</th>
			<th>Qualité<br>(appel)</th>
			<th>Qualité<br>(pourvoi)</th>
		</tr>
	</thead>
	<tbody>
		{section name=lst loop=$intervention_juridique}
		<tr>
			<td class="center">
			{if $droits.gestion == 1}
			<a href="index.php?module=intervention_juridiqueChange&intervention_juridique_id={$intervention_juridique[lst].intervention_juridique_id}">
			{$intervention_juridique[lst].intervention_juridique_id}
			</a>
			{else}
			{$intervention_juridique[lst].intervention_juridique_id}
			{/if}
			</td>
			<td>
			<a href="index.php?module=juridiqueDisplay&juridique_id={$intervention_juridique[lst].juridique_id}">
			{$intervention_juridique[lst].juridique_id}
			&nbsp;
			{$intervention_juridique[lst].juridiction_libelle}<br>
			{$intervention_juridique[lst].arret_num} - {$intervention_juridique[lst].arret_date}
			</a>
			</td>
			<td><a href="index.php?module=interventionDisplay&intervention_id={$intervention_juridique[lst].intervention_id}">
			{$intervention_juridique[lst].intervention_id} : {$intervention_juridique[lst].acteur_moral_nom}<br>{$intervention_juridique[lst].acteur_physique_nom}
			</a>
			</td>
			<td>{$intervention_juridique[lst].position_acteur_libelle}</td>
			<td class="center">
			{if $intervention_juridique[lst].petitionnaire == 1}oui{else}non{/if}
			</td>
			<td>{$intervention_juridique[lst].qualite_appel_libelle}</td>
			<td>{$intervention_juridique[lst].qualite_pourvoi_libelle}</td>
		</tr>
		{/section}
	</tbody>
</table>	