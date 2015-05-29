<h2>Nouveau/Modification perimetre :</h2>
<a href="index.php?module=perimetreListe">Retour à la liste</a>
&nbsp
<a href="index.php?module=perimetreDisplay&id={$data.perimetre_id}" >Retour au détail de la fiche</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="perimetre_id" value="{$data.perimetre_id}">
<input type="hidden" name="module" value="perimetreWrite">

<dl>
<dt>Description<span class="red">*</span> :</dt>
<dd><input name="perimetre_detail" value="{$data.perimetre_detail}" autofocus></dd>
</dl>
<dl>
<dt>Récurrence<span class="red">*</span> :</dt>
<dd><input name="recurrence" value="{$data.recurrence}" required autofocus></dd>
</dl>
<dl>
<dt>Date de saisie<span class="red">*</span> :</dt>
<dd><input class="date" name="perimetre_date_saisie" value="{$data.perimetre_date_saisie}" required autofocus></dd>
</dl>

<dl>
<dt>Type :</dt>
<dd>
<div align="left">
<select name="type_perimetre_id">
{section name=lst loop=$type_perimetre}
{strip}
<option value="{$type_perimetre[lst].type_perimetre_id}"
{if $type_perimetre[lst].type_perimetre_id == $data.type_perimetre_id} selected{/if}
>
{$type_perimetre[lst].type_perimetre_libelle}
</option>{/strip}
{/section}
</select>
</div>
</dd>
</dl>

<dl>
<dt>Echelle :</dt>
<dd>
<div align="left">
<select name="echelle_id">
{section name=lst loop=$echelle}
{strip}
<option value="{$echelle[lst].echelle_id}"
{if $echelle[lst].echelle_id == $data.echelle_id} selected{/if}
> 
{$echelle[lst].echelle_libelle}
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
<select name="bien_support_niv2_id">
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
</dd>
</dl>

<dl>
<dt>Objet niv2 :</dt>
<dd>
<div align="left">
<select name="objet_niv2_id">
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
</dd>
</dl>



<tr>
<td colspan=2>
<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="perimetre_id" value="{$data.perimetre_id}">
<input type="hidden" name="module" value="perimetreDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>