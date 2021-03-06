<script>

$(document).ready(function() { 
	
	function searchFromPerimetre ( typePer ) {
		// Recherche des nouvelles valeurs pour les objets
		var options = "";
		var url = "index.php";
		var oldValue = $("#objet_niv2_id").val();
		$.getJSON ( url, { "module":"objetGetFromPerimetre", "value":typePer}, function( data ) {			
			 for (var i = 0; i < data.length; i++) {
			        options += '<option value="' + data[i].id + '"';
			        if (oldValue == data[i].id) {
			        	options += "selected";
			        }
			        options += '>' + data[i].parent_libelle + " - " + data[i].libelle +  '</option>';
			      };
			$("#objet_niv2_id").html(options);
		} ) ;	
	};
	
	// Recherche le type de perimetre a l'ouverture
	var tp = $('#type_perimetre_id').val();
	if (tp == 1) {
		$("#bienSupport").hide();		
	}
	// Initialisation de la liste des objets
	searchFromPerimetre(tp);

	
	$("#type_perimetre_id").change( function () { 
		var tp = $(this).val();
		if (tp == 1) {
			$("#bienSupport").hide();
		} else {
			$("#bienSupport").show();
		}
		searchFromPerimetre(tp);
	});
} ) ;
</script>

<h2>Nouveau/Modification perimetre :</h2>
<a href="index.php?module={$conflit_table}List">Retour à la liste</a>
{if $data.perimetre_id > 0}
&nbsp;
<a href="index.php?module=perimetreDisplay&perimetre_id={$data.perimetre_id}" >
Retour au détail du périmètre {$data.perimetre_id}</a>
{/if}
<div class="formSaisie">
<form method="post" action="index.php">
<input type="hidden" name="perimetre_id" value="{$data.perimetre_id}">
<input type="hidden" name="module" value="perimetreWrite">
<input type="hidden" name="perimetre_date_saisie" value="{$data.perimetre_date_saisie}">
<input type="hidden" name="perimetre_login" value="{$data.perimetre_login}">

<dl>
<dt>Type <span class="red">*</span> :</dt>
<dd>
<select id="type_perimetre_id" name="type_perimetre_id" autofocus>
{section name=lst loop=$type_perimetre}
{strip}
<option value="{$type_perimetre[lst].type_perimetre_id}"
{if $type_perimetre[lst].type_perimetre_id == $data.type_perimetre_id} selected{/if}
>
{$type_perimetre[lst].type_perimetre_libelle}
</option>{/strip}
{/section}
</select>
</dd>
</dl>
<dl>
<dt>Objet niv2<span class="red">*</span> :</dt>
<dd>
<select id="objet_niv2_id" name="objet_niv2_id">
<option value = "" selected>Selectionner ...</option>
{section name=lst loop=$objet_niv2}
{strip}
<option value="{$objet_niv2[lst].objet_niv2_id}"
{if $objet_niv2[lst].objet_niv2_id == $data.objet_niv2_id} selected{/if}
>
{$objet_niv2[lst].objet_niv1_libelle} - {$objet_niv2[lst].objet_niv2_libelle}
</option>{/strip}
{/section}
</select>
</dd>
</dl>

<dl id="bienSupport">
<dt>Bien support niv2 :</dt>
<dd>
<select name="bien_support_niv2_id">
<option value = "" selected {if $data.bien_support_niv2_id == ""}selected{/if}></option>
{section name=lst loop=$bien_support_niv2}
{strip}
<option value="{$bien_support_niv2[lst].bien_support_niv2_id}"
{if $bien_support_niv2[lst].bien_support_niv2_id == $data.bien_support_niv2_id} selected{/if}
>
{$bien_support_niv2[lst].bien_support_niv1_libelle} - {$bien_support_niv2[lst].bien_support_niv2_libelle}
</option>{/strip}
{/section}
</select>
</dd>
</dl>

<dl>
<dt>Description :</dt>
<dd><textarea name="perimetre_detail" autofocus>{$data.perimetre_detail}</textarea>
<!-- input class="commentaire" name="perimetre_detail" value="{$data.perimetre_detail}" autofocus-->
</dd>
</dl>

<dl>
<dt>Recurrence :</dt>
<dd>
<select name="recurrence_id">
<option value = "" {if $data.recurrence_id==""}selected{/if}></option>
{section name=lst loop=$recurrence}
{strip}
<option value="{$recurrence[lst].recurrence_id}" {if $recurrence[lst].recurrence_id == $data.recurrence_id}selected{/if}
>
{$recurrence[lst].recurrence_libelle}
</option>{/strip}
{/section}
</select>
</dd>
</dl>



<dl>
<dt>Echelle :</dt>
<dd>
<select name="echelle_id">
<option value = "" selected>Selectionner ...</option>
{section name=lst loop=$echelle}
{strip}
<option value="{$echelle[lst].echelle_id}"
{if $echelle[lst].echelle_id == $data.echelle_id} selected{/if}
> 
{$echelle[lst].echelle_libelle}
</option>{/strip}
{/section}
</select>
</dd>
</dl>


<div class="formBouton">
<input class="submit" type="submit" value="Enregistrer">
</div>
</form>
<div class="formBouton">
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="perimetre_id" value="{$data.perimetre_id}">
<input type="hidden" name="module" value="perimetreDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</div>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>