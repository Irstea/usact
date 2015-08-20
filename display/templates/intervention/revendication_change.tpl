<h2>Nouveau/Modification d'une revendication :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
&nbsp;
<a href="index.php?module=interventionDisplay&intervention_id={$data.intervention_id}">Retour à l'intervention n° {$data.intervention_id}</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="revendication_id" value="{$data.revendication_id}">
<input type="hidden" name="intervention_id" value="{$data.intervention_id}">
<input type="hidden" name="module" value="revendicationWrite">

<fieldset>
<legend>Revendication {if $data.revendication_id > 0}n° {$data.revendication_id}{/if}</legend>

<dl>
<dt>Revendication :</dt>
<dd>
<select name="revendication_niv2_id">
<option value="" {if $data.revendication_niv2_id == ""}selected{/if}>
</option>
{section name=lst loop=$revendication_niv2}
<option value="{$revendication_niv2[lst].revendication_niv2_id}" {if $revendication_niv2[lst].revendication_niv2_id == $data.revendication_niv2_id}selected{/if}>
{$revendication_niv2[lst].revendication_niv1_libelle} {$revendication_niv2[lst].revendication_niv2_libelle}
</option>
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Argument :</dt>
<dd>
<select name="registre_argument_niv2_id">
<option value="" {if $data.registre_argument_niv2_id == ""}selected{/if}>
</option>
{section name=lst loop=$registre_argument_niv2}
<option value="{$registre_argument_niv2[lst].registre_argument_niv2_id}" {if $registre_argument_niv2[lst].registre_argument_niv2_id == $data.registre_argument_niv2_id}selected{/if}>
{$registre_argument_niv2[lst].registre_argument_niv1_libelle} {$registre_argument_niv2[lst].registre_argument_niv2_libelle}
</option>
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Support :</dt>
<dd>
<select name="revend_support_niv2_id">
<option value="" {if $data.revend_support_niv2_id == ""}selected{/if}>
</option>
{section name=lst loop=$revend_support_niv2}
<option value="{$revend_support_niv2[lst].revend_support_niv2_id}" {if $revend_support_niv2[lst].revend_support_niv2_id == $data.revend_support_niv2_id}selected{/if}>
{$revend_support_niv2[lst].revend_support_niv1_libelle} {$revend_support_niv2[lst].revend_support_niv2_libelle}
</option>
{/section}
</select>
</dd>
</dl>


<dl>
<dt>Détail :</dt>
<dd><textarea name="revendication_detail">{$data.revendication_detail}</textarea></dd>
</dl>

</fieldset>


<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
{if $data.revendication_id > 0}
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="revendication_id" value="{$data.revendication_id}">
<input type="hidden" name="intervention_id" value="{$data.intervention_id}">
<input type="hidden" name="module" value="revendicationDelete">
<div class="formBouton">
<input type="submit" value="Supprimer">
</div>
</form>
{/if}
</div>

<span class="red">*</span><span class="messagebas">Champ obligatoire</span>
