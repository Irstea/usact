<p><font size="4"><b>Enregistrer / Ajouter des informations sur un conflit</b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P00accueilL" style="color:MediumBlue" title="Retour à la recherche par date et localisation">Retour à la recherche conflit</a>
</div>

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
select {
 width: 185px;
 padding: 2px;
}
{/literal}
</style>

<table class="tableaffichage">	
<tr>
<td>

<form name=conflitsMR method="get" action="index.php">
<input type="hidden" name="module" value="P01conflitsL">
<input type="hidden" name="isSearch" value="1">

	<label for="zoneType">Type de conflit </label>
	<select id="zoneType" name="zoneType" value="{$critere.zoneType}" title="Veuillez sélectionner un type de conflit"> 
		<option value="" {if $critere.zoneType == ""} selected{/if}>Choisissez... </option>
		{section name=lst loop=$modtypeconflit}
			<option value="{$modtypeconflit[lst].modalite}" {if $modtypeconflit[lst].modalite == $critere.zoneType}selected{/if}> {$modtypeconflit[lst].modalite} </option>
		{/section}
	</select>

	<label for="zoneBienS">Bien support </label>
	<input id="zoneBienS" name="zoneBienS" value="{$critere.zoneBienS}" size="25" maxlength="80" placeholder="Niveau 1 ou 2" title="Veuillez saisir un bien support">

	<label for="zoneObj">Objet </label>
	<input name="zoneObj" value="{$critere.zoneObj}" size="25" maxlength="80" placeholder="Niveau 1 ou 2" title="Veuillez saisir un objet">
	
	<input type="submit" value="Rechercher...">
	
</form>

</td>
</tr>
<tr>
<td>

<span style="display: inline-block">
<a href="index.php?module=P01conflitsM&numconflit=0" style="color:MediumBlue" title="Nouveau conflit">Nouveau conflit</a>
</span>

<h2>Liste des conflits :</h2>
<form name="conflitsL" method="get" action="index.php">
<input type="hidden" name="module" value="P01conflitsL">

<script> 
setDataTables("conflitsL",true, true, true,25,false);
</script>

<table id="conflitsL" class="tableaffichage">
	
	<thead>
	<tr>
		<th>Détail</th>
		<th>TypeConflit</th>
		<th>BienSupportNiv1</th>
		<th>BienSupportNiv2</th>
		<th>ObjetNiv1</th>
		<th>ObjetNiv2</th>
		<th>Ville</th>
	</tr>
	</thead> 
	
	<tdata>
	{section name=lst loop=$listeconflits}
	<tr>
		<td style="text-align: center;"> <a href="index.php?module=P01conflitsD&numconflit={$listeconflits[lst].numconflit}&numeroinsee={$listeconflits[lst].numeroinsee}"> <img src="display/images/Notes.png" height="30" border="0"> </a></td>
		<td style="text-align: center;">{$listeconflits[lst].typeconflit}</td>
		<td style="text-align: center;">{$listeconflits[lst].biensupportniv1}</td>
		<td style="text-align: center;">{$listeconflits[lst].biensupportniv2}</td>
		<td style="text-align: center;">{$listeconflits[lst].objetniv1}</td>
		<td style="text-align: center;">{$listeconflits[lst].objetniv2}</td>
		<td style="text-align: center;">{$listeconflits[lst].nomville}</td>  	
	</tr>
	{/section}
	</tdata>	
	
</table>
</form>	

</td>
</tr>
</table>





