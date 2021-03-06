<h2>Modification d'une entrée dans la table de paramètres : {$tableName}</h2>

<a href="index.php?module={$tableName}List">Retour à la liste</a>

<div class="formSaisie">
<fieldset>
<legend>Table {$tableName}</legend>
<div>

<form method="post" action="index.php?module={$tableName}Write">
<input type="hidden" name="{$tableName}_id" value="{$data.id}">

<dl>
<dt>Libellé <span class="red">*</span> :</dt>
<dd><input class="commentaire" id="{$tableName}_libelle" name="{$tableName}_libelle" value="{$data.libelle}" required autofocus> </dd>
</dl>

{if strlen($colonneSupp) > 0}
<dl>
<dt>{$colonneSupp} <span class="red">*</span> :</dt>
<dd>
<select name="select_id">
{section name=lst loop=$select}
{strip}
<option value="{$select[lst].id}" {if $data.select_id == $select[lst].id}selected{/if}>
{$select[lst].libelle}
</option>
{/strip}
{/section}
</select>
</dd>
</dl>
{/if}

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