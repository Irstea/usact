<h2>Nouveau/Modification recurrence :</h2>
<a href="index.php?module=recurrenceListe">Retour à la liste</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="recurrence_id" value="{$data.recurrence_id}">
<input type="hidden" name="module" value="recurrenceWrite">

<dl>
<dt>Recurrence<span class="red">*</span> :</dt>
<dd><input name="recurrence_libelle" value="{$data.recurrence_libelle}" required autofocus></dd>
</dl>

<tr>
<td colspan=2>
<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="recurrence_id" value="{$data.recurrence_id}">
<input type="hidden" name="module" value="recurrenceDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</div>

<span class="red">*</span><span class="messagebas">Champ obligatoire</span>