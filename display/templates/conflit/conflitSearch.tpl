
<form method="GET" action="index.php">
<input type="hidden" name="module" value="conflitListe">
<input type="hidden" name="isSearch" value="1">
<dl>
	<dt>
		ID à rechercher :
		<input name="searchId" value="{$conflitSearch.searchId}" maxlength="50" size="30" autofocus>
		<br>
		<br>
		<div style="text-align:center;">
		<input type="submit" name="Rechercher...">
		</div>
	</dt>
</dl>
</form>

