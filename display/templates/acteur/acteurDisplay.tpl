<h2>Détail d'un acteur</h2>
<a href="index.php?module=acteurList">Retour à la liste </a>
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

</thead>
<tbody>

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


</thead>
<tbody>

</tbody>
</table>
</fieldset>