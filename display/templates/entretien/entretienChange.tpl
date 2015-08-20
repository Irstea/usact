<h2>Nouveau/Modification d'un entretien :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
{if $data.entretien_id > 0}
&nbsp;
<a href="index.php?module=entretienDisplay&entretien_id={$data.entretien_id}" >
Retour au détail de l'entretien {$data.entretien_id}</a>
{/if}
<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="entretien_id" value="{$data.entretien_id}">
<input type="hidden" name="expert_id" value={$data.expert_id}">
<input type="hidden" name="entretien_login" value={$data.entretien_login}">
<input type="hidden" name="entretien_date_saisie" value={$data.entretien_date_saisie}">
<input type="hidden" name="module" value="entretienWrite">

<dl>
<dt>Date de l'entretien<span class="red">*</span> :</dt>
<dd>
<input class="date" name="entretien_date" value="{$data.entretien_date}" required autofocus>
</dd>
</dl>
<dl>
<dt>Institution représentée<span class="red">*</span> :</dt>
<dd>
<input name="institution" value="{$data.institution}" required>
</dd>
</dl>
<dl>
<dt>Statut de l'interviewé<span class="red">*</span> :</dt>
<dd>
<input name="statut" value="{$data.statut}" required>

</dd>
</dl>
<dl>
<dt>Localisation<span class="red">*</span> :</dt>
<dd>
<input name="localisation" value="{$data.localisation}" >
</dd>
</dl>
<dl>
<dt>Binôme<span class="red">*</span> :</dt>
<dd>
<input name="binome" value="{$data.binome}" >

</dd>
</dl>
<dl>
<dt>Pièce jointe :</dt>
<dd>
<input class="commentaire" name="piece_jointe" value="{$data.piece_jointe}">
</dd>
</dl>

<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
<div class="formBouton">
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="entretien_id" value="{$data.entretien_id}">
<input type="hidden" name="expert_id" value={$data.expert_id}">
<input type="hidden" name="module" value="entretienDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>