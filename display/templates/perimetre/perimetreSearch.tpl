<h2>Perimetre :</h2>
<table id="perimetreSearch" class="formSaisie">
<form method="GET" action="index.php">
<input type="hidden" name="module" value="perimetreListe">
<input type="hidden" name="isSearch" value="1">

<dl>
<dt>ID à rechercher : </dt>
<dd><input name="searchId" value="{$perimetreSearch.searchId}" maxlength="50" size="30" autofocus></dd>
</dl>

<dl>
<dt>Objet niv2 :</dt>
<dd>
<div align="left">
<select id="searchObjetNiv2" name="searchObjetNiv2">
{section name=lst loop=$objet_niv2}
{strip}
<option value="{$objet_niv2[lst].objet_niv2_id}"
{if $objet_niv2[lst].objet_niv2_id == $data.objet_niv2_id} selected{/if}
{if $objet_niv2[lst].objet_niv2_libelle == null} hidden {/if}
>
{$objet_niv2[lst].objet_niv2_libelle}
</option>{/strip}
{/section}
</select>
</div>
</dd>
</dl>

<dl>
<dt>Objet niv1 :</dt>
<dd>
<div align="left">
<select id="searchObjetNiv1" name="searchObjetNiv1">
{section name=lst loop=$objet_niv1}
{strip}
<option value="{$objet_niv1[lst].objet_niv1_id}"
{if $objet_niv1[lst].objet_niv1_id == $data.objet_niv1_id} selected{/if}
{if $objet_niv1[lst].objet_niv1_libelle == null} hidden {/if}
>
{$objet_niv1[lst].objet_niv1_libelle}
</option>{/strip}
{/section}
</select>
</div>
</dd>
</dl>

<dl>
<dt>Bien support niv2 :</dt>
<dd>
<div align="left">
<select id="searchBienSupportniv2" name="searchBienSupportNiv2">
{section name=lst loop=$bien_support_niv2}
{strip}
<option value="{$bien_support_niv2[lst].bien_support_niv2_id}"
{if $bien_support_niv2[lst].bien_support_niv2_id == $data.bien_support_niv2_id} selected{/if}
{if $bien_support_niv2[lst].bien_support_niv2_libelle == null} hidden {/if}
>
{$bien_support_niv2[lst].bien_support_niv2_libelle}
</option>{/strip}
{/section}
</select>
</div>
</dd>
</dl>

<dl>
<dt>Bien support niv1 :</dt>
<dd>
<div align="left">
<select id="searchBienSupportNiv1" name="searchBienSupportNiv1">
{section name=lst loop=$bien_support_niv1}
{strip}
<option value="{$bien_support_niv1[lst].bien_support_niv1_id}"
{if $bien_support_niv1[lst].bien_support_niv1_id == $data.bien_support_niv1_id} selected{/if}
{if $bien_support_niv1[lst].bien_support_niv1_libelle == null} hidden {/if}
>
{$bien_support_niv1[lst].bien_support_niv1_libelle}
</option>{/strip}
{/section}
</select>
</div>
</dd>
</dl>

<tr>
<td colspan=2>
<div style="text-align:center;" class="formBouton">
<input class="submit" type="submit" name="Rechercher..." value="Rechercher">
</form>
</div>
</td>
</tr>
</div>
</table>