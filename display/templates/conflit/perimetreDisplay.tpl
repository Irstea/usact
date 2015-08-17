<a href="index.php?module=perimetreList">Retour à la liste </a>
&nbsp
<a href="index.php?module=perimetreChange&perimetre_id={$data.perimetre_id}" >Modifier...</a>

<div class="formDisplay">
<fieldset>
<legend>Informations sur le perimetre {$data.perimetre_id}</legend>
<dl>
<dt> Objet niv2 :</dt>
<dd>{$data.objet_niv2_libelle}</dd>
</dl>
<dl>
<dt> Bien support niv2 :</dt>
<dd>{$data.bien_support_niv2_libelle}</dd>
</dl>
<dl>
<dt> Description :</dt>
<dd><span class="textareaDisplay">{$data.perimetre_detail}</span></dd>
</dl>
<dl>
<dt> Récurrence :</dt>
<dd>{$data.recurrence_libelle}</dd>
</dl>
<dl>
<dt> Type:</dt>
<dd>{$data.type_perimetre_libelle}</dd>
</dl>
<dl>
<dt> Echelle :</dt>
<dd>{$data.echelle_libelle}</dd>
</dl>
</fieldset>
</div>

<table class="noborder">
<tr>
<td>
<fieldset>
<legend>Conflits rattachés</legend>
{if $droits.gestion == 1}
<a href="index.php&module=conflitChange&conflit_id=0&perimetre_id={$data.perimetre_id}">
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
{section name=lst loop=$conflitData}
<tr>
<td class="center">
<a href="index.php?module=conflitDisplay&conflit_id={$conflitData[lst].conflit_id}&perimetre_id={$data.perimetre_id}">
<img src="display/images/edit.gif" height="20">
{$conflitData[lst].conflit_id}
</a>
</td>
<td>{$conflitData[lst].conflit_date_debut}{$conflitData[lst].conflit_date_debut_txt}</td>
<td>{$conflitData[lst].conflit_date_fin}{$conflitData[lst].conflit_date_fin_txt}</td>
<td><span class="textareaDisplay">{$conflitData[lst].conflit_detail}</span></td>
</tr>
{/section}
</tbody>
</table>
<br>
</fieldset>
</td>
</tr>
</table>
