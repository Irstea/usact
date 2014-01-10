<p> <font size="4"><b>Relier aux modes d'action, revendications et solutions </b></font></p> 

<div>
<a href="index.php?module=P06interventionsL&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}" style="color:MediumBlue" title="Retour à la liste intervention">Retour à la liste intervention</a>
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
<td width=40%>

<span style="display: inline-block">
<a href="index.php?module=P07modesactionM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}&numaction=0" style="color:MediumBlue" title="Nouveau mode action">Nouveau mode action</a>
</span>

<h2>Liste des modes d'action :</h2>
<form name="modesactionL" method="get" action="index.php">
<input type="hidden" name="module" value="P06interventionsD">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">

<script> 
setDataTables("modesactionL",true, true, true,25,false);
</script>

<table id="modesactionL" class="tableaffichage">
	
	<thead>
	<tr>
		<th>Modif</th>
		<th>TypeModeAction</th>
		<th>ModeAction</th>
		<th>EchelleAction</th>
		<th>DateAction</th>
		
		
	</tr>
	</thead> 
	
	<tdata>
	{section name=lst loop=$listemodesaction}
	<tr>
		
		<td style="text-align: center;"> <a href="index.php?module=P07modesactionM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}&numaction={$listemodesaction[lst].numaction}"> <img src="display/images/Modif.png" height="30" border="0"> </a></td>
		<td style="text-align: center;">{$listemodesaction[lst].typemodeaction}</td>
		<td style="text-align: center;">{$listemodesaction[lst].modeaction}</td>
		<td style="text-align: center;">{$listemodesaction[lst].echelleaction}</td>
		<td style="text-align: center;">{$listemodesaction[lst].dateaction}</td> 
		
	</tr>
	{/section}
	</tdata>	
	
</table>
</form>
</td>

<td width="4%"></td>

<td width="66%">

<span style="display: inline-block">
<a href="index.php?module=P08revendicationsM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}&numrevend=0" style="color:MediumBlue" title="Nouvelle revendication">Nouvelle revendication</a>
</span>

<h2>Liste des revendications :</h2>
<form name="revendicationsL" method="get" action="index.php">
<input type="hidden" name="module" value="P06interventionsD">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">

<script> 
setDataTables("revendicationsL",true, true, true,25,false);
</script>

<table id="revendicationsL" class="tableaffichage">
	
	<thead>
	<tr>
		<th>Modif</th>
		<th>RevendicationNiv1</th>
		<th>RevendicationNiv2</th>
		<th>SupportRevendNiv1</th>
		<th>SupportRevendNiv2</th>
		<th>RegistreArgumNiv1</th>
		<th>RegistreArgumNiv2</th>
				
	</tr>
	</thead> 
	
	<tdata>
	{section name=lst loop=$listerevendications}
	<tr>
		<td style="text-align: center;"> <a href="index.php?module=P08revendicationsM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}&numrevend={$listerevendications[lst].numrevend}"> <img src="display/images/Modif.png" height="30" border="0"> </a></td>
		<td style="text-align: center;">{$listerevendications[lst].revendicationniv1}</td>
		<td style="text-align: center;">{$listerevendications[lst].revendicationniv2}</td>
		<td style="text-align: center;">{$listerevendications[lst].supportrevendniv1}</td> 
		<td style="text-align: center;">{$listerevendications[lst].supportrevendniv2}</td> 
		<td style="text-align: center;">{$listerevendications[lst].registreargumniv1}</td> 
		<td style="text-align: center;">{$listerevendications[lst].registreargumniv2}</td> 
			
	</tr>
	{/section}
	</tdata>	
	
</table>
</form>

</td>
</tr>

<tr height=50>
<td colspan=3>
</td>
</tr>

<tr>
<td width=40%>

<span style="display: inline-block">
<a href="index.php?module=P09solutionsM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}&numsolution=0" style="color:MediumBlue" title="Nouvelle solution">Nouvelle solution</a>
</span>

<h2>Liste des solutions :</h2>
<form name="solutionsL" method="get" action="index.php">
<input type="hidden" name="module" value="P06interventionsD">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">

<script> 
setDataTables("solutionsL",true, true, true,25,false);
</script>

<table id="solutionsL" class="tableaffichage">
	
	<thead>
	<tr>
		<th>Détail</th>
		<th>Modif</th>
		<th>SolutionProp</th>
		
	</tr>
	</thead> 
	
	<tdata>
	{section name=lst loop=$listesolutions}
	<tr>
		<td style="text-align: center;"> <a href="index.php?module=P10resolutionL&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}&numsolution={$listesolutions[lst].numsolution}"> <img src="display/images/Notes.png" height="30" border="0"> </a></td>
		<td style="text-align: center;"> <a href="index.php?module=P09solutionsM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}&numsolution={$listesolutions[lst].numsolution}"> <img src="display/images/Modif.png" height="30" border="0"> </a></td>
		<td style="text-align: center;">{$listesolutions[lst].solutionprop}</td>
	</tr>
	{/section}
	</tdata>	
	
</table>
</form>
</td>

<td width="4%"></td>
<td width="66%"></td>

</tr>
</table>



























	
