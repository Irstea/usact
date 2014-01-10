<p> <font size="4"><b>Enregistrer une ville </b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P01conflitsD&numconflit={$idconflit}" style="color:MediumBlue" title="Retour à la liste ville">Retour à la liste ville</a>
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


<form name="villeM" method="post" action="index.php" >
<input type="hidden" name="module" value="P03villeE">
<input type="hidden" name="numconflit" value="{$idconflit}">


<fieldset>
<div align="center">
			
	<label for="nomville">Nom Ville <em>*</em> : </label>
	<select id="nomville" value="{$data.nomville}" name="nomville" required title="Veuillez saisir une ville" onchange='rechercheSelect("nomville", 3, "numeroinsee", "index.php?module=P03villelocalA&libellenomville=", "numeroinsee");if(this.value=="") document.getElementById("departement").disabled=true; document.getElementById("numeroinsee").disabled=true;if(this.value!="") document.getElementById("departement").disabled=false;'> 
			  <option value="" {if $data.numeroinsee == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modnomville}
					<option value="{$modnomville[lst].nomville}"> {$modnomville[lst].nomville} </option>
			   {/section}
	</select>
		
	<label for="departement">Département <em>*</em> : </label>
	<select id="departement" name="departement" required value="{$data.departement}"  title="Veuillez saisir un département">					
				 <option value="" {if $data.numeroinsee == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$moddepartement}
					<option value="{$moddepartement[lst].departement}"> {$moddepartement[lst].departement} </option>
			   {/section}
	</select>
			
	<label for="numeroinsee">NumeroInsee : </label>
	<select id="numeroinsee" name="numeroinsee" value="{$data.numeroinsee}"  disabled="disabled" title="Veuillez saisir un numeroinsee">					
				<option value="{$ville.numeroinsee}">{$ville.numeroinsee} </option>			  
	</select>


</div>

</fieldset>

<br>

<div align="center" style="width:65%">
	<input type="submit" name="Enre_Fville" value="Enregistrer" onClick="javascript:setAction(this.form, this.form.Enre_Fville, 'Enregistrer')"/>		
</div>	
	
</form>








