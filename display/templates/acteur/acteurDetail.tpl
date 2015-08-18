<div class="formDisplay">
<fieldset>
<legend>Acteur n° <a href="index.php?module=acteurDisplay&acteur_id={$acteur.acteur_id}">
{$acteur.acteur_id}
</a></legend>
<dl>
<dt> Personne physique :</dt>
<dd>{$acteur.acteur_physique_nom}
{if strlen($data[lst].commune_physique) > 0}
<br>{$data[lst].commune_physique} ({$data[lst].cp_physique)
{/if}
</dd>
</dl>
<dl>
<dt> Personne morale :</dt>
<dd>{$acteur.acteur_moral_nom}
{if strlen($data[lst].commune_morale) > 0}
<br>{$data[lst].commune_morale} ({$data[lst].cp_morale)
{/if}
</dd>
</dl>
<dl>
<dt> Statut :</dt>
<dd>{$acteur.acteur_statut}</dd>
</dl>
<dl>
<dt>Détail du statut :</dt>
<dd><span class="textareaDisplay">{$acteur.acteur_statut_detail}</span></dd>
</dl>
</fieldset>
</div>