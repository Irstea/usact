<table id="echelleSearch" class="tableaffichage">
<form method="GET" action="index.php">
<input type="hidden" name="module" value="echelleListe">
<input type="hidden" name="isSearch" value="1">
<tr>
<td>
ID à rechercher :
<input name="searchId" value="{$echelleSearch.searchId}" maxlength="50" size="30" autofocus>
<br>
<br>
<div style="text-align:center;">
<input type="submit" name="Rechercher...">
</div>
</td>
</tr>
</form>
</table>