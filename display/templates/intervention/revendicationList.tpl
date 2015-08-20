<table id="revendicationListe" class="tableListe">
	<thead>
		<tr>
			<th class="center"><img src="display/images/edit.gif" height="20"></th>
			<th>Revendication</th>
			<th>Argument</th>
			<th>Support</th>
			<th>Détail</th>
		</tr>
	</thead>
	<tbody>
		{section name=lst loop=$revendication}
		<tr>
			<td class="center">
			{if $droits.gestion == 1}
			<a href="index.php?module=revendicationChange&revendication_id={$revendication[lst].revendication_id}">
			{$revendication[lst].revendication_id}
			</a>
			{else}
			{$revendication[lst].revendication_id}
			{/if}
			</td>
			<td>{$revendication[lst].revendication_niv1_libelle} {$revendication[lst].revendication_niv2_libelle}</td>
			<td>{$revendication[lst].registre_argument_niv1_libelle} {$revendication[lst].registre_argument_niv2_libelle}</td>
			<td>{$revendication[lst].revend_support_niv1_libelle} {$revendication[lst].revend_support_niv2_libelle}</td>
			<td><span class="textareaDisplay">{$revendication[lst].revendication_detail}</span></td>
		</tr>
		{/section}
	</tbody>
</table>