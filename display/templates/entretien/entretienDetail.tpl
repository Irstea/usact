<div class="formDisplay">
<fieldset>
<legend>Entretien n° <a href="index.php?module=entretienDisplay&entretien_id={$entretien.entretien_id}">
{$entretien.entretien_id}
</a></legend>
<dl>
<dt> Date :</dt>
<dd>{$entretien.entretien_date}</dd>
</dl>
<dl>
<dt> Institution représentée :</dt>
<dd>{$entretien.institution}</dd>
</dl>
<dl>
<dt>Statut de l'interviewé :</dt>
<dd>{$entretien.statut}</dd>
</dl>
<dl>
<dt> Localisation :</dt>
<dd>{$entretien.localisation}</dd>
</dl>
<dl>
<dt>Binôme :</dt>
<dd>{$entretien.binome}</dd>
</dl>
<dl>
<dt>Pièce jointe :</dt>
<dd>{$entretien.piece_jointe}</dd>
</dl>
</fieldset>
</div>