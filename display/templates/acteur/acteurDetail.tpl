<div class="formDisplay">
<fieldset>
<legend>Acteur n° <a href="index.php?module=acteurDisplay&acteur_id={$acteur.acteur_id}">
{$acteur.acteur_id}
</a></legend>
<dl>
<dt> Personne physique :</dt>
<dd>{$acteur.acteur_physique_nom}
{if strlen($acteur.commune_physique) > 0}
<br>{$acteur.commune_physique} ({$acteur.cp_physique})
{/if}
</dd>
</dl>
<dl>
<dt> Personne morale :</dt>
<dd>{$acteur.acteur_moral_nom}
{if strlen($acteur.commune_morale) > 0}
<br>{$acteur.commune_morale} ({$acteur.cp_morale})
{/if}
</dd>
</dl>
<dl>
<dt>Niveau d'acteur</dt>
<dd>{$acteur.acteur_niv1_libelle}
<br>{$acteur.acteur_niv2_libelle}
<br>{$acteur.acteur_niv3_libelle}
</dd>
</dl>
<dl>
<dt> Statut :</dt>
<dd>
{$acteur.acteur_statut_libelle}
{$acteur.acteur_statut}
</dd>
</dl>
<dl>
<dt>Détail du statut :</dt>
<dd><span class="textareaDisplay">{$acteur.acteur_statut_detail}</span></dd>
</dl>
<dl>
<dt>Type de résidence (particulier) :</dt>
<dd>{$acteur.particulier_resident_type_libelle}</dd>
</dl>
</fieldset>
</div>
