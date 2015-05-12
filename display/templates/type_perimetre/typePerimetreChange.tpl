{if $isSearch == 1}
<h2>Déclaration du type de périmetre</h2>
{/if}
<a href="index.php?module=typePerimetreListe">Retour à la liste</a>
<a href="index.php?module=typePerimetreDisplay&id={$data.type_perimetre_id}" >Retour au détail de la fiche</a>

<form method="post" action="index.php" onSubmit='return validerForm("nom:le nom est obligatoire,prenom:le prénom est obligatoire")'>
<input type="hidden" name="action" value="M">
<input type="hidden" name="type_perimetre_id" value="{$data.type_perimetre_id}">
<input type="hidden" name="module" value="typePerimetreWrite">

<table class="tablesaisie">

<tr>
<td>Libelle du type de périmetre<span class="red">*</span> :</td>
<td><input name="type_perimetre_libelle" value="{$data.type_perimetre_libelle}"></td>
</tr>

<tr>
<td colspan=2>
<div style="text-align:center;">
<input type="submit" name="valid" value="{$LANG.message.19}"/>
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="type_perimetre_id" value="{$data.type_perimetre_id}">
<input type="hidden" name="module" value="typePerimetreDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</table>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>