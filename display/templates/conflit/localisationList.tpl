<fieldset>
<legend>Localisation</legend>
{if $droits.gestion == 1}
<a href="index.php?module=localisationChange&localisation_id=0&perimetre_id={$perimetre.perimetre_id}">
Rattacher une nouvelle localisation...
</a>
{/if}
<table  class="tableListe">
	<thead>
		<tr>
		<th>Commune</th>
		<th>Adresse</th>
		</tr>
	</thead>
	<tbody>
	{section name=lst loop=$localisation}
	<tr>
	<td>
	{if $droits.gestion == 1}
	<a href="index.php?module=localisationChange&localisation_id={$localisation[lst].localisation_id}&perimetre_id={$perimetre.perimetre_id}">
	{$localisation[lst].commune_insee} {$localisation[lst].commune_nom}
	</a>
	{else}
	{$localisation[lst].commune_insee} {$localisation[lst].commune_nom}
	{/if}
	</td>
	<td class="textareaDisplay">{$localisation[lst].precision_adresse}</td>
	</tr>
	{/section}
	</tbody>
</table>
		
</fieldset>