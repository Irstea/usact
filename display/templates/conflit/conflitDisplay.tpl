<a href="index.php?module=conflitListe">Retour à la liste </a>
<a href="index.php?module=conflitChange&id={$data.conflit_id}" style="padding-left:4em;">Modifier...</a>
<table class="tableaffichage">
<tr>
<td class="libelleSaisie"> ID du conflit :</td>
<td>{$data.conflit_id}</td>
</tr>
<tr>
<td class="libelleSaisie"> Nom :</td>
<td>{$data.personne_saisie_conflit_nom}</td>
</tr>
<tr>
<td class="libelleSaisie"> Prénom :</td>
<td>{$data.personne_saisie_conflit_prenom}</td>
</tr>
<tr>
<td class="libelleSaisie"> Date de début :</td>
<td>{$data.conflit_date_debut}</td>
</tr>
<tr>
<td class="libelleSaisie"> Date de fin :</td>
<td>{$data.conflit_date_fin}</td>
</tr>
<tr>
<td class="libelleSaisie"> Date de saisie :</td>
<td>{$data.conflit_date_saisie}</td>
</tr>
<tr>
<td class="libelleSaisie"> Détail sur le conflit :</td>
<td>{$data.conflit_detail}</td>
</tr>
</table>
