<p> <font size="4"><b>Enregistrer une solution </b></font></p>
<script language="javascript" SRC="display/javascript/fonctions.js"></script> 

<div>
<a href="index.php?module=P06interventionsD&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}" style="color:MediumBlue" title="Retour à la liste solution">Retour à la liste solution</a>
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


<form name="solutionsM" method="post" action="index.php" >
<input type="hidden" name="module" value="P09solutionsE">
<input type="hidden" name="numsolution" value="{$data.numsolution}">
<input type="hidden" name="numinterv" value="{$data.numinterv}">

<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">


<fieldset>		
<div align="center">	
	
	<label for="solutionprop">Solution Proposée : </label>
	<input id="solutionprop" name="solutionprop" value="{$data.solutionprop}" title="Veuillez saisir le solution proposée" placeholder="Solution proposée">

</div>	
</fieldset>

<br>

<div align="center" style="width:65%">
	<input type="submit" name="Enre_Fsolutions" value="Enregistrer" onClick="javascript:setAction(this.form, this.form.Enre_Fsolutions, 'Enregistrer')"/>		
</div>	

</form>








