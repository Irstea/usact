<h2>Nouveau/Modification d'une action :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
&nbsp;
<a href="index.php?module=interventionDisplay&intervention_id={$data.intervention_id}">Retour à l'intervention n° {$data.intervention_id}</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="action_id" value="{$data.action_id}">
<input type="hidden" name="intervention_id" value="{$data.intervention_id}">
<input type="hidden" name="module" value="actionWrite">

<fieldset>
<legend>Action {if $data.action_id > 0}n° {$data.action_id}{/if}</legend>

<dl>
<dt>Type :</dt>
<dd>
<select name="action_type_id">
<option value="" {if $data.action_type_id == ""}selected{/if}>
</option>
{section name=lst loop=$action_type}
<option value="{$action_type[lst].action_type_id}" {if $action_type[lst].action_type_id == $data.action_type_id}selected{/if}>
{$action_type[lst].action_type_libelle}
</option>
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Mode :</dt>
<dd>
<select name="action_mode_id">
<option value="" {if $data.action_mode_id == ""}selected{/if}>
</option>
{section name=lst loop=$action_mode}
<option value="{$action_mode[lst].action_mode_id}" {if $action_mode[lst].action_mode_id == $data.action_mode_id}selected{/if}>
{$action_mode[lst].action_mode_libelle}
</option>
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Échelle :</dt>
<dd>
<select name="action_echelle_id">
<option value="" {if $data.action_echelle_id == ""}selected{/if}>
</option>
{section name=lst loop=$action_echelle}
<option value="{$action_echelle[lst].action_echelle_id}" {if $action_echelle[lst].action_echelle_id == $data.action_echelle_id}selected{/if}>
{$action_echelle[lst].action_echelle_libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Date :</dt>
<dd><input class="date" name="action_date" value="{$data.action_date}">
(<input name="action_date_complement" value="{$data.action_date_complement}" placeholder="date non formatée">)
</dd>
</dl>

<dl>
<dt>Détail :</dt>
<dd><textarea name="action_detail">{$data.action_detail}</textarea></dd>
</dl>

</fieldset>


<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
{if $data.action_id > 0}
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="action_id" value="{$data.action_id}">
<input type="hidden" name="intervention_id" value="{$data.intervention_id}">
<input type="hidden" name="module" value="actionDelete">
<div class="formBouton">
<input type="submit" value="Supprimer">
</div>
</form>
{/if}
</div>

<span class="red">*</span><span class="messagebas">Champ obligatoire</span>
