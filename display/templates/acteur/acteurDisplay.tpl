<h2>Détail d'un acteur</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste </a>
&nbsp;
<a href="index.php?module=acteurChange&acteur_id={$acteur.acteur_id}" >Modifier...</a>
{include file="acteur/acteurDetail.tpl"}

<table class="noborder">
<tr>
<td>
<fieldset>
<legend>Mandats de l'acteur</legend>
{if $droits.gestion == 1}
<a href="index.php?module=acteur_mandatChange&acteur_mandat_id=0&acteur_id={$acteur.acteur_id}">
Nouveau mandat...</a>
{/if}
<table>
<thead>
<tr>
<th>Type de mandat</th>
<th>Détail</th>
</thead>
<tbody>
{section name=lst loop=$acteur_mandat}
<tr>
<td>
{if $droits.gestion == 1}
<a href="index.php?module=acteur_mandatChange&acteur_mandat_id={$acteur_mandat[lst].acteur_mandat_id}&acteur_id={$acteur_mandat[lst].acteur_id}">
{$acteur_mandat[lst].mandat_type_libelle}
</a>
{else}
{$acteur_mandat[lst].mandat_type_libelle}
{/if}
</td>
<td>{$acteur_mandat[lst].mandat_detail}</td>
</tr>
{/section}
</tbody>
</table>
</fieldset>
<fieldset>
<legend>Rôles dans une structure</legend>
{if $droits.gestion == 1}
<a href="index.php?module=acteur_structureChange&acteur_structure_id=0&acteur_id={$acteur.acteur_id}">
Nouveau rôle...</a>
{/if}
<table>
<thead>
<tr>
<th>Type de structure</th>
<th>Statut</th>
<th>Statut détaillé</th>
</tr>
</thead>
<tbody>
{section name=lst loop=$acteur_structure}
<tr>
<td>
{if $droits.gestion == 1}
<a href="index.php?module=acteur_structureChange&acteur_structure_id={$acteur_structure[lst].acteur_structure_id}&acteur_id={$acteur.acteur_id}">
{$acteur_structure[lst].structure_type_libelle}
</a>
{else}
{$acteur_structure[lst].structure_type_libelle}
{/if}
</td>
<td>
{$acteur_structure[lst].structure_statut_libelle}
{$acteur_structure[lst].structure_statut}
</td>
<td><span class="textareaDisplay">{$acteur_structure[lst].structure_statut_detail}</span></td>
</tr>
{/section}
</tbody>
</table>
</fieldset>
<br>
<fieldset>
<legend>Interventions</legend>
{if $droits.gestion == 1}
<a href="index.php?module=interventionChange&intervention_id=0&acteur_id={$acteur.acteur_id}">
Nouvelle intervention...
</a>
{/if}
{include file="intervention/interventionList.tpl"}
</fieldset>
</td></tr></table>