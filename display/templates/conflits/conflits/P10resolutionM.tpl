<p> <font size="4"><b>Enregistrer une résolution </b></font></p>
<script language="javascript" SRC="display/javascript/fonctions.js"></script> 

<div>
<a href="index.php?module=P10resolutionL&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}&numsolution={$idsolution}" style="color:MediumBlue" title="Retour à la liste résolution">Retour à la liste résolution</a>
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
  width:25%;
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


<form name="resolutionM" method="post" action="index.php" >
<input type="hidden" name="module" value="P10resolutionE">
<input type="hidden" name="numconflitexpr" value="{$data.numconflitexpr}">
<input type="hidden" name="numsolution" value="{$data.numsolution}">
<input type="hidden" name="numresolution" value="{$data.numresolution}">

<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">
<input type="hidden" name="numsolution" value="{$idsolution}">
<input type="hidden" name="numinterv" value="{$idinterv}">



<fieldset>
		
	<div align="center">
	
	<label for="resolutionniv1">Résolution Niveau 1 : </label>
	<select id="resolutionniv1" name="resolutionniv1"  value="{$data.resolutionniv1}" title="Veuillez saisir la resolution niveau 1" >
			<option value="" {if $data.numresolution == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modresolniv1}
					<option value="{$modresolniv1[lst].modalite}" {if $modresolniv1[lst].modalite == $data.resolutionniv1}selected{/if}> {$modresolniv1[lst].modalite} </option>
			   {/section}
	</select>

	<label for="resolutionnivspat">Résolution Niveau Spatiale : </label>
	<select id="resolutionnivspat" name="resolutionnivspat"  value="{$data.resolutionnivspat}" title="Veuillez saisir une résolution niveau spatiale" >
			<option value="" {if $data.numresolution == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modresolnivspat}
					<option value="{$modresolnivspat[lst].modalite}" {if $modresolnivspat[lst].modalite == $data.resolutionnivspat}selected{/if}> {$modresolnivspat[lst].modalite} </option>
			   {/section}
	</select>
	
	<label for="resolutionnivacteur">Résolution Niveau Acteur :</label>
	<select id="resolutionnivacteur" name="resolutionnivacteur"  required value="{$data.resolutionnivacteur}" title="Veuillez saisir une résolution niveau acteur" >
			<option value="" {if $data.numresolution == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modresolnivact}
					<option value="{$modresolnivact[lst].modalite}" {if $modresolnivact[lst].modalite == $data.resolutionnivacteur}selected{/if}> {$modresolnivact[lst].modalite} </option>
			   {/section}
	</select>
	

 	<label for="moderesolutionniv1">Mode Résolution Niveau 1 : </label>
	<select id="moderesolutionniv1" name="moderesolutionniv1"  value="{$data.moderesolutionniv1}" onclick='rechercheSelect("moderesolutionniv1", 3, "moderesolutionniv2", "index.php?module=P10resolutionA&libellemodmodresolniv1=", "moderesolutionniv2"); if(this.value=="") document.getElementById("moderesolutionniv2").disabled=true;' title="Veuillez saisir un mode résolution niveau 1">
			<option value="" {if $data.numresolution == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modmodresolniv1}
					<option value="{$modmodresolniv1[lst].modalite}" {if $modmodresolniv1[lst].modalite == $data.moderesolutionniv1}selected{/if}> {$modmodresolniv1[lst].modalite} </option>
			   {/section}
	</select>
	
	
	<label for="moderesolutionniv2">Mode Résolution Niveau 2 : </label>
	<select id="moderesolutionniv2" value="{$data.moderesolutionniv2}"  disabled="disabled" name="moderesolutionniv2" title="Veuillez saisir un mode résolution niveau 2">					
				<option value="{$modalites.sousmodalite}">Choisissez votre information </option>
	</select>
	
	
	<label for="detailresolution">Details Résolution : </label>
	<input id="detailresolution" name="detailresolution" value="{$data.detailresolution}" title="Veuillez saisir un detail de résolution"  placeholder="Details Résolution">

	</div>
	
</fieldset>
<br>
	<div align="center" style="width:65%">
	<input type="submit" name="Enre_Fresolution" value="Enregistrer" onClick="javascript:setAction(this.form, this.form.Enre_Fresolution, 'Enregistrer')"/>		
		</div>	
</form>








