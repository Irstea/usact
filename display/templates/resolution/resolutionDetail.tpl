<div class="formDisplay">
<fieldset>
<legend>Résolution n° 
<a href="index.php?module=resolutionDisplay&resolution_id={$resolution.resolution_id}">
{$resolution.resolution_id}
</a>
</legend>
<dl>
<dt> Description :</dt>
<dd><span class="textareaDisplay">{$resolution.perimetre_detail}</span></dd>
</dl>
<dl>
<dt> Échelle :</dt>
<dd>{$resolution.resolution_echelle_libelle}</dd>
</dl>
<dl>
<dt> Mode niveau 2 :</dt>
<dd>{$resolution.resolution_mode_niv2_libelle}</dd>
</dl>
<dl>
<dt> Nature :</dt>
<dd>{$resolution.resolution_nature_libelle}</dd>
</dl>
<dl>
<dt>Niveau d'acteur :</dt>
<dd>{$resolution.resolution_acteur_libelle}</dd>
</dl>
</fieldset>
<fieldset>
<legend>Solution proposée n°<a href="index.php?module=solutionProposeeDisplay&solution_proposee_id={$resolution.solution_proposee_id}">
{$resolution.solution_proposee_id}
</a>
</legend>
<dl>
<dt>Description :</dt>
<dd>{$resolution.solution_proposee_libelle}</dd>
</dl>
</fieldset>

<fieldset>
<legend>Conflit n° 
<a href="index.php?module=conflitDisplay&conflit_id={$resolution.conflit_id}">
{$resolution.conflit_id}
</a>
</legend>
<dl>
<dt> Description :</dt>
<dd><span class="textareaDisplay">{$resolution.conflit_detail}</span></dd>
</dl>
<dl>
<dt> Type de périmètre :</dt>
<dd>{$resolution.type_perimetre_libelle}</dd>
</dl>
<dl>
<dt> Objet niv2 :</dt>
<dd>{$resolution.objet_niv2_libelle}</dd>
</dl>
<dl>
<dt> Date début :</dt>
<dd>{$resolution.conflit_date_debut}{$resolution.conflit_date_debut_txt}</dd>
</dl>
<dl>
<dt> Date fin :</dt>
<dd>{$resolution.conflit_date_fin}{$resolution.conflit_date_fin_txt}</dd>
</dl>
</fieldset>
</div>