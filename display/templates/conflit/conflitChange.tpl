<h2>Nouveau/Modification conflit :</h2>
<a href="index.php?module=conflitListe">Retour à la liste</a>
&nbsp
<a href="index.php?module=conflitDisplay&id={$data.conflit_id}">Retour au détail de la fiche</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="conflit_id" value="{$data.conflit_id}">
<input type="hidden" name="module" value="conflitWrite">

<dl>
<dt>Description<span class="red">*</span> :</dt>
<dd><input name="conflit_detail" value="{$data.conflit_detail}"></dd>
</dl>
<dl>
<dt>Date de début :</dt>
<dd><input class="date" name="conflit_date_debut" value="{$data.conflit_date_debut}"></dd>
</dl>
<dl>
<dt>Date de fin :</dt>
<dd><input class="date" name="conflit_date_fin" value="{$data.conflit_date_fin}"></dd>
</dl>
<dl>
<dt>Date de saisie<span class="red">*</span> :</dt>
<dd><input class="date" name="conflit_date_saisie" value="{$data.conflit_date_saisie}"></dd>
</dl>

<dl>
<dt>Perimetre :</dt>
<dd>
<div align="left">
<select name="perimetre_id">
<option placeholder="Selectionner ..." value = "Selectionner" selected="selected">Selectionner ...</option>
{section name=lst loop=$perimetre}
{strip}
<option value="{$perimetre[lst].perimetre_id}"
{if $perimetre[lst].perimetre_id == $data.perimetre_id} selected{/if}
>
{$perimetre[lst].perimetre_detail} - {$perimetre[lst].bien_support_niv2_libelle} - {$perimetre[lst].type_perimetre_libelle} - {$perimetre[lst].echelle_libelle} - {$perimetre[lst].objet_niv2_libelle}
</option>{/strip}
{/section}
</select>
</div>
</dd>
</dl>

<tr>
<td colspan=2>
<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="conflit_id" value="{$data.conflit_id}">
<input type="hidden" name="module" value="conflitDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</div>

<span class="red">*</span><span class="messagebas">Champ obligatoire</span>
