<h2>Nouveau/Modification bien support niv2 :</h2>
<a href="index.php?module=bienSupportNiv2Liste">Retour à la liste</a>
&nbsp
<a href="index.php?module=bienSupportNiv2Display&id={$data.bien_support_niv2_id}" >Retour au détail de la fiche</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="bien_support_niv2_id" value="{$data.bien_support_niv2_id}">
<input type="hidden" name="module" value="bienSupportNiv2Write">

<dl>
<dt>Bien support niv2<span class="red">*</span> :</dt>
<dd><input name="bien_support_niv2_libelle" value="{$data.bien_support_niv2_libelle}" required autofocus></dd>
</dl>

<dl>
<dt>Bien support niv1 :</dt>
<dd>
<div align="left">
<select name="bien_support_niv1_id">
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
<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="bien_support_niv2_id" value="{$data.bien_support_niv2_id}">
<input type="hidden" name="module" value="bienSupportNiv2Delete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>