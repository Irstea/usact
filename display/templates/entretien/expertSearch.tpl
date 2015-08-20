<form id="search" method="GET" action="index.php">
<input type="hidden" name="module" value="expertList">
<input type="hidden" name="isSearch" value="1">
<table id="expertSearch" class="tableaffichage">
<tr>
<td>
Nom ou numéro à rechercher : 
<input name="libelle" class="commentaire" value="{$dataSearch.libelle}">

<input class="submit" type="submit" name="Rechercher..." value="Rechercher" autofocus>

</td>
</tr>

</table>
</form>