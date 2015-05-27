<a href="index.php?module=objetNiv2Liste">Retour à la liste</a>
&nbsp
<a href="index.php?module=objetNiv2Display&id={$data.objet_niv2_id}" >Retour au détail de la fiche</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="objet_niv2_id" value="{$data.objet_niv2_id}">
<input type="hidden" name="module" value="objetNiv2Write">

<dl>
<dt>Libelle du type d'objet niv2<span class="red">*</span> :</dt>
<dd><input name="objet_niv2_libelle" value="{$data.objet_niv2_libelle}" required autofocus></dd>
</dl>

<dl>
<dt>Libelle du type d'objet niv1 :</dt>
<dd>
<div align="left">
<select name="objet_niv1">
{section name=lst loop=$objet_niv1}
{strip}
<option value="{$objet_niv1[lst].objet_niv1_id}"
{if $objet_niv1[lst].objet_niv1_id == $data.objet_niv1} selected{/if}
>test 
{$objet_niv1[lst].objet_niv1_libelle}
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
<input type="hidden" name="objet_niv2_id" value="{$data.objet_niv2_id}">
<input type="hidden" name="module" value="objetNiv2Delete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>