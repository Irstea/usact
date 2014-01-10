<p> <font size="4"><b>Recherche des informations sur un article</b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P02conflitsexprD&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}" style="color:MediumBlue" title="Retour à la liste article">Retour à la liste article</a>
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
{/literal}
</style>		

<table class="tableaffichage">	
<tr>
<td>

<form name=articlesMR2 method="get" action="index.php">
<input type="hidden" name="module" value="P05articlesL">
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
<a href="index.php?module=P05articlesM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle=0" style="color:MediumBlue" title="Nouveau article">Nouveau article</a>
</span>

<h2>Liste des articles :</h2>
<form name="articlesL2" method="get" action="index.php">
<input type="hidden" name="module" value="P05articlesL">

<script> 
setDataTables("articlesL2",true, true, true,25,false);
</script>

<table id="articlesL2" class="tableaffichage">
	
	<thead>
	<tr>
		<th>Modif</th>
		<th>TitreArticle</th>
		<th>AuteurArticle</th>
		<th>DateParution</th>
		<th>NomJournal</th>
			
	</tr>
	</thead> 
	
	<tdata>
	{section name=lst loop=$listearticles2}
	<tr>
		<td style="text-align: center;"> <a href="index.php?module=P05articlesM&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$listearticles2[lst].numarticle}"> <img src="display/images/Modif.png" height="30" border="0"> </a></td>
		<td style="text-align: center;">{$listearticles2[lst].titrearticle}</td>
		<td style="text-align: center;">{$listearticles2[lst].auteurarticle}</td>
		<td style="text-align: center;">{$listearticles2[lst].dateparution}</td>
		<td style="text-align: center;">{$listearticles2[lst].nomjournal}</td>
	
	</tr>
	{/section}
	</tdata>	
	
</table>
</form>	

</td>
</tr>
</table>	

