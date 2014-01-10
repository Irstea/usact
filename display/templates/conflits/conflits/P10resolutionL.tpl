<p> <font size="4"><b>Relier à la résolution </b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P00accueilL" style="color:MediumBlue" title="Retour à la recherche conflit">Retour à la recherche conflit</a>
</div>

<div>
<a href="index.php?module=P06interventionsD&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}" style="color:MediumBlue" title="Retour aux listes modes action, revendications, solutions">Retour aux listes modes action, revendications, solutions</a>
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

	<tr>
		<td class="resumeTitre"> Article : </td>
		<td class="resumeInfo1" colspan="3"> <b>{$detailarticle.titrearticle} </b></td>
	</tr>
	<tr>
		<td class="resumeTitre"> Acteur : </td>
		<td class="resumeInfo1"> <b>{$detailacteur.nomacteurmoral} </b></td>
		<td class="resumeSep"> / </td>
		<td class="resumeInfo2"> <b>{$detailacteur.nomacteurphysique} </b></td>
	</tr>	
	<tr>
		<td class="resumeTitre"> Intervention : </td>
		<td class="resumeInfo1" colspan="3"> <b>{$detailinterv.positionusageactivite} </b></td>
	</tr>	
	<tr>
		<td class="resumeTitre"> Solution : </td>
		<td class="resumeInfo1" colspan="3"> <b>{$detailsolution.solutionprop} </b></td>
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

<form name=resolutionMR method="get" action="index.php">
<input type="hidden" name="module" value="P10resolutionL">
<input type="hidden" name="isSearch" value="1">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">
<input type="hidden" name="numinterv" value="{$idinterv}">
<input type="hidden" name="numsolution" value="{$idsolution}">
	
	<label for="zoneResolniv1">Résolution Niveau 1 </label>
	<input id="zoneResolniv1" name="zoneResolniv1" value="{$critere.zoneResolniv1}" size="25" maxlength="80" placeholder="Resolution Niveau 1" title="Veuillez saisir une resolution niveau 1">
	
	<label for="zoneResolmode">Mode Résolution </label>
	<input id="zoneResolmode" name="zoneResolmode" value="{$critere.zoneResolmode}" size="25" maxlength="80" placeholder="Niveau 1 ou 2" title="Veuillez saisir un mode de resolution">
	
	<input type="submit" value="Rechercher...">
		
</form>

</td>
</tr>		
<tr>
<td>

<span style="display: inline-block">
<a href="index.php?module=P10resolutionM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}&numsolution={$idsolution}&numresolution=0" style="color:MediumBlue" title="Nouvelle résolution">Nouvelle résolution</a>
</span>

<h2>Liste des resolutions :</h2>
<form name="resolutionsL" method="get" action="index.php">
<input type="hidden" name="module" value="P10resolutionL">

<script> 
setDataTables("resolutionsL",true, true, true,25,false);
</script>

<table id="resolutionsL" class="tableaffichage">
	
	<thead>
	<tr>
		<th>Modif</th>
		<th>Resolutionniv1</th>
		<th>Resolutionnivspat</th>
		<th>Resolutionnivacteur</th>
		<th>Moderesolutionniv1</th>
		<th>Moderesolutionniv2</th>
		<th>Detailresolution</th>
		
	</tr>
	</thead> 
	
	<tdata>
	{section name=lst loop=$listeresolution}
	<tr>
		<td style="text-align: center;"> <a href="index.php?module=P10resolutionM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}&numsolution={$idsolution}&numresolution={$listeresolution[lst].numresolution}"> <img src="display/images/Modif.png" height="30" border="0"> </a></td>
		<td style="text-align: center;">{$listeresolution[lst].resolutionniv1}</td>
		<td style="text-align: center;">{$listeresolution[lst].resolutionnivspat}</td>
		<td style="text-align: center;">{$listeresolution[lst].resolutionnivacteur}</td>
		<td style="text-align: center;">{$listeresolution[lst].moderesolutionniv1}</td> 
		<td style="text-align: center;">{$listeresolution[lst].moderesolutionniv2}</td> 
		<td style="text-align: center;">{$listeresolution[lst].detailresolution}</td> 
	</tr>
	{/section}
	</tdata>
		
</table>
</form>

</td>
</tr>
</table>




