<a href="index.php?module={$conflit_table}List">Retour à la liste </a>
&nbsp;
<a href="index.php?module=perimetreChange&perimetre_id={$perimetre.perimetre_id}" >Modifier...</a>
{include file="conflit/perimetreDetail.tpl"}

<table class="noborder">
<tr>
<td>
<fieldset>
<legend>Conflits rattachés</legend>
{if $droits.gestion == 1}
<a href="index.php&module=conflitChange&conflit_id=0&perimetre_id={$perimetre.perimetre_id}">
Nouveau conflit...</a>
{/if}
<table>
<thead>
<tr>
<th class="center"><img src="display/images/edit.gif" height="20"></th>
<th>Date de début</th>
<th>Date de fin</th>
<th>Détail</th>
</tr>
</thead>
<tbody>
{section name=lst loop=$conflit}
<tr>
<td class="center">
<a href="index.php?module=conflitDisplay&conflit_id={$conflit[lst].conflit_id}&perimetre_id={$perimetre.perimetre_id}">
<img src="display/images/edit.gif" height="20">
{$conflit[lst].conflit_id}
</a>
</td>
<td>{$conflit[lst].conflit_date_debut}{$conflit[lst].conflit_date_debut_txt}</td>
<td>{$conflit[lst].conflit_date_fin}{$conflit[lst].conflit_date_fin_txt}</td>
<td><span class="textareaDisplay">{$conflit[lst].conflit_detail}</span></td>
</tr>
{/section}
</tbody>
</table>
<br>
</fieldset>
</td>
</tr>
</table>
