<a href="index.php?module=perimetreListe">Retour à la liste </a>
&nbsp
<a href="index.php?module=perimetreChange&id={$data.perimetre_id}" >Modifier...</a>

<div class="formDisplay">
<fieldset>
<legend>Informations sur le perimetre</legend>
<dl>
<dt> Description :</dt>
<dd>{$data.perimetre_detail}</dd>
</dl>
<dl>
<dt> Récurrence :</dt>
<dd>{$data.recurrence}</dd>
</dl>
<dl>
<dt> Date de saisie :</dt>
<dd>{$data.perimetre_date_saisie}</dd>
</dl>
<dl>
<dt> Type:</dt>
<dd>{$data.type_perimetre_libelle}</dd>
</dl>
<dl>
<dt> Echelle :</dt>
<dd>{$data.echelle_libelle}</dd>
</dl>
<dl>
<dt> Bien support niv2 :</dt>
<dd>{$data.bien_support_niv2_libelle}</dd>
</dl>
<dl>
<dt> Objet niv2 :</dt>
<dd>{$data.objet_niv2_libelle}</dd>
</dl>
</fieldset>
</div>