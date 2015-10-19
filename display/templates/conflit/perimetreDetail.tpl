<div class="formDisplay">
<fieldset>
<legend>Périmètre n° <a href="index.php?module=perimetreDisplay&perimetre_id={$perimetre.perimetre_id}">
{$perimetre.perimetre_id}
</a></legend>
<dl>
<dt> Objet niv2 :</dt>
<dd>{$perimetre.objet_niv1_libelle} - {$perimetre.objet_niv2_libelle}</dd>
</dl>
<dl>
<dt> Bien support niv2 :</dt>
<dd>{$perimetre.bien_support_niv1_libelle} - {$perimetre.bien_support_niv2_libelle}</dd>
</dl>
<dl>
<dt> Description :</dt>
<dd><span class="textareaDisplay">{$perimetre.perimetre_detail}</span></dd>
</dl>
<dl>
<dt> Récurrence :</dt>
<dd>{$perimetre.recurrence_libelle}</dd>
</dl>
<dl>
<dt> Type:</dt>
<dd>{$perimetre.type_perimetre_libelle}</dd>
</dl>
<dl>
<dt> Echelle :</dt>
<dd>{$perimetre.echelle_libelle}</dd>
</dl>
</fieldset>
</div>