<table id="actionListe" class="tableListe">
	<thead>
		<tr>
			<th class="center"><img src="display/images/edit.gif" height="20"></th>
			<th>Type</th>
			<th>Mode</th>
			<th>Échelle</th>
			<th>Date</th>
			<th>Détail</th>
		</tr>
	</thead>
	<tbody>
		{section name=lst loop=$action}
		<tr>
			<td class="center">
			{if $droits.gestion == 1}
			<a href="index.php?module=actionChange&action_id={$action[lst].action_id}">
			{$action[lst].action_id}
			</a>
			{else}
			{$action[lst].action_id}
			{/if}
			</td>
			<td>{$action[lst].action_type_libelle}</td>
			<td>{$action[lst].action_mode_libelle}</td>
			<td>{$action[lst].action_echelle_libelle}</td>
			<td>{$action[lst].action_date}{$action[lst].action_date_complement}</td>
			<td><span class="textareaDisplay">{$action[lst].action_detail}</span></td>
		</tr>
		{/section}
	</tbody>
</table>