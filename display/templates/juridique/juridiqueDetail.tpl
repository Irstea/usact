<div class="formDisplay">
<fieldset>
<legend>Acte juridique n° <a href="index.php?module=juridiqueDisplay&juridique_id={$juridique.juridique_id}">
{$juridique.juridique_id}
</a></legend>
<dl>
<dt>Juridiction :</dt>
<dd>{$juridique.juridiction_libelle}</dd>
</dl>
<dl>
<dt>Arrêt : numéro et date :</dt>
<dd>{$juridique.arret_num} {$juridique.arret_date}</dd>
</dl>
<dl>
<dt>Date de l'acte :</dt>
<dd>{$juridique.acte_date}</dd>
</dl>
<dl>
<dt>Description :</dt>
<dd>{$juridique.juridique_libelle}</dd>
</dl>
<dl>
<dt>Précisions sur l'objet :</dt>
<dd><span class="textareaDisplay">{$juridique.objet_precision}</span></dd>
</dl>
<dl>
<dt>Domaine :</dt>
<dd>{$juridique.juridique_domaine_libelle}<br>
{$juridique.juridique_sous_domaine_libelle}</dd>
</dl>
<dl>
<dt>Nature de la requête :</dt>
<dd>{$juridique.nature_requete_libelle}</dd>
</dl>
<dl>
<dt>Type d'ouvrage (permis de construire) :</dt>
<dd>{$juridique.type_ouvrage_perm_constr_libelle}</dd>
</dl>
<dl>
<dt>Nature des travaux :</dt>
<dd>{$juridique.nature_travaux_libelle}</dd>
</dl>
<dl>
<dt>Décision en appel :</dt>
<dd>{$juridique.decision_appel_libelle}</dd>
</dl>
<dl>
<dt>Décision en cassation :</dt>
<dd>{$juridique.decision_cassation_libelle}</dd>
</dl>
<dl>
<dt>Acte contentieux :</dt>
<dd>{$juridique.acte_contentieux_libelle}</dd>
</dl>
<dl>
<dt>Article 1 :</dt>
<dd><span class="textareaDisplay">{$juridique.article1}</span></dd>
</dl>
<dl>
<dt>Article 2 :</dt>
<dd><span class="textareaDisplay">{$juridique.article2}</span></dd>
</dl>
<dl>
<dt>Article 3 :</dt>
<dd><span class="textareaDisplay">{$juridique.article3}</span></dd>
</dl>
<dl>
<dt>Article 4 :</dt>
<dd><span class="textareaDisplay">{$juridique.article4}</span></dd>
</dl>
<dl>
<dt>Article 5 :</dt>
<dd><span class="textareaDisplay">{$juridique.article5}</span></dd>
</dl>

<dl>
<dt>Date de jugement (1er degré) :</dt>
<dd>{$juridique.jugement_date_degre1}</dd>
</dl>
<dl>
<dt>Date de jugement (2nd degré)</dt>
<dd>{$juridique.jugement_date_degre2}</dd>
</dl>


</fieldset>
</div>