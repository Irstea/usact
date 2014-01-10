<p> <font size="4"><b>Enregistrer un conflit</b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P01conflitsL" style="color:MediumBlue" title="Retour à la liste conflit">Retour à la liste conflit</a>
</div> 

{if $data.numconflit > 0}
<div>
<a href="index.php?module=P01conflitsD&numconflit={$data.numconflit}&numeroinsee={$idville}" style="color:MediumBlue" title="Retour au détail conflit">Retour au détail conflit</a>
</div>
{/if}

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


<form name="conflitsM" method="post" action="index.php?module=P01conflitsE"  >
<input type="hidden" name="module" value="P01conflitsE">
<input type="hidden" name="numconflit" value="{$data.numconflit}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<fieldset>

<div align="center">
	
	<label for="typeconflit">Type de Conflit <em>*</em> : </label>
	<select id="typeconflit" value="{$data.typeconflit}" name="typeconflit" onclick='rechercheSelect("typeconflit", 3, "objetniv1", "index.php?module=P01conflitsA&libelleTC=", "objetniv1"); if(this.value=="") document.getElementById("biensupportniv1").disabled=true; document.getElementById("objetniv1").disabled=true; if(this.value=="Socio Economique") document.getElementById("biensupportniv1").disabled=true;document.getElementById("biensupportniv2").disabled=true; if(this.value=="Usage") document.getElementById("biensupportniv1").disabled=false;document.getElementById("biensupportniv1").selectedIndex=1; document.getElementById("objetniv1").disabled=false;' 
		  required title="Veuillez saisir un type de conflit" > 
			  <option value="" {if $data.numconflit == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modtypeconflit}
					<option value="{$modtypeconflit[lst].modalite}"> {$modtypeconflit[lst].modalite} </option>
			   {/section}
	</select>
	
	<label for="biensupportniv1">Bien Support Niveau 1 : </label>
	<select id="biensupportniv1" disabled="disabled" value="{$data.biensupportniv1}"  name="biensupportniv1" onclick='rechercheSelect("biensupportniv1", 3, "biensupportniv2", "index.php?module=P01conflitsA&libelleBS1=", "biensupportniv2")' title="Veuillez saisir un bien support niveau 1" >
			 <option value="" {if $data.numconflit == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modbsniv1}
					<option value="{$modbsniv1[lst].modalite}"> {$modbsniv1[lst].modalite} </option>
			   {/section}
	</select>	
		
	<label for="biensupportniv2">Bien Support Niveau 2 : </label>
	<select id="biensupportniv2" value="{$data.biensupportniv2}"  disabled="disabled" name="biensupportniv2" title="Veuillez saisir un bien support niv 2">					
				<option value="{$modalites.sousmodalite}">Choisissez votre information </option>
	</select>
	
	<label for="objetniv1">Objet Niveau 1 <em>*</em> : </label>
	<select id="objetniv1" value="{$data.objetniv1}" disabled="disabled" name="objetniv1"  onclick='rechercheSelect("objetniv1", 3, "objetniv2", "index.php?module=P01conflitsA&libelleO1=", "objetniv2")' required title="Veuillez saisir un objet niveau 1">							
				<option value="{$modalites.modalite}" selected>Choisissez votre information </option>
	</select>
		
	<label for="objetniv2">Objet Niveau 2 <em>*</em> : </label>
	<select id="objetniv2" value="{$data.objetniv2}" disabled="disabled" name="objetniv2" required title="Veuillez saisir un objet niveau 2">							
				<option value="{$modalites.sousmodalite}">Choisissez votre information </option>
	</select>
	
	<label for="echelle">Echelle : </label>
	<select id="echelle" name="echelle"  value="{$data.echelle}" title="Veuillez saisir une échelle"  >
			<option value="" {if $data.numconflit == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modechelle}
					<option value="{$modechelle[lst].modalite}" {if $modechelle[lst].modalite == $data.echelle}selected{/if}> {$modechelle[lst].modalite} </option>
			   {/section}
	</select>
	
	<label for="recurrence">Recurrence : </label>
	<select id="recurrence" name="recurrence"  value="{$data.recurrence}" title="Veuillez saisir une recurrence"  >
			<option value="" {if $data.numconflit == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modrecurrence}
					<option value="{$modrecurrence[lst].modalite}" {if $modrecurrence[lst].modalite == $data.recurrence}selected{/if}> {$modrecurrence[lst].modalite} </option>
			   {/section}
	</select>
	
	<label for="detailsconflits">Details du Conflit : </label>
	<input name="detailsconflits" value="{$data.detailsconflits}" title="Veuillez saisir le détail du conflit" placeholder="Details du conflit">
	
	<label for="perssaisieconf">Nom de Saisie <em>*</em> : </label>
	<input id="perssaisieconf" name="perssaisieconf" value="{$data.perssaisieconf}" required title="Veuillez préciser un nom de saisie"  placeholder="Nom de Saisie">
	
	<label for="datesaisieconf">Date de Saisie <em>*</em> : </label>
	<input id="datesaisieconf" name="datesaisieconf" value="{$data.datesaisieconf}" required title="Veuillez préciser une date de saisie"  placeholder="Date de Saisie">
	
</div>

</fieldset>

<br>

<div align="center" style="width:65%">
	<input type="submit" name="Enre_Fconflits" value="Enregistrer" onClick="javascript:setAction(this.form, this.form.Enre_Fconflits, 'Enregistrer')"/>
</div>
			
</form>	
	
	
	
		







