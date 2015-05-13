{if $isSearch == 1}
<h2>Déclaration de l'échelle d'un périmetre</h2>
{/if}
<a href="index.php?module=echelleListe">Retour à la liste</a>
<a href="index.php?module=echelleDisplay&id={$data.echelle_id}" >Retour au détail de la fiche</a>

<form method="post" action="index.php">
<input type="hidden" name="echelle_id" value="{$data.echelle_id}">
<input type="hidden" name="module" value="echelleWrite">

<table class="tablesaisie">

<tr>
<td>Libelle de l'échelle<span class="red">*</span> :</td>
<td><input name="echelle_libelle" value="{$data.echelle_libelle}"></td>
</tr>

<tr>
<td colspan=2>
<div style="text-align:center;">
<input type="submit" name="valid" value="{$LANG.message.19}"/>
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="echelle_id" value="{$data.echelle_id}">
<input type="hidden" name="module" value="echelleDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</table>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>