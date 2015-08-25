<script>
$(document).ready(function() { 
	$(".selection").change(function () {
		$("#search").submit();
	} );
} ) ;
</script>

<form id="search" method="GET" action="index.php">
<input type="hidden" name="module" value="{$conflit_table}List">
<input type="hidden" name="isSearch" value="1">

<table id="resolutionSearch" class="tableaffichage">


<tr>
<td>
Texte ou numéro à rechercher : 
<input name="libelle" class="commentaire" value="{$dataSearch.libelle}">
<br>
Échelle spatiale :

<select class="selection" id="resolution_echelle_id" name="resolution_echelle_id">
<option value = "" {if $dataSearch.resolution_echelle_id == ""}selected{/if}>
{section name=lst loop=$resolution_echelle}
{strip}
<option value="{$resolution_echelle[lst].resolution_echelle_id}"
{if $resolution_echelle[lst].resolution_echelle_id == $dataSearch.resolution_echelle_id} selected{/if}
>
{$resolution_echelle[lst].resolution_echelle_libelle}
</option>{/strip}
{/section}
</select>
<br>
Niveau d'acteur :
<select class="selection" id="resolution_acteur_id" name="resolution_acteur_id">
<option value = "" {if $dataSearch.resolution_acteur_id == ""}selected{/if}>
{section name=lst loop=$resolution_acteur}
{strip}
<option value="{$resolution_acteur[lst].resolution_acteur_id}"
{if $resolution_acteur[lst].resolution_acteur_id == $dataSearch.resolution_acteur_id} selected{/if}
>
{$resolution_acteur[lst].resolution_acteur_libelle}
</option>{/strip}
{/section}
</select>
<br>
Nature de la résolution :
<select class="selection" id="resolution_nature_id" name="resolution_nature_id">
<option value = "" {if $dataSearch.resolution_nature_id == ""}selected{/if}>
{section name=lst loop=$resolution_nature}
{strip}
<option value="{$resolution_nature[lst].resolution_nature_id}"
{if $resolution_nature[lst].resolution_nature_id == $dataSearch.resolution_nature_id} selected{/if}
>
{$resolution_nature[lst].resolution_nature_libelle}
</option>{/strip}
{/section}
</select>
<br>
Modalité :
<select class="selection" id="resolution_mode_niv2_id" name="resolution_mode_niv2_id">
<option value = "" {if $dataSearch.resolution_mode_niv2_id == ""}selected{/if}>
{section name=lst loop=$resolution_mode_niv2}
{strip}
<option value="{$resolution_mode_niv2[lst].resolution_mode_niv2_id}"
{if $resolution_mode_niv2[lst].resolution_mode_niv2_id == $dataSearch.resolution_mode_niv2_id} selected{/if}
>
{$resolution_mode_niv2[lst].resolution_mode_niv1_libelle} -{$resolution_mode_niv2[lst].resolution_mode_niv2_libelle} 
</option>{/strip}
{/section}
</select>
<br>

<input class="submit" type="submit" name="Rechercher..." value="Rechercher" autofocus>

</td>
</tr>

</table>
</form>