<a href="index.php?module=bienSupportNiv1Liste">Retour à la liste</a>
&nbsp
<a href="index.php?module=bienSupportNiv1Display&id={$data.bien_support_niv1_id}" >Retour au détail de la fiche</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="bien_support_niv1_id" value="{$data.bien_support_niv1_id}">
<input type="hidden" name="module" value="bienSupportNiv1Write">


<dl>
<dt>Bien support niv1<span class="red">*</span> :</dt>
<dd><input name="bien_support_niv1_libelle" value="{$data.bien_support_niv1_libelle}" required autofocus></dd>
</dl>

<tr>
<td colspan=2>
<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="bien_support_niv1_id" value="{$data.bien_support_niv1_id}">
<input type="hidden" name="module" value="bienSupportNiv1Delete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>