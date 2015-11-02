<div class="formDisplay">
<fieldset>
<legend>Expert n° <a href="index.php?module=expertDisplay&expert_id={$expert.expert_id}">
{$expert.expert_id}
</a></legend>
<dl>
<dt> Nom - prénom :</dt>
<dd>{$expert.expert_nom} {$expert.expert_prenom}</dd>
</dl>
<dl>
<dt> Sexe :</dt>
<dd>{$expert.sexe}</dd>
</dl>
<dl>
<dt>Commune de résidence</dt>
<dd>{$expert.commune_residence}</dd>
</dl>
<dl>
<dt> Lien avec le territoire :</dt>
<dd><span class="textareaDisplay">{$expert.lien_territoire}</span></dd>
</dl>
<dl>
<dt>Activité professionnelle :</dt>
<dd>{$expert.activite_prof}</dd>
</dl>
<dl>
<dt>Activité associative :</dt>
<dd>{$expert.activite_assoc}</dd>
</dl>
<dl>
<dt>Année de naissance :</dt>
<dd>{$expert.annee_naissance}</dd>
</dl>
</fieldset>
</div>