<div class="formDisplay">
<fieldset>
<legend>Solution proposée n° {$solution_proposee.solution_proposee_id}
</legend>
<dl><dt>Acteur</dt>
<dd>{$solution_proposee.acteur_moral_nom} {$solution_proposee.acteur_physique_nom}</dd>
</dl>

<dl><dt>Date de l'intervention n° 
<a href="index.php?module=interventionDisplay&intervention_id={$solution_proposee.intervention_id}">
{$solution_proposee.intervention_id}
</a>
 :</dt>
<dd>{$solution_proposee.intervention_date_entree}{$solution_proposee.intervention_date_entree_txt}
</dl>
<dl>
<dt> Détail :</dt>
<dd><span class="textareaDisplay">{$solution_proposee.solution_proposee_libelle}</span></dd>
</dl>
</fieldset>
</div>