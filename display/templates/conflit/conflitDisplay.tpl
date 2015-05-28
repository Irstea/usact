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
</fieldset>
</div>