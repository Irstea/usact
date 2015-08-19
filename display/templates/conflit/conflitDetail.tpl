<div class="formDisplay">
<fieldset>
<legend>Périmètre n° 
<a href="index.php?module=perimetreDisplay&perimetre_id={$conflit.perimetre_id}">
{$conflit.perimetre_id}
</a>
</legend>
<dl>
<dt> Description :</dt>
<dd><span class="textareaDisplay">{$conflit.perimetre_detail}</span></dd>
</dl>
<dl>
<dt> Objet niv2 :</dt>
<dd>{$conflit.objet_niv2_libelle}</dd>
</dl>
<dl>
<dt> Bien support niv2 :</dt>
<dd>{$conflit.bien_support_niv2_libelle}</dd>
</dl>
<dl>
<dt> Type de périmètre :</dt>
<dd>{$conflit.type_perimetre_libelle}</dd>
</dl>
<dl>
<dt> Échelle du périmètre :</dt>
<dd>{$conflit.echelle_libelle}</dd>
</dl>
</fieldset>
<fieldset>
<legend>Conflit n° {$conflit.conflit_id}</legend>
<dl>
<dt> Description :</dt>
<dd><span class="textareaDisplay">{$conflit.conflit_detail}</span></dd>
</dl>
<dl>
<dt> Date début :</dt>
<dd>{$conflit.conflit_date_debut}{$conflit.conflit_date_debut_txt}</dd>
</dl>
<dl>
<dt> Date fin :</dt>
<dd>{$conflit.conflit_date_fin}{$conflit.conflit_date_fin_txt}</dd>
</dl>
</fieldset>
</div>