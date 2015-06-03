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
<dd><input name="conflit_detail" value="{$data.conflit_detail}" required autofocus></dd>
</dl>

<dl>
<dt>Date de début :</dt>
<dd><input class="date" name="conflit_date_debut" value="{$data.conflit_date_debut}"></dd>
</dl>


{if $data.conflit_id == 0}
<dl>
<dt>Date de fin :</dt>
<dd><input type="date" value="<?php echo date('d-m-Y'); ?>" name="conflit_date_fin"></dd>
</dl>
{else}
<dl>
<dt>Date de fin :</dt>
<dd><input class="date" name="conflit_date_fin" value="{$data.conflit_date_fin}"></dd>
</dl>
{/if}

<dl>
<dt>Perimetre<span class="red">*</span> :</dt>
<dd>
<div align="left">
<select name="perimetre_id">
<option value = "" selected hidden>Selectionner ...</option>
{section name=lst loop=$perimetre}
{strip}
<option value="{$perimetre[lst].perimetre_id}"
{if $perimetre[lst].perimetre_id == $data.perimetre_id} selected{/if}
{if $perimetre[lst].perimetre_detail == null and $perimetre[lst].bien_support_niv2_libelle == null and $perimetre[lst].type_perimetre_libelle == null and $perimetre[lst].echelle_libelle == null and $perimetre[lst].objet_niv2_libelle == null} hidden {/if}
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
