<p> <font size="4"><b>Enregistrer / Ajouter des informations sur l'expression et la ville</b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P00accueilL" style="color:MediumBlue" title="Retour à la recherche par date et localisation">Retour à la recherche conflit</a>
</div>

<div>
<a href="index.php?module=P01conflitsL" style="color:MediumBlue" title="Retour à la liste conflit">Retour à la liste conflit</a>
</div>

<p style="display:inline"> Pour modifier les informations sur le conflit : </p>
<a href="index.php?module=P01conflitsM&numconflit={$idconflit}&numeroinsee={$idville}"><img src="display/images/Modif.png" height="30" border="0" style=vertical-align:-10px;></a>

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
		<td class="resumeTitre"> Type de Conflit : </td>
		<td class="resumeInfo1"> <b>{$detailconflits.typeconflit} </b></td>
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
	
</table>

<br> 

<style type="text/css">
{literal}
 /* Affichage */
fieldset {
  padding: 13px;
  border:0;
}

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

<form name=conflitsexprMR1 method="get" action="index.php">
<input type="hidden" name="module" value="P01conflitsD">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numeroinsee" value="{$listeville[0].numeroinsee}">
<input type="hidden" name="isSearch" value="1">

		<label for="zoneType">Date de début : </label>
		<input name="zoneDebut" value="{$critere.zoneDebut}" size="25" length="80" maxlength="80" placeholder="Début de l'étape">
		<input type="submit" value="Rechercher...">
		
</form>	

</td>
	
<td width="4%"></td>

<td>

<form name=conflitsexprMR2 method="get" action="index.php">
<input type="hidden" name="module" value="P01conflitsD">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numeroinsee" value="{$listeville[0].numeroinsee}">

<input type="hidden" name="isSearch" value="1">

		<label for="zoneNomville">Nom de la ville </label>
		<input name="zoneNomville" value="{$critereville.zoneNomville}" size="25" length="80" maxlength="80" placeholder="Nom de la ville">
		<input type="submit" value="Rechercher...">

</form>
</td>
</tr>

<tr>
<td>

<span style="display: inline-block">
<a href="index.php?module=P02conflitsexprM&numconflit={$idconflit}&numeroinsee={$idville}&numconflitexpr=0" style="color:MediumBlue" title="Nouvelle expression">Nouvelle expression</a>
</span>

<h2>Liste des conflits d'expressions :</h2>
<form name="conflitsexprL" method="get" action="index.php">
<input type="hidden" name="module" value="P01conflitsD">
<input type="hidden" name="numconflit" value="{$idconflit}">

<table id="conflitsexprL">	
	
	<tr>
		<th>Détail</th>
		<th>Modif</th>
		<th>DateDebut</th>
		<th>DateFin</th>
		<th>Details</th>
	
	</tr>
	
	{section name=lst loop=$listeconflitsexpr}
	<tr>
		<td style="text-align: center;"> <a href="index.php?module=P02conflitsexprD&numconflit={$listeconflitsexpr[lst].numconflit}&numconflitexpr={$listeconflitsexpr[lst].numconflitexpr}&numeroinsee={$listeville[0].numeroinsee}&numerolocalisation={$listeville[0].numerolocalisation}"><img src="display/images/Notes.png" height="30" border="0" ></a></td>
		<td style="text-align: center;"> <a href="index.php?module=P02conflitsexprM&numconflit={$listeconflitsexpr[lst].numconflit}&numconflitexpr={$listeconflitsexpr[lst].numconflitexpr}&numeroinsee={$idville}"><img src="display/images/Modif.png" height="30" border="0" ></a></td>
		<td style="text-align: center;">{$listeconflitsexpr[lst].datedebut}</td>
		<td style="text-align: center;">{$listeconflitsexpr[lst].datefin}</td>
		<td style="text-align: center;">{$listeconflitsexpr[lst].detailexpr}</td>
			
	</tr>
	{/section}
		
</table>
</form>

</td>

<td width="4%"></td>

<td>
{if $idville > 0}	
<span style="display: inline-block">
<a href="#" style="color:MediumBlue" title="Nouvelle ville">Nouvelle ville</a>
</span>
{else}
<span style="display: inline-block">
<a href="index.php?module=P03villeM&numconflit={$idconflit}" style="color:MediumBlue" title="Nouvelle ville">Nouvelle ville</a>
</span>
{/if}

{if $idville > 0 && $listeville[0].numerolocalisation == ""}
<span style="display: inline-block;float:right">
<a href="index.php?module=P03localisationM&numconflit={$idconflit}&numeroinsee={$listeville[0].numeroinsee}&numerolocalisation=0" style="color:MediumBlue" title="Nouvelle localisation">Nouvelle localisation</a>
</span>
{else}
<span style="display: inline-block;float:right">
<a href="#" style="color:MediumBlue" title="Nouvelle localisation">Nouvelle localisation</a>
</span>
{/if}	

<h2>Liste des villes et localisations :</h2>

<form name="villelocalisationL" method="get" action="index.php">
<input type="hidden" name="module" value="P01conflitsD">
<input type="hidden" name="numconflit" value="{$idconflit}">

<table id="villelocalisationL">
	
	<tr>
		<th>NomVille</th>
		<th>Departement</th>
		<th>ModifLocalisation</th>
		<th>NomLocalisation</th>
			
	</tr>	
	
	{section name=lst loop=$listeville}
	<tr>
		<td style="text-align: center;">{$listeville[lst].nomville}</td>
		<td style="text-align: center;">{$listeville[lst].departement}</td>
		{if $listeville[lst].numerolocalisation > 0}
		<td style="text-align: center;"> <a href="index.php?module=P03localisationM&numconflit={$idconflit}&numeroinsee={$listeville[0].numeroinsee}&numerolocalisation={$listeville[lst].numerolocalisation}"> <img src="display/images/Modif.png" height="30" border="0"> </a></td>
		{else}
		<td style="text-align: center;"> <a href="#"> <img src="display/images/Modif.png" height="30" border="0"> </a></td>
		{/if}
		<td style="text-align: center;">{$listeville[lst].nomlocalisation}</td>		
	</tr>
	{/section}
		
	
</table>
</form>
</td>
</tr>
</table>








