<h2>Liste des experts</h2>
{include file="entretien/expertSearch.tpl"}
{if $isSearch == 1}
<script>
$(document).ready(function() { 
var table = setDataTables("expertListe", true, true );
table.fnSort( [ [1,'asc'] ] );
});
</script>

{if $droits.gestion == 1}
<a href="index.php?module=expertChange&expert_id=0">Nouvel expert...</a>
{/if}
<table id="expertListe" class="tableListe">
	<thead>
		<tr>
			<th class="center"><img src="display/images/edit.gif" height="20"></th>
			<th>Nom - prénom</th>
			<th>Sexe</th>
			<th>Commune de<br>résidence</th>
			<th>Lien avec le<br>territoire</th>
			<th>Activité<br>professionnelle</th>
			<th>Activité<br>associative</th>
			<th>Année de<br>naissance</th>
		</tr>
	</thead>
	<tbody>
	{section name=lst loop=$expert}
		<tr>
			<td class="center">
			<a href="index.php?module=expertDisplay&expert_id={$expert[lst].expert_id}">
			<img src="display/images/edit.gif" height="20">
			{$expert[lst].expert_id}
			</a>
			</td>
			<td>{$expert[lst].expert_nom} {$expert[lst].expert_prenom}</td>
			<td class="center">{$expert[lst].sexe}</td>
			<td>{$expert[lst].commune_residence}</td>
			<td><span class="textareaDisplay">{$expert[lst].lien_territoire}</span></td>
			<td>{$expert[lst].activite_prof}</td>
			<td>{$expert[lst].activite_assoc}</td>
			<td>{$expert[lst].annee_naissance}</td>
		</tr>
	{/section}
	</tbody>
</table>
<br>
{/if}