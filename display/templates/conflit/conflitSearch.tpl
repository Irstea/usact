<h2>Conflit :</h2>
<table id="conflitSearch" class="tableaffichage">
<form method="GET" action="index.php">
<input type="hidden" name="module" value="conflitListe">
<input type="hidden" name="isSearch" value="1">

<tr>
<td>Objet niv2 :</td>
<td>
<div align="left">
<select id="searchObjetNiv2" name="searchObjetNiv2">
<option value = "" selected>Selectionner ...</option>
{section name=lst loop=$objet_niv2}
{strip}
<option value="{$objet_niv2[lst].objet_niv2_id}"
{if $objet_niv2[lst].objet_niv2_id == $data.objet_niv2_id} selected{/if}
>
{$objet_niv2[lst].objet_niv2_libelle}
</option>{/strip}
{/section}
</select>
</div>
</td>

<tr>
<td>Objet niv1 :</td>
<td>
<div align="left">
<select id="searchObjetNiv1" name="searchObjetNiv1">
<option value = "" selected>Selectionner ...</option>
{section name=lst loop=$objet_niv1}
{strip}
<option value="{$objet_niv1[lst].objet_niv1_id}"
{if $objet_niv1[lst].objet_niv1_id == $data.objet_niv1_id} selected{/if}
>
{$objet_niv1[lst].objet_niv1_libelle}
</option>{/strip}
{/section}
</select>
</div>
</td>
</tr>

<tr>
<td>Bien support niv2 :</td>
<td>
<div align="left">
<select id="searchBienSupportniv2" name="searchBienSupportNiv2">
<option value = "" selected>Selectionner ...</option>
{section name=lst loop=$bien_support_niv2}
{strip}
<option value="{$bien_support_niv2[lst].bien_support_niv2_id}"
{if $bien_support_niv2[lst].bien_support_niv2_id == $data.bien_support_niv2_id} selected{/if}
>
{$bien_support_niv2[lst].bien_support_niv2_libelle}
</option>{/strip}
{/section}
</select>
</div>
</td>
</tr>

<tr>
<td>Bien support niv1 :</td>
<td>
<div align="left">
<select id="searchBienSupportNiv1" name="searchBienSupportNiv1">
<option value = "">Selectionner ...</option>
{section name=lst loop=$bien_support_niv1}
{strip}
<option value="{$bien_support_niv1[lst].bien_support_niv1_id}"
{if $bien_support_niv1[lst].bien_support_niv1_id == $data.bien_support_niv1_id} selected="selected" {/if}
>
{$bien_support_niv1[lst].bien_support_niv1_libelle}
</option>{/strip}
{/section}
</select>
</div>
</td>
</tr>

<tr>
<td>Année début du conflit :</td>
<td>
<div align="left">
<select id="searchAnneeDebut" name="searchAnneeDebut">
<option value = "" selected>Selectionner ...</option>
{section name=lst loop=$perimetre}
{strip}
<option value="{$conflit[lst].conflit_id}"
{if $conflit[lst].conflit_id == $data.conflit_id} selected {/if}>
{$conflit[lst].annee}
</option>{/strip}
{/section}
</select>
</div>
</td>
</tr>

<tr>
<td colspan=2>
<div style="text-align:center;" class="formBouton">
<input class="submit" type="submit" name="Rechercher..." value="Rechercher">
</td>
</form>
</div>
</td>
</tr>
</div>
</table>

