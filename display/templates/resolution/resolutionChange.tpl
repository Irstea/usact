<script>
$(document).ready(function() {
	$("#conflitSearch").change(function () {
		var id = $(this).val();
		/*
		* declenchement de la recherche
		*/
		var url = "index.php?module=conflitSearchAjax";
		$.getJSON ( url, { "objet_id": id } , function( data ) {
			var options = '';
			var detail = '';
			var newid = "";
			 for (var i = 0; i < data.length; i++) {
				 if (i == 0 ) {
					 newid = data[i].conflit_id;
				 }
				 detail = !data[i].conflit_detail ? "" : data[i].conflit_detail;
			        options += '<option value="' + data[i].conflit_id + '">' 
			        + data[i].conflit_id + " - " + detail
			        + '</option>';
			      };				
			$("#conflit_id").html(options);
			$("#conflit_id").val(newid);
			$("#conflit_id").change();
		} ) ;
	});
	$("#conflit_id").change(function () { 
		var id = $(this).val();
			var url = "index.php?module=solutionSearchAjax";
			$.getJSON (url, { "conflit_id": id }, function (data ) {
				var options = "";
				var libelle = "";
				var moral = "";
				var physique = "";
				for (var i = 0; i <data.length ; i++) {
					libelle = !data[i].solution_proposee_libelle ? "" : data[i].solution_proposee_libelle;
					moral = !data[i].acteur_moral_nom ? "" : data[i].acteur_moral_nom;
					physique = !data[i].acteur_physique_nom ? "" : data[i].acteur_physique_nom;
					options += '<option value="' + data[i].solution_proposee_id + '">'
					+ data[i].solution_proposee_id +  " - "
					+ moral +" " + physique
					+" - " + libelle
					+ '</option>';
				};
				$("#solution_proposee_id").html(options);
			});
		
	});
});
</script>
<h2>Nouveau/Modification d'une resolution :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
&nbsp;
<a href="index.php?module=resolutionDisplay&resolution_id={$data.resolution_id}">Retour au détail de la fiche</a>

<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="resolution_id" value="{$data.resolution_id}">
<input type="hidden" name="module" value="resolutionWrite">

<fieldset>
<legend>Résolution {if $data.resolution_id > 0}n° {$data.resolution_id}{/if}</legend>
<dl>
<dt>Objet du conflit (pour recherche) :</dt>
<dd>
<select id="conflitSearch">
{section name=lst loop=$objet_niv2}
<option value="{$objet_niv2[lst].objet_niv2_id}" {if $conflit.objet_niv2_id == $objet_niv2[lst].objet_niv2_id}selected{/if}>
{$objet_niv2[lst].objet_niv1_libelle} - {$objet_niv2[lst].objet_niv2_libelle}
</option>
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Conflit<span class="red">*</span> :</dt>
<dd><select id="conflit_id" name="conflit_id">
<option value="{$data.conflit_id}">
{$conflit.conflit_id} - {$conflit.conflit_detail}
</option>
</select>
</dd>
</dl>

<dl>
<dt>Solution proposée :</dt>
<dd>
<select id="solution_proposee_id" name="solution_proposee_id">
<option value="" {if $data.solution_proposee_id == ""}selected{/if}></option>
{section name=lst loop=$solution_proposee}
<option value="{$solution_proposee[lst].solution_proposee_id}" {if $solution_proposee[lst].solution_proposee_id == $data.solution_proposee_id}selected{/if}>
{$solution_proposee[lst].solution_proposee_id} - {$solution_proposee[lst].acteur_moral_nom} {$solution_proposee[lst].acteur_physique_nom} - {$solution_proposee[lst].solution_proposee_libelle}
</option>
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Échelle :</dt>
<dd>
<select name="resolution_echelle_id">
<option value="" {if $data.resolution_echelle_id == ""}selected{/if}></option>
{section name=lst loop=$resolution_echelle}
<option value="{$resolution_echelle[lst].resolution_echelle_id}" {if $resolution_echelle[lst].resolution_echelle_id == $data.resolution_echelle_id}selected{/if}>
{$resolution_echelle[lst].resolution_echelle_libelle}
</option>
{/section}
</select>
</dl>

<dl>
<dt>Nature :</dt>
<dd>
<select name="resolution_nature_id">
<option value="" {if $data.resolution_nature_id == ""}selected{/if}></option>
{section name=lst loop=$resolution_nature}
<option value="{$resolution_nature[lst].resolution_nature_id}" {if $resolution_nature[lst].resolution_nature_id == $data.resolution_nature_id}selected{/if}>
{$resolution_nature[lst].resolution_nature_libelle}
</option>
{/section}
</select>
</dl>

<dl>
<dt>Acteur :</dt>
<dd>
<select name="resolution_acteur_id">
<option value="" {if $data.resolution_acteur_id == ""}selected{/if}></option>
{section name=lst loop=$resolution_acteur}
<option value="{$resolution_acteur[lst].resolution_acteur_id}" {if $resolution_acteur[lst].resolution_acteur_id == $data.resolution_acteur_id}selected{/if}>
{$resolution_acteur[lst].resolution_acteur_libelle}
</option>
{/section}
</select>
</dl>

<dl>
<dt>Mode :</dt>
<dd>
<select name="resolution_mode_niv2_id">
<option value="" {if $data.resolution_mode_niv2_id == ""}selected{/if}></option>
{section name=lst loop=$resolution_mode_niv2}
<option value="{$resolution_mode_niv2[lst].resolution_mode_niv2_id}" {if $resolution_mode_niv2[lst].resolution_mode_niv2_id == $data.resolution_mode_niv2_id}selected{/if}>
{$resolution_mode_niv2[lst].resolution_mode_niv1_libelle} - {$resolution_mode_niv2[lst].resolution_mode_niv2_libelle}
</option>
{/section}
</select>
</dl>

<dl>
<dt>Détail :</dt>
<dd><textarea name="resolution_detail">{$data.resolution_detail}</textarea></dd>
</dl>

</fieldset>


<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
{if $data.resolution_id > 0}
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="resolution_id" value="{$data.resolution_id}">
<input type="hidden" name="acteur_id" value="{$data.acteur_id}">
<input type="hidden" name="conflit_id" value="{$data.conflit_id}">
<input type="hidden" name="module" value="resolutionDelete">
<div class="formBouton">
<input type="submit" value="Supprimer">
</div>
</form>
{/if}
</div>

<span class="red">*</span><span class="messagebas">Champ obligatoire</span>
