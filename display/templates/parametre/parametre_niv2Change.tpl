<h2>Modification d'une entrée dans la table de paramètres : {$tableName}</h2>

<a href="index.php?module={$tableName}List">Retour à la liste</a>

<div class="formSaisie">
<fieldset>
<legend>Table {$tableName}</legend>
<div>

<form method="post" action="index.php?module={$tableName}Write">
<input type="hidden" name="{$tableName}_id" value="{$data.id}">
<dl>
<dt>Niveau 1 de rattachement <span class="red">*</span> :</dt>
<dd>
<select name="{$tableParent}_id">
{section name=lst loop=$parentData}
<option value="{$parentData[lst].id}" {if $parentData[lst].id} == {$data.parent_id}selected{/if}>
{$parentData[lst].libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Libellé <span class="red">*</span> :</dt>
<dd><input class="commentaire" id="{$tableName}_libelle" name="{$tableName}_libelle" value="{$data.libelle}" required autofocus> </dd>
</dl>
<dl>
<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
{if $data.id>0}
<div class="formBouton">
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="{$tableName}_id" value="{$data.id}">
<input type="hidden" name="module" value="{$tableName}Delete">
<input class="submit" type="submit" value="Supprimer">
</form>
</div>
{/if}
</div>
</fieldset>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>