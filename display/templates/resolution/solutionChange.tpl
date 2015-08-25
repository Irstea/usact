<h2>Nouveau/Modification d'une solution proposée :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
&nbsp;
<a href="index.php?module=interventionDisplay&intervention_id={$data.intervention_id}">
Retour à l'intervention {$data.intervention_id}
</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="intervention_id" value="{$data.intervention_id}">
<input type="hidden" name="solution_proposee_id" value="{$data.solution_proposee_id}">
<input type="hidden" name="module" value="solutionWrite">
<fieldset>
<legend>Solution proposée {if $data.solution_proposee_id > 0}n° {$data.solution_proposee_id}{/if}</legend>
<dl>
<dt>Détail :</dt>
<dd><textarea name="solution_proposee_libelle">{$data.solution_proposee_libelle}</textarea></dd>
</dl>

</fieldset>


<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
{if $data.solution_proposee_id > 0}
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="solution_proposee_id" value="{$data.solution_proposee_id}">
<input type="hidden" name="intervention_id" value="{$data.intervention_id}">
<input type="hidden" name="module" value="solutionDelete">
<div class="formBouton">
<input type="submit" value="Supprimer">
</div>
</form>
{/if}
</div>

<span class="red">*</span><span class="messagebas">Champ obligatoire</span>
