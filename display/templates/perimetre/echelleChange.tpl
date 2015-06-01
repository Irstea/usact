<h2>Nouveau/Modification echelle :</h2>
<a href="index.php?module=echelleListe">Retour à la liste</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="echelle_id" value="{$data.echelle_id}">
<input type="hidden" name="module" value="echelleWrite">

<dl>
<dt>Echelle<span class="red">*</span> :</dt>
<dd><input name="echelle_libelle" value="{$data.echelle_libelle}" required autofocus></dd>
</dl>

<tr>
<td colspan=2>
<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="echelle_id" value="{$data.echelle_id}">
<input type="hidden" name="module" value="echelleDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</div>

<span class="red">*</span><span class="messagebas">Champ obligatoire</span>