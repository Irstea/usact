<a href="index.php?module=conflitListe">Retour à la liste </a>
<a href="index.php?module=conflitChange&id={$data.conflit_id}" style="padding-left:6em;">Modifier...</a>
<table class="tableaffichage">
<tr>
<td class="libelleSaisie"> ID du conflit :</td>
<td>{$data.conflit_id}</td>
</tr>
<tr>
<td class="libelleSaisie"> Nom - Prénom (conflit):</td>
<td>{$data.personne_saisie_conflit_nom} {$data.personne_saisie_conflit_prenom}</td>
</tr>
<tr>
<td class="libelleSaisie"> Mail :</td>
<td>{$data.personne_saisie_conflit_mail}</td>
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
<td class="libelleSaisie"> Récurrence :</td>
<td>{$data.recurrence} fois</td>
</tr>
<tr>
<td class="libelleSaisie"> Date saisie périmetre :</td>
<td>{$data.perimetre_date_saisie}</td>
</tr>
<tr>
<td class="libelleSaisie"> Détail sur le périmetre :</td>
<td>{$data.perimetre_detail}</td>
</tr>
<tr>
<td class="libelleSaisie"> Bien support niv1 :</td>
<td>{$data.bien_support_niv1_libelle}</td>
</tr>
<tr>
<td class="libelleSaisie"> Bien support niv2 :</td>
<td>{$data.bien_support_niv2_libelle}</td>
</tr>
<tr>
<td class="libelleSaisie"> Type périmetre :</td>
<td>{$data.type_perimetre_libelle}</td>
</tr>
<tr>
<td class="libelleSaisie"> Echelle :</td>
<td>{$data.echelle_libelle}</td>
</tr>
<tr>
<td class="libelleSaisie"> Objet niv1 :</td>
<td>{$data.objet_niv1_libelle}</td>
</tr>
<tr>
<td class="libelleSaisie"> Objet niv2 :</td>
<td>{$data.objet_niv2_libelle}</td>
</tr>
<tr>
<td class="libelleSaisie"> Nom - Prénom (périmetre) :</td>
<td>{$data.personne_saisie_perimetre_nom} {$data.personne_saisie_perimetre_prenom}</td>
</tr>
<tr>
<td class="libelleSaisie"> Mail :</td>
<td>{$data.personne_saisie_perimetre_mail}</td>
</tr>
</table>
