<div class="formDisplay">
<fieldset>
<legend>Intervention n° 
<a href="index.php?module=interventionDisplay&intervention_id={$intervention.intervention_id}">
{$intervention.intervention_id}</a>
</legend>
<dl>
<dt>Activité d'usage :</dt>
<dd>{$intervention.usage_activite_niv1_libelle} - {$intervention.usage_activite_niv2_libelle}</dd>
</dl>
<dl>
<dt>Position :</dt>
<dd>{$intervention.position_usage_activite_libelle}</dd>
</dl>
<dl>
<dt>Rôle :</dt>
<dd>{$intervention.role_libelle}</dd>
</dl>
<dl>
<dt>Détail :</dt>
<dd>{$intervention.intervention_detail_usage}</dd>
</dl>
<dl>
<dt>Date d'entrée :</dt>
<dd>{$intervention.intervention_date_entree}{$intervention.intervention_date_entree_txt}</dd>
</dl>
<dl>
<dt>Date de sortie :</dt>
<dd>{$intervention.intervention_date_sortie}{$intervention.intervention_date_sortie_txt}</dd>
</dl>

</fieldset>
</div>