{if $isSearch == 2}
<h2>Déclaration du type de périmetre</h2>
{/if}
<a href="index.php?module=objetNiv2Liste">Retour à la liste</a>
<a href="index.php?module=objetNiv2Display&id={$data.objet_niv2_id}" >Retour au détail de la fiche</a>

<form method="post" action="index.php">
<input type="hidden" name="objet_niv2_id" value="{$data.objet_niv2_id}">
<input type="hidden" name="module" value="objetNiv2Write">

<table class="tablesaisie">

<tr>
<td>Libelle du type d'objet niv2<span class="red">*</span> :</td>
<td><input name="objet_niv2_libelle" value="{$data.objet_niv2_libelle}" required autofocus></td>
</tr>

<tr>
<td colspan=2>
<div style="text-align:center;">
<input type="submit" name="valid" value="{$LANG.message.19}"/>
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="objet_niv2_id" value="{$data.objet_niv2_id}">
<input type="hidden" name="module" value="objetNiv2Delete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</table>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>