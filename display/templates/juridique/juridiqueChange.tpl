<h2>Nouveau/Modification d'un acte juridique :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
{if $data.juridique_id > 0}
&nbsp;
<a href="index.php?module=juridiqueDisplay&juridique_id={$data.juridique_id}" >
Retour au détail de l'acte juridique {$data.juridique_id}</a>
{/if}
<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="juridique_id" value="{$data.juridique_id}">
<input type="hidden" name="juridique_login" value="{$data.juridique_login}">
<input type="hidden" name="juridique_date_saisie" value="{$data.juridique_date_saisie}">
<input type="hidden" name="module" value="juridiqueWrite">

<dl>
<dt>Juridiction :</dt>
<dd>
<select name="juridiction_id" autofocus>
{section name=lst loop=$juridiction}
<option value="{$juridiction[lst].juridiction_id}" {if $juridiction[lst].juridiction_id == $data.juridiction_id}selected{/if}>
{$juridiction[lst].juridiction_libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Numéro et date de l'arrêt<span class="red">*</span> :</dt>
<dd>
<input name="arret_num" value="{$data.arret_num}" required >
<input class="date" name="arret_date" value="{$data.arret_date}" required >
</dd>
</dl>
<dl>
<dt>Date de l'acte :</dt>
<dd>
<input class="date" name="acte_date" value="{$data.acte_date}">
</dd>
</dl>
<dl>
<dt>Domaine :</dt>
<dd>
<select name="juridique_sous_domaine_id">
<option value="" {if $data.juridique_sous_domaine_id == ""}selected{/if}></option>
{section name=lst loop=$juridique_sous_domaine}
<option value="{$juridique_sous_domaine[lst].juridique_sous_domaine_id}" {if $juridique_sous_domaine[lst].juridique_sous_domaine_id == $data.juridique_sous_domaine_id}selected{/if}>
{$juridique_sous_domaine[lst].juridique_domaine_libelle} - {$juridique_sous_domaine[lst].juridique_sous_domaine_libelle}
</option>
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Nature de la requête :</dt>
<dd>
<select name="nature_requete_id">
<option value="" {if $data.nature_requete_id == ""}selected{/if}></option>
{section name=lst loop=$nature_requete}
<option value="{$nature_requete[lst].nature_requete_id}" {if $nature_requete[lst].nature_requete_id == $data.nature_requete_id}selected{/if}>
{$nature_requete[lst].nature_requete_libelle}
</option>
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Type d'ouvrage (permis de construire) :</dt>
<dd>
<select name="type_ouvrage_perm_constr_id">
<option value="" {if $data.type_ouvrage_perm_constr_id == ""}selected{/if}></option>
{section name=lst loop=$type_ouvrage_perm_constr}
<option value="{$type_ouvrage_perm_constr[lst].type_ouvrage_perm_constr_id}" {if $type_ouvrage_perm_constr[lst].type_ouvrage_perm_constr_id == $data.type_ouvrage_perm_constr_id}selected{/if}>
{$type_ouvrage_perm_constr[lst].type_ouvrage_perm_constr_libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Nature des travaux :</dt>
<dd>
<select name="nature_travaux_id">
<option value="" {if $data.nature_travaux_id == ""}selected{/if}></option>
{section name=lst loop=$nature_travaux}
<option value="{$nature_travaux[lst].nature_travaux_id}" {if $nature_travaux[lst].nature_travaux_id == $data.nature_travaux_id}selected{/if}>
{$nature_travaux[lst].nature_travaux_libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Décision en appel :</dt>
<dd>
<select name="decision_appel_id">
<option value="" {if $data.decision_appel_id == ""}selected{/if}></option>
{section name=lst loop=$decision_appel}
<option value="{$decision_appel[lst].decision_appel_id}" {if $decision_appel[lst].decision_appel_id == $data.decision_appel_id}selected{/if}>
{$decision_appel[lst].decision_appel_libelle}
</option>
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Décision en cassation :</dt>
<dd>
<select name="decision_cassation_id">
<option value="" {if $data.decision_cassation_id == ""}selected{/if}></option>
{section name=lst loop=$decision_cassation}
<option value="{$decision_cassation[lst].decision_cassation_id}" {if $decision_cassation[lst].decision_cassation_id == $data.decision_cassation_id}selected{/if}>
{$decision_cassation[lst].decision_cassation_libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Acte contentieux :</dt>
<dd>
<select name="acte_contentieux_id">
<option value="" {if $data.acte_contentieux_id == ""}selected{/if}></option>
{section name=lst loop=$acte_contentieux}
<option value="{$acte_contentieux[lst].acte_contentieux_id}" {if $acte_contentieux[lst].acte_contentieux_id == $data.acte_contentieux_id}selected{/if}>
{$acte_contentieux[lst].acte_contentieux_libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Description :</dt>
<dd>
<textarea name="juridique_libelle">{$data.juridique_libelle}</textarea> 
</dd>
</dl>

<dl>
<dt>Précision sur l'objet :</dt>
<dd>
<textarea name="objet_precision">{$data.objet_precision}</textarea>
</dd>
</dl>

<dl>
<dt>Article 1 :</dt>
<dd>
<textarea name="article1">{$data.article1}</textarea>
</dd>
</dl>
<dl>
<dt>Article 2 :</dt>
<dd>
<textarea name="article2">{$data.article2}</textarea>
</dd>
</dl>
<dl>
<dt>Article 3 :</dt>
<dd>
<textarea name="article3">{$data.article3}</textarea>
</dd>
</dl>
<dl>
<dt>Article 4 :</dt>
<dd>
<textarea name="article4">{$data.article4}</textarea>
</dd>
</dl>
<dl>
<dt>Article 5 :</dt>
<dd>
<textarea name="article5">{$data.article5}</textarea>
</dd>
</dl>

<dl>
<dt>Date de jugement - degré 1 :</dt>
<dd>
<input class="date" name="jugement_date_degre1" value="{$data.jugement_date_degre1}">
</dd>
</dl>
<dl>
<dt>Date de jugement - degré 2 :</dt>
<dd>
<input class="date" name="jugement_date_degre2" value="{$data.jugement_date_degre2}">
</dd>
</dl>

<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
<div class="formBouton">
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="juridique_id" value="{$data.juridique_id}">
<input type="hidden" name="expert_id" value="{$data.expert_id}">
<input type="hidden" name="module" value="juridiqueDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>