<script>
$(document).ready(function() { 
	$(".selection").change(function () {
		$("#search").submit();
	} );
} ) ;
</script>

<form id="search" method="GET" action="index.php">
<table id="acteurSearch" class="tableaffichage">

<input type="hidden" name="module" value="acteurList">
<input type="hidden" name="isSearch" value="1">

<tr>
<td>
Texte ou numéro à rechercher : 
<input name="libelle" class="commentaire" value="{$dataSearch.libelle}">
<br>
Niveau d'acteur :
<select class="selection" id="acteur_niv3_id" name="acteur_niv3_id">
<option value = "" {if $dataSearch.acteur_niv_3_id == ""}selected{/if}>
{section name=lst loop=$acteur_niv3}
{strip}
<option value="{$acteur_niv3[lst].acteur_niv3_id}"
{if $acteur_niv3[lst].acteur_niv3_id == $dataSearch.acteur_niv3_id} selected{/if}
>
{$acteur_niv3[lst].acteur_niv1_libelle} - 
{$acteur_niv3[lst].acteur_niv2_libelle} - {$acteur_niv3[lst].acteur_niv3_libelle}
</option>{/strip}
{/section}
</select>
<br>
Type de structure :

<select class="selection" id="structure_type_id" name="structure_type_id">
<option value = "" {if $dataSearch.structure_type_id == ""}selected{/if}></option>
{section name=lst loop=$structure_type}
{strip}
<option value="{$structure_type[lst].structure_type_id}"
{if $structure_type[lst].structure_type_id == $dataSearch.structure_type_id}selected{/if}>
{$structure_type[lst].structure_type_libelle}
</option>{/strip}
{/section}
</select>

Type de mandat : 
<select class="selection" name="type_mandat_id">
<option value="" {if $dataSearch.type_mandat_id == ""}selected{/if}></option>
{section name=lst loop=$type_mandat}
<option value="{$type_mandat[lst].type_mandat_id}" {if $type_mandat[lst].type_mandat_id == $dataSearch.type_mandat_id}selected{/if}>
{$type_mandat[lst].type_mandat_libelle}
</option>
{/section}
</select>

<input class="submit" type="submit" name="Rechercher..." value="Rechercher" autofocus>

</td>
</tr>

</table>
</form>