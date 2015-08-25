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
Juridiction :
<select class="selection" id="juridiction_id" name="juridiction_id">
<option value = "" {if $dataSearch.juridiction_id == ""}selected{/if}>
{section name=lst loop=$juridiction}
{strip}
<option value="{$juridiction[lst].juridiction_id}"
{if $juridiction[lst].juridiction_id == $dataSearch.juridiction_id} selected{/if}
>
{$juridiction[lst].juridiction_libelle}
</option>{/strip}
{/section}
</select>
<br>
Domaine / sous-domaine : 
<select class="selection" id="juridique_sous_domaine_id" name="juridique_sous_domaine_id">
<option value = "" {if $dataSearch.juridique_sous_domaine_id == ""}selected{/if}>
{section name=lst loop=$juridique_sous_domaine}
{strip}
<option value="{$juridique_sous_domaine[lst].juridique_sous_domaine_id}"
{if $juridique_sous_domaine[lst].juridique_sous_domaine_id == $dataSearch.juridique_sous_domaine_id} selected{/if}
>
{$juridique_sous_domaine[lst].juridique_domaine_libelle} {$juridique_sous_domaine[lst].juridique_sous_domaine_libelle}
</option>{/strip}
{/section}
</select>
<br>
Nature de la requête : 
<select class="selection" id="nature_requete_id" name="nature_requete_id">
<option value = "" {if $dataSearch.nature_requete_id == ""}selected{/if}>
{section name=lst loop=$nature_requete}
{strip}
<option value="{$nature_requete[lst].nature_requete_id}"
{if $nature_requete[lst].nature_requete_id == $dataSearch.nature_requete_id} selected{/if}
>
{$nature_requete[lst].nature_requete_libelle}
</option>{/strip}
{/section}
</select>
<br>

nature des travaux :
<select class="selection" id="nature_travaux_id" name="nature_travaux_id">
<option value = "" {if $dataSearch.nature_travaux_id == ""}selected{/if}>
{section name=lst loop=$nature_travaux}
{strip}
<option value="{$nature_travaux[lst].nature_travaux_id}"
{if $nature_travaux[lst].nature_travaux_id == $dataSearch.nature_travaux_id} selected{/if}
>
{$nature_travaux[lst].nature_travaux_libelle}
</option>{/strip}
{/section}
</select>

<input class="submit" type="submit" name="Rechercher..." value="Rechercher" autofocus>
</td>
</tr>
</table>
</form>
