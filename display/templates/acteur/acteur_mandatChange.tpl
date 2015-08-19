<h2>Nouveau/Modification du mandat d'un acteur :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
&nbsp;
<a href="index.php?module=acteurDisplay&acteur_id={$data.acteur_id}" >
Retour au détail de l'acteur {$data.acteur_id}</a>
<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="acteur_id" value="{$data.acteur_id}">
<input type="hidden" name="acteur_mandat_id" value="{$data.acteur_mandat_id}">
<input type="hidden" name="module" value="acteur_mandatWrite">

<dl>
<dt>Type de mandat<span class="red">*</span> :</dt>
<dd>
<select name="mandat_type_id" autofocus>
{section name=lst loop=$mandat_type}
{strip}
<option value="{$mandat_type[lst].mandat_type_id}"
{if $mandat_type[lst].mandat_type_id == $data.mandat_type_id} selected{/if}
>
{$mandat_type[lst].mandat_type_libelle}
</option>{/strip}
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Détail du mandat :</dt>
<dd>
<input name="mandat_detail" value="{$data.mandat_detail}" class="commentaire">
</dd>
</dl>

<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
<div class="formBouton">
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="acteur_id" value="{$data.acteur_id}">
<input type="hidden" name="acteur_mandat_id" value="{$data.acteur_mandat_id}">
<input type="hidden" name="module" value="acteur_mandatDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>