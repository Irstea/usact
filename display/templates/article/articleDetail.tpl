<div class="formDisplay">
<fieldset>
<legend>Article n° <a href="index.php?module=articleDisplay&article_id={$article.article_id}">
{$article.article_id}
</a></legend>
<dl>
<dt> Date de parution :</dt>
<dd>{$article.date_parution}</dd>
</dl>
<dl>
<dt> Titre :</dt>
<dd>{$article.titre}</dd>
</dl>
<dl>
<dt>Auteur :</dt>
<dd>{$article.auteur}</dd>
</dl>
<dl>
<dt> Journal :</dt>
<dd>{$article.journal_libelle}</dd>
</dl>
<dl>
<dt>Édition :</dt>
<dd>{$article.edition}</dd>
</dl>
<dl>
<dt>Rubrique :</dt>
<dd>{$article.rubrique}</dd>
</dl>
<dl>
<dt>Page :</dt>
<dd>{$article.page}</dd>
</dl>
<dl>
<dt>En-tête :</dt>
<dd><div class="textareaDisplay">{$article.entete}</div></dd>
</dl>
<dl>

<dt>Pièce jointe :</dt>
<dd>{$article.piece_jointe}</dd>
</dl>
</fieldset>
</div>