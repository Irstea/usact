<h2>Nouveau/Modification du rôle dans la structure d'un acteur :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
&nbsp;
<a href="index.php?module=acteurDisplay&acteur_id={$data.acteur_id}" >
Retour au détail de l'acteur {$data.acteur_id}</a>
<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="acteur_id" value="{$data.acteur_id}">
<input type="hidden" name="acteur_structure_id" value="{$data.acteur_structure_id}">
<input type="hidden" name="module" value="acteur_structureWrite">

<dl>
<dt>Type de structure<span class="red">*</span> :</dt>
<dd>
<select name="structure_type_id" autofocus>
{section name=lst loop=$structure_type}
{strip}
<option value="{$structure_type[lst].structure_type_id}"
{if $structure_type[lst].structure_type_id == $data.structure_type_id} selected{/if}
>
{$structure_type[lst].structure_type_libelle}
</option>{/strip}
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Statut dans la structure :</dt>
<dd>
<input name="structure_statut" value="{$data.structure_statut}" class="commentaire">
</dd>
</dl>

<dl>
<dt>Détail du statut :</dt>
<dd>
<textarea name="structure_statut_detail">{$data.structure_statut_detail}</textarea>
</dd>
</dl>

<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
<div class="formBouton">
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="acteur_id" value="{$data.acteur_id}">
<input type="hidden" name="acteur_structure_id" value="{$data.acteur_structure_id}">
<input type="hidden" name="module" value="acteur_structureDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>