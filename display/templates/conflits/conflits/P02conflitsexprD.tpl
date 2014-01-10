<p> <font size="4"><b>Relier aux sources d'informations</b></font></p> 

<div>
<a href="index.php?module=P00accueilL" style="color:MediumBlue" title="Retour à la recherche par date et localisation">Retour à la recherche conflit</a>
</div>

<div>
<a href="index.php?module=P01conflitsD&numconflit={$idconflit}" style="color:MediumBlue" title="Retour aux listes date et ville">Retour aux listes expression et ville</a>
</div>

<br>

<style type="text/css">
 {literal}
 /* Affichage */
td.resumeTitre {
  margin-left: auto; 
  margin-right: auto;   
  vertical-align:top;
}
td.resumeInfo1 {
  margin-left: auto; 
  margin-right: auto;  
  vertical-align:top;
}
td.resumeSep {
  text-align:center;
  margin-left: auto; 
  margin-right: auto;
  vertical-align:top;   
}
td.resumeInfo2 {  
  margin-left: auto; 
  margin-right: auto;   
  vertical-align:top;
}
 {/literal}
</style>

<table class="tableaffichage">
		
	<tr> 
		<td class="resumeTitre"> Conflit de type : </td>
		<td class="resumeInfo1" colspan="3"> <b>{$detailconflits.typeconflit} </b></td>
	</tr>
	
	<tr>		
		<td class="resumeTitre"> Bien Support : </td>
		<td class="resumeInfo1"> <b>{$detailconflits.biensupportniv1} </b></td>
		<td class="resumeSep"> / </td>
		<td class="resumeInfo2"> <b>{$detailconflits.biensupportniv2} </b></td>
	</tr>
	
	<tr>		
		<td class="resumeTitre"> Objet Niveau : </td>
		<td class="resumeInfo1"> <b>{$detailconflits.objetniv1} </b></td>
		<td class="resumeSep"> / </td>
		<td class="resumeInfo2"> <b>{$detailconflits.objetniv2} </b></td>
	</tr>
	<tr>			
		<td class="resumeTitre"> Date du : </td>
		<td class="resumeInfo1"> <b>{$detailconflitsexpr.datedebut} </b></td>
		<td class="resumeSep"> au </td>
		<td class="resumeInfo2"> <b>{$detailconflitsexpr.datefin} </b></td>
	</tr>
	<tr>			
		<td class="resumeTitre"> Ville : </td>
		<td class="resumeInfo1" colspan="3"> <b>{$detailville.nomville} </b></td>
	</tr>
	<tr>
		<td class="resumeTitre"> Localisation : </td>
		<td class="resumeInfo1" colspan="3"> <b>{$detaillocalisation.nomlocalisation} </b></td>
	</tr>
	
</table>

<br>

<style type="text/css">
{literal}
 /* Affichage */
label {
  display: inline-block;
  margin-right: 3px;   
}

input[type=submit] {
  display: inline-block;
  width: 120px;
  padding:1px;
  margin-left:4px;
}
{/literal}
</style>		


<table class="tableaffichage">	
<tr>
<td>

<form name=articlesMR method="get" action="index.php">
<input type="hidden" name="module" value="P02conflitsexprD">
<input type="hidden" name="isSearch" value="1">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">

	
	<label for="zoneTitre">Article </label>
	<input id="zoneTitre" name="zoneTitre" value="{$critereart.zoneTitre}" size="20" maxlength="80" placeholder="Titre" title="Veuillez saisir un titre">
		
	<label for="zoneAuteur">Auteur </label>
	<input id="zoneAuteur" name="zoneAuteur" value="{$critereart.zoneAuteur}" size="20" maxlength="80" placeholder="Auteur" title="Veuillez saisir un auteur">
		
	<label for="zoneDateParutionJ">Date </label>
	<input id="zoneDateParutionJ" name="zoneDateParutionJ" value="{$critereart.zoneDateParutionJ}" size="2" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])" maxlength="2"  placeholder="jj" title="Veuillez saisir un jour">

	<label for="zoneDateParutionM"> / </label>
	<input id="zoneDateParutionM" name="zoneDateParutionM" value="{$critereart.zoneDateParutionM}" size="2"  pattern="(0[1-9]|1[0-2])" maxlength="2" placeholder="mm" title="Veuillez saisir un mois">

	<label for="zoneDateParutionA"> / </label>
	<input id="zoneDateParutionA" name="zoneDateParutionA" value="{$critereart.zoneDateParutionA}" size="4" maxlength="4" placeholder="aaaa" title="Veuillez saisir une année">

	<input type="submit" value="Rechercher...">

</form>

</td>
</tr>		

<tr>
<td>

<span style="display: inline-block">
<a href="index.php?module=P05articlesL&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}" style="color:MediumBlue" title="Recherche article">Recherche article</a>
</span>

<h2>Liste des articles :</h2>
<form name="articlesL" method="get" action="index.php">
<input type="hidden" name="module" value="P02conflitsexprD">

<script> 
setDataTables("articlesL",true, true, true,25,false);
</script>

<table id="articlesL" class="tableaffichage">
	
	<thead>
	<tr>
		<th>Détail</th>
		<th>TitreArticle</th>
		<th>AuteurArticle</th>
		<th>DateParution</th>
		<th>NomJournal</th>
		<th>TypeContenu</th>
		
	</tr>
	</thead> 
	
	<tdata>
	{section name=lst loop=$listearticles}
	<tr>
		<td style="text-align: center;"> <a href="index.php?module=P04acteursL&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$listearticles[lst].numarticle}"> <img src="display/images/Notes.png" height="30" border="0"> </a></td>
		<td style="text-align: center;">{$listearticles[lst].titrearticle}</td>
		<td style="text-align: center;">{$listearticles[lst].auteurarticle}</td>
		<td style="text-align: center;">{$listearticles[lst].dateparution}</td>
		<td style="text-align: center;">{$listearticles[lst].nomjournal}</td>
		<td style="text-align: center;">{$listearticles[lst].typecontenu}</td>
	</tr>
	{/section}
	</tdata>	
	
</table>
</form>	

</td>
</tr>
</table>	


