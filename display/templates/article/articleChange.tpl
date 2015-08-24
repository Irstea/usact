<h2>Nouveau/Modification d'un article :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
{if $data.article_id > 0}
&nbsp;
<a href="index.php?module=articleDisplay&article_id={$data.article_id}" >
Retour au détail de l'article {$data.article_id}</a>
{/if}
<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="article_id" value="{$data.article_id}">
<input type="hidden" name="article_login" value="{$data.article_login}">
<input type="hidden" name="article_date_saisie" value="{$data.article_date_saisie}">
<input type="hidden" name="module" value="articleWrite">

<dl>
<dt>Date de parution de l'article<span class="red">*</span> :</dt>
<dd>
<input class="date" name="article_date" value="{$data.article_date}" required autofocus>
</dd>
</dl>
<dl>
<dt>Titre<span class="red">*</span> :</dt>
<dd>
<input class="commentaire" name="titre" value="{$data.titre}" required >
</dd>
</dl>
<dl>
<dt>Auteur<span class="red">*</span> :</dt>
<dd>
<input class="commentaire" name="auteur" value="{$data.auteur}" required >
</dd>
</dl>
<dl>
<dt>Journal<span class="red">*</span> :</dt>
<dd>
<select name="journal_id">
{section name=lst loop=$journal}
<option value="{$journal[lst].journal_id}" {if $journal[lst].journal_id == $data.journal_id}selected{/if}>
{$journal[lst].journal_libelle}
</option>
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Édition :</dt>
<dd>
<input  name="edition" value="{$data.edition}">
</dd>
</dl>
<dl>
<dt>Rubrique :</dt>
<dd>
<input  name="rubrique" value="{$data.rubrique}">
</dd>
</dl>
<dl>
<dt>Page :</dt>
<dd>
<input class="num5" name="page" value="{$data.page}">
</dd>
</dl>
<dl>
<dt>Pièce jointe :</dt>
<dd>
<input class="commentaire" name="piecejointe" value="{$data.piecejointe}">
</dd>
</dl>



<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
<div class="formBouton">
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="article_id" value="{$data.article_id}">
<input type="hidden" name="expert_id" value="{$data.expert_id}">
<input type="hidden" name="module" value="articleDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>