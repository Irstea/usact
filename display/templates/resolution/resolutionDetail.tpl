<div class="formDisplay">
<fieldset>
<legend>Résolution n° 
<a href="index.php?module=resolutionDisplay&resolution_id={$resolution.resolution_id}">
{$resolution.resolution_id}
</a>
</legend>
<dl>
<dt> Description :</dt>
<dd><span class="textareaDisplay">{$resolution.resolution_detail}</span></dd>
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
</div>