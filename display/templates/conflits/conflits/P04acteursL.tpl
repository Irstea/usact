<p> <font size="4"><b>Relier à l'acteur</b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P02conflitsexprD&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}" style="color:MediumBlue" title="Retour à la liste article">Retour à la liste article</a>
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

<form name=acteursMR method="get" action="index.php">
<input type="hidden" name="module" value="P04acteursL">
<input type="hidden" name="isSearch" value="1">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">

	<label for="zoneNom">Acteur </label>
	<input id="zoneNom" name="zoneNom" value="{$critereact.zoneNom}" size="20" maxlength="80" placeholder="Nom" title="Veuillez saisir le nom de l'acteur">
	
	<label for="zoneVille">Ville </label>
	<input id="zoneVille" name="zoneVille" value="{$critereact.zoneVille}" size="20" maxlength="80" placeholder="Ville" title="Veuillez saisir le nom de la ville">
	
	<input type="submit" value="Rechercher...">

</form>

</td>
</tr>
<tr>
<td>

<span style="display: inline-block">
<a href="index.php?module=P04acteursM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur=0" style="color:MediumBlue" title="Nouveau acteur">Nouveau acteur</a>
</span>

<h2>Liste des acteurs :</h2>
<form name="acteursL" method="get" action="index.php">
<input type="hidden" name="module" value="P04acteursL">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">

<script> 
setDataTables("acteursL",true, true, true,25,false);
</script>

<table id="acteursL" class="tableaffichage">
	
	<thead>
	<tr>
		<th>Détail</th>		
		<th>Modif</th>
		<th>NomMoral</th>
		<th>VilleMoral</th>
		<th>NomPhysique</th>
		<th>VillePhysique</th>
		
	</tr>
	</thead> 
	
	<tdata>
	{section name=lst loop=$listeacteurs}
	<tr>
		<td style="text-align: center;"> <a href="index.php?module=P06interventionsL&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$listeacteurs[lst].numacteur}"> <img src="display/images/Notes.png" height="30" border="0"> </a></td>
		<td style="text-align: center;"> <a href="index.php?module=P04acteursM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$listeacteurs[lst].numacteur}"> <img src="display/images/Modif.png" height="30" border="0"> </a></td>
		<td style="text-align: center;">{$listeacteurs[lst].nomacteurmoral}</td>
		<td style="text-align: center;">{$listeacteurs[lst].villemoral}</td>
		<td style="text-align: center;">{$listeacteurs[lst].nomacteurphysique}</td>
		<td style="text-align: center;">{$listeacteurs[lst].villephysique}</td>
				
	</tr>
	{/section}
	</tdata>	
	
</table>
</form>	

</td>
</tr>
</table>


