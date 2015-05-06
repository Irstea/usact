{if $isSearch == 1}
<h2>Déclaration d'un conflit</h2>
{/if}
<a href="index.php?module=conflitListe">Retour à la liste</a>
<a href="index.php?module=conflitDisplay&id={$data.conflit_id}" style="padding-left:2em">Retour au détail de la fiche</a>
<form method="post" action="index.php" onSubmit='return validerForm("nom:le nom est obligatoire,prenom:le prénom est obligatoire")'>
<input type="hidden" name="action" value="M">
<input type="hidden" name="conflit_id" value="{$data.conflit_id}">
<input type="hidden" name="module" value="conflitWrite">
<table class="tablesaisie">
<tr>
<td>Nom<span class="red">*</span> :</td>
<td><input name="personne_saisie_conflit_nom" value="{$data.personne_saisie_conflit_nom}" autofocus></td>
</tr>
<tr>
<td>Prénom<span class="red">*</span> :</td>
<td><input name="personne_saisie_conflit_prenom" value="{$data.personne_saisie_conflit_prenom}"></td>
</tr>
<td>Date de début :</td>
<td><input name="conflit_date_debut" value="{$data.conflit_date_debut}"></td>
</tr>
<tr>
<td>Date de fin :</td>
<td><input name="conflit_date_fin" value="{$data.conflit_date_fin}"></td>
</tr>
<tr>
<td>Date de saisie<span class="red">*</span> :</td>
<td><input name="conflit_date_saisie" value="{$data.conflit_date_saisie}"></td>
</tr>
<tr>
<td>Détail sur le conflit :</td>
<td><input name="conflit_detail" value="{$data.conflit_detail}"></td>
</tr>
<tr>
<td colspan=2>
<div style="text-align:center;">
<input type="submit" name="valid" value="{$LANG.message.19}"/>
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="id" value="{$data.conflit_id}">
<input type="hidden" name="module" value="conflitDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</table>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>
