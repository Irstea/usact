<p> <font size="4"><b>Enregistrer une localisation </b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P01conflitsD&numconflit={$idconflit}&numeroinsee={$idville}" style="color:MediumBlue" title="Retour à la liste localisation">Retour à la liste localisation</a>
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

select {
 width: 60%;
 padding: 6px;
}

input {
 width: 59%;
 padding: 6px;
}
{/literal}
</style>


<form name="localisationM" method="post" action="index.php" >
<input type="hidden" name="module" value="P03localisationE">
<input type="hidden" name="numconflit" value="{$idconflit}">

<input type="hidden" name="numerolocalisation" value="{$data.numerolocalisation}">
<input type="hidden" name="numeroinsee" value="{$idville}">

<fieldset>
<div align="center">	

	<label for="nomlocalisationL">Nom Localisation : </label>
	<select id="nomlocalisationL" value="{$data.nomlocalisation}" name="nomlocalisationL" title="Veuillez sélectionner une localisation dans la liste ou l'option 'choisissez votre information' pour ajouter une localisation"> 
			  <option value="" {if $data.numerolocalisation == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modnomlocalisation}
					<option value="{$modnomlocalisation[lst].nomlocalisation}" {if $data.nomlocalisation == $modnomlocalisation[lst].nomlocalisation} selected{/if}> {$modnomlocalisation[lst].nomlocalisation} </option>
			   {/section}
	</select>
	
	<label for="nomlocalisationT">Ajouter Nom Localisation : </label>
	<input id="nomlocalisationT" name="nomlocalisationT" title="Veuillez saisir une localisation"  placeholder="Ajouter une localisation">

</div>
	
</fieldset>

<br>

<div align="center" style="width:65%">
	<input type="submit" name="Enre_Flocalis" value="Enregistrer" onClick="javascript:setAction(this.form, this.form.Enre_Flocalis, 'Enregistrer')"/>		
</div>		
	
</form>








