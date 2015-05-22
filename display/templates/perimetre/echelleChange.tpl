{if $isSearch == 1}
<h2>Déclaration de l'échelle d'un périmetre</h2>
{/if}
<a href="index.php?module=echelleListe">Retour à la liste</a>
&nbsp
<a href="index.php?module=echelleDisplay&id={$data.echelle_id}" >Retour au détail de la fiche</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="echelle_id" value="{$data.echelle_id}">
<input type="hidden" name="module" value="echelleWrite">

<dl>
<dt>Libelle de l'échelle<span class="red">*</span> :</dt>
<dd><input name="echelle_libelle" value="{$data.echelle_libelle}"></dd>
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