<p> <font size="4"><b>Enregistrer un article</b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P05articlesL&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}" style="color:MediumBlue" title="Retour à la recherche article">Retour à la recherche article</a>
</div>

<br>

<style type="text/css">
{literal}
 /* Affichage */
fieldset {
  padding: 10px;
  margin-left: 0; 
  margin-right: auto;
  width:65%;
  border:0;
}

label {
  text-align: left;
  display: inline-block;
  margin: 6px;
  padding:6px;
  width:23%;
}

input[type=submit] {
  width: 150px;
  padding: 10px;
}
select {
 width: 60%;
 padding: 6px;
}

em {
color: red;
}

input {
 width: 59%;
 padding: 6px;
}
{/literal}
</style>

<!--  Chargement javascript calendrier -->
<script type="text/javascript" SRC="display/javascript/calendar/calendar.js"></script>
<script type="text/javascript" SRC="display/javascript/calendar/lang/calendar-fr.js"></script>
<script type="text/javascript" SRC="display/javascript/calendar/calendar-setup.js"></script>



<form name="articlesM" method="post" action="index.php" >
<input type="hidden" name="module" value="P05articlesE">
<input type="hidden" name="numarticle" value="{$data.numarticle}">

<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">

<fieldset>
		
<div align="center">
	
	<label for="titrearticle">Titre de l'Article <em>*</em> : </label>
	<input id="titrearticle" name="titrearticle" value="{$data.titrearticle}" required title="Veuillez saisir le titre de l'article" placeholder="Titre de l'Article">
	

	<label for="auteurarticle">Auteur de l'Article <em>*</em> : </label>
	<input id="auteurarticle" name="auteurarticle" value="{$data.auteurarticle}" required title="Veuillez saisir l'auteur de l'article" placeholder="Auteur de l'Article">
	

	<label for="dateparution">Date de Parution : </label>
	<input id= "dateparution" name="dateparution" value="{$data.dateparution}" title="Veuillez saisir la date de parution" placeholder="Date de Parution">
	{literal} 
	<script type="text/javascript">
		Calendar.setup({
			inputField : "dateparution", //id du champ date
			ifFormat : "%d/%m/%Y", //format d'affichage
			});
	</script>
	{/literal}
	
	<label for="nomjournal">Nom du Journal <em>*</em> :</label>
	<input id="nomjournal" name="nomjournal" value="{$data.nomjournal}" required title="Veuillez saisir le nom du journal"  placeholder="Nom du Journal">
	

 	<label for="edition">Edition : </label>
	<input id="edition" name="edition" value="{$data.edition}" title="Veuillez saisir l'édition" placeholder="Edition">


	<label for="rubrique">Rubrique : </label>
	<input id="rubrique" name="rubrique" value="{$data.rubrique}" title="Veuillez saisir la rubrique" placeholder="Rubrique">

	
	<label for="page">Numéro de Page : </label>
	<input id="page" name="page" value="{$data.page}" title="Veuillez saisir le numéro de page" placeholder="Numéro page">

	<label for="entete">Entete : </label>
	<input id="entete" name="entete" value="{$data.entete}" title="Veuillez saisir un entete" placeholder="Entete">
	

	<label for="perssaisiearticle">Nom de Saisie <em>*</em> : </label>
	<input id="perssaisiearticle" name="perssaisiearticle" value="{$data.perssaisiearticle}" required title="Veuillez préciser le nom de saisie" placeholder="Nom de Saisie">


	<label for="datesaisiearticle">Date de Saisie <em>*</em> : </label>
	<input id="datesaisiearticle" name="datesaisiearticle" value="{$data.datesaisiearticle}" required title="Veuillez préciser la date de saisie" placeholder="Date de Saisie">


	<label for="typeaborde">Type Aborde <em>*</em> : </label>
	<select id="typeaborde" name="typeaborde"  value="{$typeaborde}" required  title="Veuillez préciser le type aborde"  >
			<option value="" {if $data.numarticle == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modtypeaborde}
					<option value="{$modtypeaborde[lst].modalite}" > {$modtypeaborde[lst].modalite} </option>
			   {/section}
	</select>

</div>
	
</fieldset>

<br>

<div align="center" style="width:65%">
	<input type="submit" name="Enre_Farticles" value="Enregistrer" onClick="javascript:setAction(this.form, this.form.Enre_Farticles, 'Enregistrer')"/>		
</div>	
		
</form>








