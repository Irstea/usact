<a href="index.php?module=conflitListe">Retour à la liste </a>
<a href="index.php?module=conflitChange&id={$data.conflit_id}" style="padding-left:6em;">Modifier...</a>
<table class="tableaffichage">
<tr>
<td class="libelleSaisie"> ID du conflit :</td>
<td>{$data.conflit_id}</td>
</tr>
<tr>
<td class="libelleSaisie"> Date début conflit :</td>
<td>{$data.conflit_date_debut}</td>
</tr>
<tr>
<td class="libelleSaisie"> Date fin conflit :</td>
<td>{$data.conflit_date_fin}</td>
</tr>
<tr>
<td class="libelleSaisie"> Date saisie conflit :</td>
<td>{$data.conflit_date_saisie}</td>
</tr>
<tr>
<td class="libelleSaisie"> Détail sur le conflit :</td>
<td>{$data.conflit_detail}</td>
</tr>
<tr>
<td class="libelleSaisie"> Login :</td>
<td>{$data.conflit_login_saisie}</td>
</tr>

</table>
