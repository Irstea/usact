<script>
$(document).ready(function() { 
var table = setDataTables("articleListe", true, true );
table.fnSort( [ [2,'asc'], [3,'asc'] ] );
});
</script>
<table id="articleListe" class="tableListe">
	<thead>
		<tr>
			<th class="center"><img src="display/images/edit.gif" height="20"></th>
			<th>Journal</th>
			<th>Titre</th>
			<th>Auteur</th>
			<th>Date de parution</th>
			<th>Édition</th>
			<th>Rubrique</th>
			<th>Page</th>
			<th>Entête</th>
			<th>Pièce jointe</th>
		</tr>
	</thead>
	<tbody>
	{section name=lst loop=$article}
	<tr>
	<td class="center">
	<a href="index.php?module=articleDisplay&article_id={$article[lst].article_id}">
	<img src="display/images/edit.gif" height="20">
	{$article[lst].article_id}
	</a>
	</td>
	<td>{$article[lst].journal_libelle}</td>
	<td>{$article[lst].titre}</td>
	<td>{$article[lst].auteur}</td>
	<td>{$article[lst].date_parution}</td>
	<td>{$article[lst].edition}</td>
	<td>{$article[lst].rubrique}</td>
	<td>{$article[lst].page}</td>
	<td>{$article[lst].entete}</td>
	<td>{$article[lst].piecejointe}</td>	
	</tr>
	{/section}
	</tbody>
</table>
<br>