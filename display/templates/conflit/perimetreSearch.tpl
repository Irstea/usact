<form method="GET" action="index.php">
<table id="perimetreSearch" class="tableaffichage">

<input type="hidden" name="module" value="perimetreList">
<input type="hidden" name="isSearch" value="1">

<tr>
<td>
Texte ou numéro à rechercher : 
<input name="libelle" class="commentaire" value="{$dataSearch.libelle}">
<br>
Objets :

<select id="objet_niv2_id" name="objet_niv2_id">
<option value = "" {if $dataSearch.objet_niv2_id == ""}selected{/if}>
{section name=lst loop=$objet_niv2}
{strip}
<option value="{$objet_niv2[lst].objet_niv2_id}"
{if $objet_niv2[lst].objet_niv2_id == $dataSearch.objet_niv2_id} selected{/if}
>
{$objet_niv2[lst].objet_niv1_libelle} - {$objet_niv2[lst].objet_niv2_libelle}
</option>{/strip}
{/section}
</select>
<br>
Biens supports :

<select id="bien_support_niv2_id" name="bien_support_niv2_id">
<option value = "" {if $dataSearch.bien_support_niv2_id == ""}selected{/if}></option>
{section name=lst loop=$bien_support_niv2}
{strip}
<option value="{$bien_support_niv2[lst].bien_support_niv2_id}"
{if $bien_support_niv2[lst].bien_support_niv2_id == $dataSearch.bien_support_niv2_id}selected{/if}>
{$bien_support_niv2[lst].bien_support_niv1_libelle} - {$bien_support_niv2[lst].bien_support_niv2_libelle}
</option>{/strip}
{/section}
</select>
<br>
Type de périmètre : 
<select name="type_perimetre_id">
<option value="" {if $dataSearch.type_perimetre_id == ""}selected{/if}></option>
{section name=lst loop=$type_perimetre}
<option value="{$type_perimetre[lst].type_perimetre_id}" {if $type_perimetre[lst].type_perimetre_id == $dataSearch.type_perimetre_id}selected{/if}>
{$type_perimetre[lst].type_perimetre_libelle}
</option>
{/section}
</select>
Récurrence :
<select name="recurrence_id">
<option value="" {if $dataSearch.recurrence_id == ""}selected{/if}></option>
{section name=lst loop=$recurrence}
<option value="{$recurrence[lst].recurrence_id}" {if $recurrence[lst].recurrence_id == $dataSearch.recurrence_id}selected{/if}>
{$recurrence[lst].recurrence_libelle}
</option>
{/section}
</select>

<input class="submit" type="submit" name="Rechercher..." value="Rechercher" autofocus>

</td>
</tr>

</table>
</form>