<p> <font size="4"><b>Relier à l'intervention </b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P04acteursL&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}" style="color:MediumBlue" title="Retour à la liste acteur">Retour à la liste acteur</a>
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
	
</table>

<br>


<style type="text/css">
{literal}

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

<form name=interventionsMR method="get" action="index.php">
<input type="hidden" name="module" value="P06interventionsL">
<input type="hidden" name="isSearch" value="1">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">

	<label for="zonePosusagact">Position Usage Activite </label>
	<input id="zonePosusagact" name="zonePosusagact" value="{$critere.zonePosusagact}" size="25" maxlength="80" placeholder="Position Usage Activite" title="Veuillez saisir la position usage activite">

	<label for="zoneUsagact">Usage Activite </label>
	<input id="zoneUsagact" name="zoneUsagact" value="{$critere.zoneUsagact}" size="25" maxlength="80" placeholder="Niveau 1 ou 2" title="Veuillez saisir l'usage activite">
		
	<input type="submit" value="Rechercher...">

</form>

</td>
</tr>		
<tr>
<td>

<span style="display: inline-block">
<a href="index.php?module=P06interventionsL2&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}" style="color:MediumBlue" title="Recherche intervention">Recherche intervention</a>
</span>

<h2>Liste des interventions :</h2>
<form name="interventionsL" method="get" action="index.php">
<input type="hidden" name="module" value="P06interventionsL">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">

<script> 
setDataTables("interventionsL",true, true, true,25,false);
</script>

<table id="interventionsL" class="tableaffichage">
	
	<thead>
	<tr>
		<th>Détail</th>
		<th>DateEntree</th>
		<th>DateSortie</th>
		<th>Role</th>
		<th>PositionUsageActivite</th>
		<th>UsageActiviteNiv1</th>
		<th>UsageActiviteNiv2</th>
		
	</tr>
	</thead> 
	
	<tdata>
	{section name=lst loop=$listeinterventions}
	<tr>
		<td style="text-align: center;"> <a href="index.php?module=P06interventionsD&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$listeinterventions[lst].numinterv}"> <img src="display/images/Notes.png" height="30" border="0"> </a></td>
		<td style="text-align: center;">{$listeinterventions[lst].dateentree}</td>
		<td style="text-align: center;">{$listeinterventions[lst].datesortie}</td>
		<td style="text-align: center;">{$listeinterventions[lst].role}</td>
		<td style="text-align: center;">{$listeinterventions[lst].positionusageactivite}</td> 
		<td style="text-align: center;">{$listeinterventions[lst].usageactiviteniv1}</td> 
		<td style="text-align: center;">{$listeinterventions[lst].usageactiviteniv2}</td> 
	</tr>
	{/section}
	</tdata>	
	
</table>
</form>

</td>
</tr>
</table>


