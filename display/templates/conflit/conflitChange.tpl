{if $isSearch == 1}
<h2>Déclaration d'un conflit</h2>
{/if}
<a href="index.php?module=conflitListe">Retour à la liste</a>
<a href="index.php?module=conflitDisplay&id={$data.conflit_id}">Retour au détail de la fiche</a>

<form method="post" action="index.php">
<input type="hidden" name="conflit_id" value="{$data.conflit_id}">
<input type="hidden" name="module" value="conflitWrite">

<table class="tablesaisie">
<dl>
<dt>ID:</dt>
<dd><input name="conflit_id" value="{$data.conflit_id}"></dd>
</dl>
<dl>
<dt>Date de début (JJ/MM/AAAA):</dt>
<dd><input name="conflit_date_debut" value="{$data.conflit_date_debut}"></dd>
</dl>
<dl>
<dt>Date de fin (JJ/MM/AAAA):</dt>
<dd><input name="conflit_date_fin" value="{$data.conflit_date_fin}"></dd>
</dl>
<dl>
<dt>Date de saisie (JJ/MM/AAAA)<span class="red">*</span> :</dt>
<dd><input name="conflit_date_saisie" value="{$data.conflit_date_saisie}"></dd>
</dl>
<dl>
<dt>Détail sur le conflit :</dt>
<dd><input name="conflit_detail" value="{$data.conflit_detail}"></dd>
</dl>
<dl>
<dt>Login<span class="red">*</span> :</dt>

</dl>

<dl>
<dt colspan=2>
<div style="text-align:center;">
<input type="submit" name="valid" value="{$LANG.message.19}"/>
</form>
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="conflit_id" value="{$data.conflit_id}">
<input type="hidden" name="module" value="conflitDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</dt>
</dl>
</table>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>
