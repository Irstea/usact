<script>
$(document).ready(function() { 
	$(".selection").change(function () {
		$("#search").submit();
	} );
} ) ;
</script>
<form id="search" method="GET" action="index.php">
<input type="hidden" name="module" value="articleList">
<input type="hidden" name="isSearch" value="1">
<table id="articleSearch" class="tableaffichage">
<tr>
<td>
Titre ou auteur à rechercher : 
<input name="libelle" class="commentaire" value="{$dataSearch.libelle}">
<br>
Journal :
<select class="selection" name="journal_id">
<option value="" {if $dataSearch.journal_id == ""}selected{/if}>
{section name=lst loop=$journal}
<option value="{$journal[lst].journal_id}" {if $dataSearch.journal_id == $journal[lst].journal_id}selected{/if}>
{$journal[lst].journal_libelle}
</option>
{/section}
</select>

<input class="submit" type="submit" name="Rechercher..." value="Rechercher" autofocus>

</td>
</tr>

</table>
</form>