<h2>Nouveau/Modification type perimetre :</h2>
<a href="index.php?module=typePerimetreListe">Retour à la liste</a>
&nbsp
<a href="index.php?module=typePerimetreDisplay&id={$data.type_perimetre_id}" >Retour au détail de la fiche</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="type_perimetre_id" value="{$data.type_perimetre_id}">
<input type="hidden" name="module" value="typePerimetreWrite">


<dl>
<dt>Type<span class="red">*</span> :</dt>
<dd><input name="type_perimetre_libelle" value="{$data.type_perimetre_libelle}" required autofocus></dd>
</dl>

<tr>
<td colspan=2>
<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="type_perimetre_id" value="{$data.type_perimetre_id}">
<input type="hidden" name="module" value="typePerimetreDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
<tr>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>