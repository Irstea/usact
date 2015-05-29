<a href="index.php?module=conflitListe">Retour à la liste </a>
&nbsp
<a href="index.php?module=conflitChange&id={$data.conflit_id}">Modifier...</a>
<div class="formDisplay">
<fieldset>
<legend>Informations sur le conflit</legend>
<dl>
<dt> Description :</dt>
<dd>{$data.conflit_detail}</dd>
</dl>
<dl>
<dt> Date début :</dt>
<dd>{$data.conflit_date_debut}</dd>
</dl>
<dl>
<dt> Date fin :</dt>
<dd>{$data.conflit_date_fin}</dd>
</dl>
<dl>
<dt> Date saisie :</dt>
<dd>{$data.conflit_date_saisie}</dd>
</dl>
<dl>
<dt> Descritpion perimetre :</dt>
<dd>{$data.perimetre_detail}</dd>
</dl>
<dl>
<dt> Bien support niv2 :</dt>
<dd>{$data.bien_support_niv2_libelle}</dd>
</dl>
<dl>
<dt> Type perimetre :</dt>
<dd>{$data.type_perimetre_libelle}</dd>
</dl>
<dl>
<dt> Echelle perimetre :</dt>
<dd>{$data.echelle_libelle}</dd>
</dl>
<dl>
<dt> Objet niv2 :</dt>
<dd>{$data.objet_niv2_libelle}</dd>
</dl>
</fieldset>
</div>