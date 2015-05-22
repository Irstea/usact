<a href="index.php?module=objetNiv1Liste">Retour à la liste</a>
&nbsp
<a href="index.php?module=objetNiv1Display&id={$data.objet_niv1_id}" >Retour au détail de la fiche</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="objet_niv1_id" value="{$data.objet_niv1_id}">
<input type="hidden" name="module" value="objetNiv1Write">

<dl>
<dt>Libelle du type d'objet niv1<span class="red">*</span> :</dt>
<dd><input name="objet_niv1_libelle" value="{$data.objet_niv1_libelle}" required autofocus></dd>
</dl>

<tr>
<td colspan=2>
<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="objet_niv1_id" value="{$data.objet_niv1_id}">
<input type="hidden" name="module" value="objetNiv1Delete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>