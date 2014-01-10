<p> <font size="4"><b>Enregistrer un mode d'action</b></font></p>
<script language="javascript" SRC="display/javascript/fonctions.js"></script> 

<div>
<a href="index.php?module=P06interventionsD&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}&numinterv={$idinterv}" style="color:MediumBlue" title="Retour à la liste mode d'action">Retour à la liste mode d'action</a>
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


<form name="modesactionM" method="post" action="index.php" >
<input type="hidden" name="module" value="P07modesactionE">
<input type="hidden" name="numinterv" value="{$data.numinterv}">
<input type="hidden" name="numaction" value="{$data.numaction}">

<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">


<fieldset>
		
<div align="center">
	
	<label for="typemodeaction">Type du Mode d'Action : </label>
	<select id="typemodeaction" name="typemodeaction"  value="{$data.typemodeaction}" title="Veuillez saisir le type mode d'action" >
			<option value="" {if $data.numaction == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modtypmodact}
					<option value="{$modtypmodact[lst].modalite}" {if $modtypmodact[lst].modalite == $data.typemodeaction}selected{/if}> {$modtypmodact[lst].modalite} </option>
			   {/section}
	</select>

	<label for="modeaction">Mode d'Action : </label>
	<select id="modeaction" name="modeaction"  value="{$data.modeaction}" title="Veuillez saisir le mode d'action" >
			<option value="" {if $data.numaction == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modmodact}
					<option value="{$modmodact[lst].modalite}" {if $modmodact[lst].modalite == $data.modeaction}selected{/if}> {$modmodact[lst].modalite} </option>
			   {/section}
	</select>
	

	<label for="echelleaction">Echelle d'Action : </label>
	<select id="echelleaction" name="echelleaction"  value="{$data.echelleaction}" title="Veuillez saisir l'échelle d'action" >
			<option value="" {if $data.numaction == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modechact}
					<option value="{$modechact[lst].modalite}" {if $modechact[lst].modalite == $data.echelleaction}selected{/if}> {$modechact[lst].modalite} </option>
			   {/section}
	</select>
	

	<label for="dateaction">Date Action :</label>
	<input id="dateaction" name="dateaction" value="{$data.dateaction}" title="Veuillez saisir la date d'action"  placeholder="Date d'Action">
	

 	<label for="detailsactions">Details Actions : </label>
	<input id="detailsactions" name="detailsactions" value="{$data.detailsactions}" title="Veuillez saisir un détails d'action"  placeholder="Details Actions">


</div>
	
</fieldset>

<br>
	
<div align="center" style="width:65%">
	<input type="submit" name="Enre_Fmodesaction" value="Enregistrer" onClick="javascript:setAction(this.form, this.form.Enre_Fmodesaction, 'Enregistrer')"/>		
</div>		
</form>








