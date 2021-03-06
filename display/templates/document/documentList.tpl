<link rel="stylesheet" href="display/javascript/magnific-popup/magnific-popup.css"> 
<script src="display/javascript/magnific-popup/jquery.magnific-popup.min.js"></script> 
<script>
$(document).ready(function() { 
	setDataTables("documentList");
	$('.image-popup-no-margins').magnificPopup( {
		type: 'image',
		closeOnContentClick: true,
		closeBtnInside: false,
		fixedContentPos: true,
		mainClass: 'mfp-no-margins mfp-with-zoom', // class to remove default margin from left and right side
		image: {
			verticalFit: false
		},
		zoom: {
			enabled: true,
			duration: 300 // don't foget to change the duration also in CSS
		}
	});
	var documentChangeShow = 0;
	$('#documentChange').hide("") ;
	$('#documentChangeActivate').click(function () {
		if (documentChangeShow == 0) {
			$('#documentChange').show("");
			documentChangeShow = 1 ;
			 $("html, body").animate({ scrollTop: $(document).height() }, 1000);
		} else {
			$('#documentChange').hide("");
			documentChangeShow = 0 ;
		}
	});
} ) ;
</script>
{if $droits["gestion"] == 1 } 
<a href="#" id="documentChangeActivate">Saisir un nouveau document...</a>
<div id="documentChange" hidden="true">
{include file="document/documentChange.tpl"}
</div>
{/if}
<table id="documentList" class="tableliste">
<thead>
<tr>
<th>Vignette</th>
<th>Nom du document</th>
<th>Description</th>
<th>Taille</th>
<th>Date<br>d'import</th>
{if $droits["gestion"] == 1}
<th>Supprimer</th>
{/if}
</tr>
</thead>
<tdata>
{section name=lst loop=$dataDoc}
<tr>
<td class="center">
{if strlen($dataDoc[lst].photo_preview) > 0 }
<a class="image-popup-no-margins" href="index.php?module=documentSent&document_id={$dataDoc[lst].document_id}&filename={$dataDoc[lst].photo_preview}" title="aperçu de la photo : {$dataDoc[lst].photo_name}">
<img src="index.php?module=documentSent&document_id={$dataDoc[lst].document_id}&filename={$dataDoc[lst].thumbnail_name}" height="30">
</a>
{elseif strlen($dataDoc[lst].thumbnail_name) > 0 }
<a class="image-popup-no-margins" href="index.php?module=documentSent&document_id={$dataDoc[lst].document_id}&filename={$dataDoc[lst].thumbnail_name}" title="aperçu du document : {$dataDoc[lst].thumbnail_name}">
<img src="index.php?module=documentSent&document_id={$dataDoc[lst].document_id}&filename={$dataDoc[lst].thumbnail_name}" height="30">
</a>
{/if}
<td>
<a href="index.php?module=documentSent&document_id={$dataDoc[lst].document_id}&filename={$dataDoc[lst].photo_name}&attached=1" title="document original">
{$dataDoc[lst].document_nom}
</a>
</td>
<td>{$dataDoc[lst].document_description}</td>
<td>{$dataDoc[lst].size}</td>
<td>{$dataDoc[lst].document_date_import}</td>
{if $droits["gestion"] == 1}
<td>
<div class="center">
<a href="index.php?module=documentDelete&document_id={$dataDoc[lst].document_id}&moduleParent={$moduleParent}&parentIdName={$parentIdName}&parent_id={$parent_id}&parentType={$parentType}" onclick="return confirm('Confirmez-vous la suppression ?');">
<img src="display/images/corbeille.png" height="20">
</a>
</div>
</td>
{/if}
</tr>
{/section}
</tdata>
</table>