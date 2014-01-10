<p> <font size="4"><b>Enregistrer une revendication </b></font></p>
<script language="javascript" SRC="display/javascript/fonctions.js"></script> 

<div>
<a href="index.php?module=P06interventionsD&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}" style="color:MediumBlue" title="Retour à la liste revendication">Retour à la liste revendication</a>
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
  width:30%;
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


<form name="revendicationsM" method="post" action="index.php" >
<input type="hidden" name="module" value="P08revendicationsE">
<input type="hidden" name="numrevend" value="{$data.numrevend}">
<input type="hidden" name="numinterv" value="{$data.numinterv}">

<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">

<fieldset>
		
	
<div align="center">
	
	<label for="revendicationniv1">Revendication Niveau 1 : </label>
	<select id="revendicationniv1" name="revendicationniv1"  value="{$data.revendicationniv1}" onclick='rechercheSelect("revendicationniv1", 3, "revendicationniv2", "index.php?module=P08revendicationsA&libellemodrevendniv1=", "revendicationniv2");if(this.value=="") document.getElementById("revendicationniv2").disabled=true;' title="Veuillez saisir une revendication niveau 1" >
			<option value="" {if $data.numrevend == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modrevendniv1}
					<option value="{$modrevendniv1[lst].modalite}" {if $modrevendniv1[lst].modalite == $data.revendicationniv1}selected{/if}> {$modrevendniv1[lst].modalite} </option>
			   {/section}
	</select>
	
	<label for="revendicationniv2">Revendication Niveau 2 : </label>
	<select id="revendicationniv2" value="{$data.revendicationniv2}"  disabled="disabled" name="revendicationniv2" title="Veuillez saisir une revendication niveau 2">					
				<option value="{$modalites.sousmodalite}">Choisissez votre information </option>
	</select>


	<label for="detailsrevend">Details Revendication :</label>
	<input id="detailsrevend" name="detailsrevend" value="{$data.detailsrevend}" title="Veuillez saisir un detail de la revendication" placeholder="Details Revendication">

	<label for="supportrevendniv1">Support Revendication Niveau 1 :</label>
	<select id="supportrevendniv1" name="supportrevendniv1"  value="{$data.supportrevendniv1}" onclick='rechercheSelect("supportrevendniv1", 3, "supportrevendniv2", "index.php?module=P08revendicationsA&libellemodrevendsupportniv1=", "supportrevendniv2");if(this.value=="") document.getElementById("supportrevendniv2").disabled=true;' title="Veuillez saisir un support de revendication niveau 1" >
			<option value="" {if $data.numrevend == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modrevendsupportniv1}
					<option value="{$modrevendsupportniv1[lst].modalite}" {if $modrevendsupportniv1[lst].modalite == $data.supportrevendniv1}selected{/if}> {$modrevendsupportniv1[lst].modalite} </option>
			   {/section}
	</select>


	<label for="supportrevendniv2">Support Revendication Niveau 2 :</label>
	<select id="supportrevendniv2" value="{$data.supportrevendniv2}"  disabled="disabled" name="supportrevendniv2" title="Veuillez saisir un support de revendication niveau 2">					
				<option value="{$modalites.sousmodalite}">Choisissez votre information </option>
	</select>
	
	
	<label for="registreargumniv1">Registre Argumentaire Niveau 1 :</label>
	<select id="registreargumniv1" name="registreargumniv1"  value="{$data.registreargumniv1}" onclick='rechercheSelect("registreargumniv1", 3, "registreargumniv2", "index.php?module=P08revendicationsA&libellemodrevendregistreniv1=", "registreargumniv2");if(this.value=="") document.getElementById("registreargumniv2").disabled=true;' title="Veuillez saisir un registre argumentaire niv 1" >
			<option value="" {if $data.numrevend == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modrevendregistreniv1}
					<option value="{$modrevendregistreniv1[lst].modalite}" {if $modrevendregistreniv1[lst].modalite == $data.registreargumniv1}selected{/if}> {$modrevendregistreniv1[lst].modalite} </option>
			   {/section}
	</select>

	<label for="registreargumniv2">Registre Argumentaire Niveau 2 :</label>
	<select id="registreargumniv2" value="{$data.registreargumniv2}"  disabled="disabled" name="registreargumniv2" title="Veuillez saisir un registre argumentaire niv 2">					
				<option value="{$modalites.sousmodalite}">Choisissez votre information </option>
	</select>


	<label for="detailsargum">Details Argumentaire :</label>
	<input id="detailsargum" name="detailsargum" value="{$data.detailsargum}" title="Veuillez saisir un detail argumentaire"  placeholder="Details Argumentaire">


</div>	
</fieldset>

<br>	

<div align="center" style="width:65%">
	<input type="submit" name="Enre_Frevendication" value="Enregistrer" onClick="javascript:setAction(this.form, this.form.Enre_Frevendication, 'Enregistrer')"/>		
</div>			
</form>







