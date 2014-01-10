<p> <font size="4"><b>Rechercher des informations sur un conflit</b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

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

select {
 width: 185px;
 padding: 2px;
}
{/literal}
</style>

<table class="tableaffichage">
<tr>
<td>
<form name=accueilMR method="get" action="index.php">
<input type="hidden" name="module" value="P00accueilL">
<input type="hidden" name="isSearch" value="1">

	
	<label for="zoneType" >Type Conflit : </label>
	<select id="zoneType" name="zoneType" value="{$critere.zoneType}"  onclick='rechercheSelect("zoneType", 3, "zoneObj1", "index.php?module=P00accueilA&libelleTC=", "zoneObj1");if(this.value=="Usage") document.getElementById("zoneBienS1").selectedIndex=1;if(this.value=="Socio Economique") document.getElementById("zoneBienS1").selectedIndex=0;' title="Veuillez sélectionner un type de conflit" > 
		{section name=lst loop=$modtypeconflit}
		   	<option value="{$modtypeconflit[lst].modalite}" {if $modtypeconflit[lst].modalite == $critere.zoneType}selected{/if}> {$modtypeconflit[lst].modalite} </option>
		{/section}
	</select>
	
	<br>
	
	<label for="zoneBienS1" class="label2">Bien Support Niveau 1 : </label>
	<select id="zoneBienS1"  name="zoneBienS1" value="{$critere.zoneBienS1}"  onclick='rechercheSelect("zoneBienS1", 3, "zoneBienS2", "index.php?module=P00accueilA&libelleBS1=", "zoneBienS2")' title="Veuillez sélectionner un bien support niveau 1" >
		<option value="" ></option>
		{section name=lst loop=$modbsniv1}
			<option value="{$modbsniv1[lst].modalite}"> {$modbsniv1[lst].modalite} </option>
		{/section}
	</select>	

	<label for="zoneObj1" class="label2">Objet Niveau 1 : </label>
	<select id="zoneObj1"  name="zoneObj1" value="{$critere.zoneObj1}"  onclick='rechercheSelect("zoneObj1", 3, "zoneObj2", "index.php?module=P00accueilA&libelleO1=", "zoneObj2")' title="Veuillez sélectionner un objet niveau 1" >
			<option value="{$modalites.modalite}"> {$modalites.modalite}</option>									  
	</select>	
	
	<br>

	<label for="zoneBienS2" class="label2">Bien Support Niveau 2 : </label>
	<select id="zoneBienS2" name="zoneBienS2" value="{$critere.zoneBienS2}"  title="Veuillez sélectionner un bien support niv 2">					
			<option value="{$modalites.sousmodalite}" > {$modalites.sousmodalite}</option>	 
	</select>
		
		
	<label for="zoneObj2" class="label2">Objet Niveau 2 : </label>
	<select id="zoneObj2" name="zoneObj2" value="{$critere.zoneObj2}"   title="Veuillez sélectionner un objet niveau 2">							
			<option value="{$modalites.sousmodalite}"> {$modalites.sousmodalite}</option>								
	</select>		
	
	<input type="submit" value="Rechercher...">
	
	
</form>
</td>
</tr>
<tr>
<td>
<span style="display: inline-block">
<a href="index.php?module=P01conflitsL" style="color:MediumBlue" title="Nouveau conflit / expression / ville / localisation">Nouveau</a> 
</span>


<h2>Liste des conflits par date et ville :</h2>
<form name="accueilL" method="get" action="index.php">
<input type="hidden" name="module" value="P00accueilL">

<script> 
setDataTables("accueilL",true, true, true,25,false);
</script>

<table id="accueilL" class="tableaffichage">
	
	<thead>
	<tr>
		<th>Détail</th>
		<th>Modif</th>
		<th>DateDebut</th>
		<th>DateFin</th>
		<th>NomVille</th>
		<th>NomLocalisation</th>
	
	</tr>
	</thead> 
	
	<tdata>
	{section name=lst loop=$listeaccueil}
	<tr>
		<td style="text-align: center;"> <a href="index.php?module=P02conflitsexprD&numconflit={$listeaccueil[lst].numconflit}&numconflitexpr={$listeaccueil[lst].numconflitexpr}&numeroinsee={$listeaccueil[lst].numeroinsee}&numerolocalisation={$listeaccueil[lst].numerolocalisation}"> <img src="display/images/Notes.png" height="30" border="0"> </a></td>
		<td style="text-align: center;"> <a href="index.php?module=P01conflitsD&numconflit={$listeaccueil[lst].numconflit}&numeroinsee={$listeaccueil[lst].numeroinsee}&numerolocalisation={$listeaccueil[lst].numerolocalisation}"> <img src="display/images/Modif.png" height="30" border="0"> </a></td>
		<td style="text-align: center;">{$listeaccueil[lst].datedebut}</td>
		<td style="text-align: center;">{$listeaccueil[lst].datefin}</td>
		<td style="text-align: center;">{$listeaccueil[lst].nomville}</td>
		<td style="text-align: center;">{$listeaccueil[lst].nomlocalisation}</td>
	</tr>
	{/section}
	</tdata>	
	
</table>
</form>	
</td>
</tr>
</table>



