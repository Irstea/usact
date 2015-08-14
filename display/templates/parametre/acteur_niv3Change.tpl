<h2>Modification d'une entrée dans la table de paramètres : acteur_niv3</h2>

<a href="index.php?module=acteur_niv3List">Retour à la liste</a>

<div class="formSaisie">
<fieldset>
<legend>Table acteur_niv3</legend>
<div>

<form method="post" action="index.php?module=acteur_niv3Write">
<input type="hidden" name="acteur_niv3_id" value="{$data.acteur_niv3_id}">
<dl>
<dt>Niveau 1 de rattachement <span class="red">*</span> :</dt>
<dd>
<select name="acteur_niv2_id">
{section name=lst loop=$parentData}
<option value="{$parentData[lst].acteur_niv2_id}" {if $parentData[lst].acteur_niv2_id == $data.acteur_niv2_id}selected{/if}>
{$parentData[lst].acteur_niv1_libelle} - {$parentData[lst].acteur_niv2_libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Libellé <span class="red">*</span> :</dt>
<dd><input class="commentaire" id="acteur_niv3_libelle" name="acteur_niv3_libelle" value="{$data.acteur_niv3_libelle}" required> </dd>
</dl>
<dl>
<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
{if $data.acteur_niv3_id>0}
<div class="formBouton">
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="acteur_niv3_id" value="{$data.acteur_niv3_id}">
<input type="hidden" name="module" value="acteur_niv3Delete">
<input class="submit" type="submit" value="Supprimer">
</form>
</div>
{/if}
</div>
</fieldset>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>