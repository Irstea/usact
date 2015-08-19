<h2>Nouveau/Modification d'un acteur :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
{if $data.acteur_id > 0}
&nbsp;
<a href="index.php?module=acteurDisplay&acteur_id={$data.acteur_id}" >
Retour au détail de l'acteur {$data.acteur_id}</a>
{/if}
<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="acteur_id" value="{$data.acteur_id}">
<input type="hidden" name="module" value="acteurWrite">
<input type="hidden" name="acteur_date_saisie" value="{$data.acteur_date_saisie}">
<input type="hidden" name="acteur_login" value="{$data.acteur_login}">

<dl>
<dt>Type d'acteur<span class="red">*</span> :</dt>
<dd>
<select name="acteur_niv3_id" autofocus>
{section name=lst loop=$acteur_niv3}
{strip}
<option value="{$acteur_niv3[lst].acteur_niv3_id}"
{if $acteur_niv3[lst].acteur_niv3_id == $data.acteur_niv3_id} selected{/if}
>
{$acteur_niv3[lst].acteur_niv1_libelle} - {$acteur_niv3[lst].acteur_niv2_libelle} - {$acteur_niv3[lst].acteur_niv3_libelle}
</option>{/strip}
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Personne physique :</dt>
<dd>
<input name="acteur_physique_nom" value="{$data.acteur_physique_nom}" class="commentaire" placeholder="Nom de la personne physique">
<br>
<input name="cp_physique" value="{$data.cp_physique}" placeholder="c. postal">
&nbsp;
<input name="commune_physique" value="{$data.commune_physique}" placeholder="commune">
</dd>
</dl>

<dl>
<dt>Personne morale :</dt>
<dd>
<input name="acteur_moral_nom" value="{$data.acteur_moral_nom}" class="commentaire" placeholder="Nom de la personne morale">
<br>
<input name="cp_physique" value="{$data.cp_morale}" placeholder="c. postal">
&nbsp;
<input name="commune_physique" value="{$data.commune_morale}" placeholder="commune">
</dd>
</dl>
<dl>
<dt>Statut :</dt>
<dd>
<input name="acteur_statut" value="{$data.acteur_statut}" >
</dd>
</dl>

<dl>
<dt>Statut détaillé :</dt>
<dd><textarea name="acteur_statut_detail">{$data.acteur_statut_detail}</textarea>
</dd>
</dl>

<dl>
<dt>Type de résidence (particulier) :</dt>
<dd>
<select name="particulier_resident_type_id">
<option value="" {if $data.particulier_resident_type_id == ""}selected{/if}>
{section name=lst loop=$particulier_resident_type}
<option value="{$particulier_resident_type[lst].particulier_resident_type_id}" {if $particulier_resident_type[lst].particulier_resident_type_id == $data.particulier_resident_type_id}selected{/if}>
{$particulier_resident_type[lst].particulier_resident_type_libelle}
</option>
{/section}
</select>
</dl>

<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
<div class="formBouton">
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="acteur_id" value="{$data.acteur_id}">
<input type="hidden" name="module" value="acteurDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>