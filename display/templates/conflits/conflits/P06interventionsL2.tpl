<p> <font size="4"><b>Recherche des informations sur une intervention </b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P06interventionsL&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}" style="color:MediumBlue" title="Retour à la liste intervention">Retour à la liste intervention</a>
</div>

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

<form name=interventionsMR2 method="get" action="index.php">
<input type="hidden" name="module" value="P06interventionsL2">
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
<a href="index.php?module=P06interventionsM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv=0" style="color:MediumBlue" title="Nouvelle intervention">Nouvelle intervention</a>
</span>

<h2>Liste des interventions :</h2>
<form name="interventionsL2" method="get" action="index.php">
<input type="hidden" name="module" value="P06interventionsL">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">

<script> 
setDataTables("interventionsL2",true, true, true,25,false);
</script>

<table id="interventionsL2" class="tableaffichage">
	
	<thead>
	<tr>
		<th>Modif</th>
		<th>DateEntree</th>
		<th>DateSortie</th>
		<th>Role</th>
		<th>PositionUsageActivite</th>
		<th>UsageActiviteNiv1</th>
		<th>UsageActiviteNiv2</th>
		
	</tr>
	</thead> 
	
	<tdata>
	{section name=lst loop=$listeinterventions2}
	<tr>
		<td style="text-align: center;"> <a href="index.php?module=P06interventionsM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$listeinterventions2[lst].numinterv}"> <img src="display/images/Modif.png" height="30" border="0"> </a></td>
		<td style="text-align: center;">{$listeinterventions2[lst].dateentree}</td>
		<td style="text-align: center;">{$listeinterventions2[lst].datesortie}</td>
		<td style="text-align: center;">{$listeinterventions2[lst].role}</td>
		<td style="text-align: center;">{$listeinterventions2[lst].positionusageactivite}</td> 
		<td style="text-align: center;">{$listeinterventions2[lst].usageactiviteniv1}</td> 
		<td style="text-align: center;">{$listeinterventions2[lst].usageactiviteniv2}</td> 
	</tr>
	{/section}
	</tdata>	
	
</table>
</form>

</td>
</tr>
</table>


