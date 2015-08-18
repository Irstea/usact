<h2>Nouveau/Modification conflit :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
&nbsp;
<a href="index.php?module=conflitDisplay&conflit_id={$data.conflit_id}">Retour au détail de la fiche</a>

{include file="conflit/perimetreDetail.tpl"}
<br>
<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="conflit_id" value="{$data.conflit_id}">
<input type="hidden" name="module" value="conflitWrite">
<input type="hidden" name="perimetre_id" value="{$data.perimetre_id}">
<fieldset>
<legend>Conflit {if $data.conflit_id > 0}n° {$data.conflit_id}{/if}</legend>

<dl>
<dt>Description :</dt>
<dd><textarea name="conflit_detail" autofocus>{$data.conflit_detail}</textarea></dd>
</dl>

<dl>
<dt>Date de début :</dt>
<dd><input class="date" name="conflit_date_debut" value="{$data.conflit_date_debut}">
(<input name="conflit_date_debut_txt" value="{$data.conflit_date_debut_txt}" placeholder="date non formatée">)</dd>
</dl>


<dl>
<dt>Date de fin :</dt>
<dd><input class="date" name="conflit_date_fin" value="{$data.conflit_date_fin}">
(<input name="conflit_date_fin_txt" value="{$data.conflit_date_fin_txt}" placeholder="date non formatée">)
</dd>
</dl>
</fieldset>


<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
{if $data.conflit_id > 0}
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="conflit_id" value="{$data.conflit_id}">
<input type="hidden" name="perimetre_id" value="{$data.perimetre_id}">
<input type="hidden" name="module" value="conflitDelete">
<div class="formBouton">
<input type="submit" value="Supprimer">
</div>
</form>
{/if}
</div>

<span class="red">*</span><span class="messagebas">Champ obligatoire</span>
