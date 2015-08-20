<script>
$(document).ready(function() {
	$("#acteurSearch").keyup(function() {
		/*
		* Traitement de la recherche d'une espèce/type
		*/
		var texte = $(this).val();
		if (texte.length > 2) {
			/*
			* declenchement de la recherche
			*/
			var url = "index.php?module=acteurSearchAjax";
			$.getJSON ( url, { "libelle": texte } , function( data ) {
				var options = '';
				var moral = '';
				var physique = '';
				 for (var i = 0; i < data.length; i++) {
					 moral = !data[i].acteur_moral_nom ? "" : data[i].acteur_moral_nom;
					 physique = !data[i].acteur_physique_nom ? "" : data[i].acteur_physique_nom;
				        options += '<option value="' + data[i].acteur_id + '">' 
				        + data[i].acteur_id + " - "+ moral 
				        + " " + physique
				        + '</option>';
				      };				
				$("#acteur_id").html(options);
			} ) ;
		};
	} );
});
</script>
<h2>Nouveau/Modification d'un expert :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
{if $data.expert_id > 0}
&nbsp;
<a href="index.php?module=expertDisplay&expert_id={$data.expert_id}" >
Retour au détail de l'expert {$data.expert_id}</a>
{/if}
<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="expert_id" value="{$data.expert_id}">
<input type="hidden" name="module" value="expertWrite">

<dl>
<dt>Nom<span class="red">*</span> :</dt>
<dd>
<input name="expert_nom" value="{$data.expert_nom}" required autofocus>
</dd>
</dl>
<dl>
<dt>Prénom<span class="red">*</span> :</dt>
<dd>
<input name="expert_prenom" value="{$data.expert_prenom}" required>
</dd>
</dl>
<dl>
<dt>Sexe<span class="red">*</span> :</dt>
<dd>
<input type="radio" name="sexe" value="H" {if $data.sexe=="H"}checked{/if} >Homme
<br>
<input type="radio" name="sexe" value="F" {if $data.sexe=="F"}checked{/if} >Femme
</dd>
</dl>
<dl>
<dt>Commune de résidence :</dt>
<dd>
<input name="commune_residence" value="{$data.commune_residence}" >
</dd>
</dl>
<dl>
<dt>Lien avec le territoire<span class="red">*</span> :</dt>
<dd>
<textarea name="lien_territoire" required>{$data.lien_territoire}</textarea>
</dd>
</dl>
<dl>
<dt>Activité associative :</dt>
<dd>
<input class="commentaire" name="activite_assoc" value="{$data.activite_assoc}">
</dd>
</dl>
<dl>
<dt>Activité professionnelle<span class="red">*</span> :</dt>
<dd>
<input class="commentaire" name="activite_prof" value="{$data.activite_prof}" required>
</dd>
</dl>
<dl>
<dt>Année de naissance :</dt>
<dd>
<input class="num5" value="{$data.annee_naissance}" name="annee_naissance">
</dd>
</dl>
<dl>
<dt>Correspond à l'acteur :</dt>
<dd>
<input id="acteurSearch" placeholder="Nom à rechercher..." class="commentaire">
<br>
<select id="acteur_id" name="acteur_id">
<option value="{$data.acteur_id}">
{$acteur.acteur_id} - {$acteur.acteur_moral_nom} {$acteur.acteur_physique_nom}
</option>
</select>
</dd>
</dl>
<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
<div class="formBouton">
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="expert_id" value="{$data.expert_id}">
<input type="hidden" name="module" value="expertDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>