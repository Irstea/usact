<script>
$(document).ready(function() { 
var table = setDataTables("juridiqueListe", true, true );
table.fnSort( [ [2,'asc'], [1,'asc'] ] );
});
</script>
<table id="juridiqueListe" class="tableListe">
	<thead>
		<tr>
			<th class="center"><img src="display/images/edit.gif" height="20"></th>
			<th>Arrêt-num<br>Date</th>
			<th>Domaine</th>
			<th>Nature de<br>la requête</th>
			<th>Ouvrage<br>permis de construire</th>
			<th>Nature des<br>travaux</th>
			<th>Décision<br>appel</th>
			<th>Décision<br>cassation</th>
			<th>Contentieux</th>
			<th>Détail</th>
			<th>Articles</th>
			<th>Jugement<br>degré 1</th>
			<th>Jugement<br>degré 2</th>
		</tr>
	</thead>
	<tbody>
	{section name=lst loop=$juridique}
	<tr>
	<td class="center">
	<a href="index.php?module=juridiqueDisplay&juridique_id={$juridique[lst].juridique_id}">
	<img src="display/images/edit.gif" height="20">
	{$juridique[lst].juridique_id}
	</a>
	<td>{$juridique[lst].arret_num}<br>{$juridique[lst].arret_date}</td>
	
	<td>{$juridique[lst].juridique_domaine_libelle}<br>{$juridique[lst].juridique_sous_domaine_libelle}</td>
	<td>{$juridique[lst].nature_requete_libelle}</td>
	
	<td>{$juridique[lst].type_ouvrage_perm_constr_libelle}</td>
	<td>{$juridique[lst].nature_travaux_libelle}</td>
	<td>{$juridique[lst].decision_appel_libelle}</td>
	<td>{$juridique[lst].decision_cassation_libelle}</td>
	<td>{$juridique[lst].acte_contentieux_libelle}<br>
		{$juridique[lst].acte_date}</td>
	
	<td><span class="textareaDisplay">{$juridique[lst].juridique_libelle}
	<br>{$juridique[lst].objet_precision}</span></td>
	<td>{$juridique[lst].article1}
	{if strlen($juridique[lst].article2) > 0}
	<br>{$juridique[lst].article2}
	{/if}
	{if strlen($juridique[lst].article3) > 0}
	<br>{$juridique[lst].article3}
	{/if}
	{if strlen($juridique[lst].article4) > 0}
	<br>{$juridique[lst].article4}
	{/if}
	{if strlen($juridique[lst].article5) > 0}
	<br>{$juridique[lst].article5}
	{/if}
	</td>
	<td>{$juridique[lst].jugement_date_degre1}</td>
	<td>{$juridique[lst].jugement_date_degre2}</td>
	</tr>
	{/section}
	</tbody>
</table>
	