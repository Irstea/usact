<script>
$(document).ready(function() { 
	var url = "index.php";
	// Attribution de la localisation au changement dans la selection
	$("#selectLocalisation").change( function () {
		var id = $(this).val();
		$("#localisation_id").val(id);
		/*
		 * Recherche des donnees de la localisation selectionnee
		 */
		 
		 $.getJSON ( url, { "module":"localisationGet", "value": id}, function (data ) { 
			$("#inseeDisplay").val(data.commune_insee+" "+data.commune_nom);
			$("#insee").val(data.insee);
			$("#precision_adresse").val(data.precision_adresse);
			$("#wgs84x").val(data.wgs84x);
			$("#wgs84y").val(data.wgs84y);
		 });
		 /*
		var texte = $("#selectLocalisation option:selected").text();
		var champs = texte.split("/");
		var insee = champs[0].split(" ");
		$("#inseeDisplay").val(champs[0]);
		$("#insee").val(insee[0]);
		$("#precision_adresse").val(champs[1]);
		$("#wgs84x").val(champs[1]);
		$("#wgs84y").val(champs[2]);*/
	});
	
	// Attribution de la commune au changement dans la selection
	$("#selectCommune").change( function () {
		$("#insee").val($(this).val());
		var texte = $("#selectCommune option:selected").text();
		$("#inseeDisplay").val(texte);
	});
	
	// Recherche d'une localisation
	$("#search").keyup( function () {
		var search = $(this).val();
		if (search.length > 2) {
			var options = '<option></option>';
			$.getJSON ( url, { "module":"localisationSearch", "value":search}, function( data ) {			
				 for (var i = 0; i < data.length; i++) {
					 var precision_adresse = data[i].precision_adresse == null ? "" : data[i].precision_adresse;
				        options += '<option value="' + data[i].localisation_id + '"';
					        options += '>' + data[i].commune_insee +  " "+ data[i].commune_nom +"/" + precision_adresse +  '</option>';
				      };
				$("#selectLocalisation").html(options);
			} ) ;	
		}
	});

	// Recherche d'une commune
	$("#searchCommune").keyup( function () {
		var search = $(this).val();
		if (search.length > 2) {
			var url = "index.php";
			var options = '<option></option>';
			$.getJSON ( url, { "module":"communeSearch", "value":search}, function( data ) {			
				 for (var i = 0; i < data.length; i++) {
				        options += '<option value="' + data[i].insee + '"';
					        options += '>' + data[i].commune_insee +" "+ data[i].commune_nom  +  '</option>';
				      };
				$("#selectCommune").html(options);
			} ) ;	
		}
	});

	$("#localisationForm").submit(function () { 
		if ( $("#insee").val().length == 0 ) {
			$("#inseeDisplay").css("border-color", "red");
			$("#searchCommune").css("border-color", "red");
			$("#selectCommune").css("border-color", "red");
			return false;
		} else {
			$("#inseeDisplay").css("border-color", "");
		}
	});
	
} ) ;
</script>

<h2>Nouveau/Modification d'une localisation :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
<div class="formSaisie">
<fieldset>
<legend>Localisation du périmètre n° <a href="index.php?module=perimetreDisplay&perimetre_id={$data.perimetre_id}">{$data.perimetre_id}</a></legend>
<form id="localisationForm" method="post" action="index.php">
<input type="hidden" name="perimetre_id" value="{$data.perimetre_id}">
<input type="hidden" name="module" value="localisationWrite">
<input type="hidden" id="localisation_id" name="localisation_id" value="{$data.localisation_id}">
<input type="hidden" id="insee" name="insee" value="{$data.insee}">
{if $data.localisation_id == 0}
<dl><dt>Recherchez une localisation existante :</dt>
<dd><input id="search" placeholder="N° insee, commune ou adresse" class="commentaire" autocomplete="off">
<select id="selectLocalisation"></select>
</dl>
<dl><dt>ou créez une nouvelle localisation :</dt>
<dd><input id="searchCommune" placeholder="N° insee ou nom commune" autocomplete="off" >
<select id="selectCommune"></select>
</dd>
</dl>
{/if}

<dl>
<dt>Commune :
</dt>
<dd><input id="inseeDisplay" readonly value="{$data.commune_insee} {$data.commune_nom}" >
</dl>
<dl>
<dt>Description :</dt>
<dd><textarea id="precision_adresse" name="precision_adresse">{$data.precision_adresse}</textarea></dd>
</dl>
<dl>
<dt>Coordonnées GPS :</dt>
<dd>
<input class="taux" id="wgs84x" name="wgs84x" value="{$data.wgs84x}" autocomplete="off" placeholder="longitude">
<br>
<input class="taux" id="wgs84y" name="wgs84y" value="{$data.wgs84y}" autocomplete="off" placeholder="latitude">

</dl>

<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
{if $data.localisation_id > 0}
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="localisation_id" value="{$data.localisation_id}">
<input type="hidden" name="perimetre_id" value="{$data.perimetre_id}">
<input type="hidden" name="module" value="localisationDelete">
<div class="formBouton">
<input type="submit" value="Supprimer">
</div>
</form>
{/if}
</fieldset>
</div>

<span class="red">*</span><span class="messagebas">Champ obligatoire</span>

