<p> <font size="4"><b>Enregistrer une expression</b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P01conflitsD&numconflit={$data.numconflit}&numeroinsee={$idville}" style="color:MediumBlue" title="Retour à la liste conflits expressions">Retour à la liste expression</a>
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

em {
color: red;
}

input {
 width: 59%;
 padding: 6px;
}
{/literal}
</style>


<form name="conflitsexprM" method="post" action="index.php" >
<input type="hidden" name="module" value="P02conflitsexprE">
<input type="hidden" name="numconflitexpr" value="{$data.numconflitexpr}">
<input type="hidden" name="numconflit" value="{$data.numconflit}">
<input type="hidden" name="numeroinsee" value="{$idville}">

<fieldset>

<div align="center">
		
	<label for="datedebut">Date de Début <em>*</em> : </label>
	<input id="datedebut" name="datedebut" value="{$data.datedebut}" required title="Veuillez saisir une date de début" placeholder="Date de Début">
	

	<label for="datefin">Date de Fin : </label>
	<input id="datefin" name="datefin" value="{$data.datefin}" title="Veuillez saisir une date de fin" placeholder="Date de Fin">
	

	<label for="detailexpr">Details du Conflit d'Expression : </label>
	<input name="detailexpr" value="{$data.detailexpr}" title="Veuillez saisir le détail du conflit d'expression" placeholder="Details du Conflit d'Expression">
	

	<label for="perssaisconfexp">Nom de Saisie <em>*</em> :</label>
	<input id="perssaisconfexp" name="perssaisconfexp" value="{$data.perssaisconfexp}" required title="Veuillez préciser un nom de saisie" placeholder="Nom de Saisie">
	

 	<label for="datesaisconfexp">Date de Saisie <em>*</em> : </label>
	<input id="datesaisconfexp" name="datesaisconfexp" value="{$data.datesaisconfexp}" required title="Veuillez préciser une date de saisie" placeholder="Date de Saisie">
	
</div>
	
</fieldset>

<br>

<div align="center" style="width:65%">
	<input type="submit" name="Enre_Fconflitsexpr" value="Enregistrer" onClick="javascript:setAction(this.form, this.form.Enre_Fconflitsexpr, 'Enregistrer')"/>		
</div>	
		
</form>








