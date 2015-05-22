<a href="index.php?module=perimetreListe">Retour à la liste</a>
&nbsp
<a href="index.php?module=perimetreDisplay&id={$data.perimetre_id}" >Retour au détail de la fiche</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="perimetre_id" value="{$data.perimetre_id}">
<input type="hidden" name="module" value="perimetreWrite">

<dl>
<dt>Récurrence du périmetre<span class="red">*</span> :</dt>
<dd><input name="recurrence" value="{$data.recurrence}" required autofocus></dd>
</dl>
<dl>
<dt>Date de saisie du périmetre<span class="red">*</span> :</dt>
<dd><input name="perimetre_date_saisie" value="{$data.perimetre_date_saisie}" required autofocus></dd>
</dl>
<dl>
<dt>Détail sur le périmetre :</dt>
<dd><input name="perimetre_detail" value="{$data.perimetre_detail}" autofocus></dd>
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