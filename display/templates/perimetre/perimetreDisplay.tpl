<a href="index.php?module=perimetreListe">Retour à la liste </a>
&nbsp
<a href="index.php?module=perimetreChange&id={$data.perimetre_id}" >Modifier...</a>

<div class="formSaisie">
<dl>
<dt class="libelleSaisie"> Récurrence du périmetre :</dt>
<dd>{$data.recurrence}</dd>
</dl>
<dl>
<dt class="libelleSaisie"> Date de saisie du périmetre :</dt>
<dd>{$data.perimetre_date_saisie}</dd>
</dl>
<dl>
<dt class="libelleSaisie"> Détail sur le périmetre :</dt>
<dd>{$data.perimetre_detail}</dd>
</dl>
<dl>
<dt class="libelleSaisie"> Type de perimetre :</dt>
<dd>{$data.type_perimetre_libelle}</dd>
</dl>
<dl>
<dt class="libelleSaisie"> Echelle du perimetre :</dt>
<dd>{$data.echelle_libelle}</dd>
</dl>
<dl>
<dt class="libelleSaisie"> Bien support niv2 :</dt>
<dd>{$data.bien_support_niv2_libelle}</dd>
</dl>
<dl>
<dt class="libelleSaisie"> Objet niv2 :</dt>
<dd>{$data.objet_niv2_libelle}</dd>
</dl>
</div>