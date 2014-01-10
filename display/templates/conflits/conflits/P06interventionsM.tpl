<p> <font size="4"><b>Enregistrer une intervention</b></font></p>
<script language="javascript" SRC="display/javascript/fonctions.js"></script> 

<div>
<a href="index.php?module=P06interventionsL2&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}&numacteur={$idacteur}" style="color:MediumBlue" title="Retour à la recherche intervention">Retour à la recherche intervention</a>
</div>


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




<form name="interventionsM" method="post" action="index.php" >
<input type="hidden" name="module" value="P06interventionsE">
<input type="hidden" name="numinterv" value="{$data.numinterv}">

<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">
<input type="hidden" name="numacteur" value="{$idacteur}">



<fieldset>
		
	<div align="center">
	
	<label for="dateentree">Date Entrée <em>*</em> : </label>
	<input id="dateentree" name="dateentree" value="{$data.dateentree}" required title="Veuillez saisir une date d'entrée"  placeholder="Date Entrée">
	

	<label for="datesortie">Date Sortie : </label>
	<input id="datesortie" name="datesortie" value="{$data.datesortie}" title="Veuillez saisir une date de sortie" placeholder="Date Sortie">
	

	<label for="role">Role : </label>
	<select id="role" name="role"  value="{$data.role}" title="Veuillez saisir le role" >
			<option value="" {if $data.numinterv == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modrole}
					<option value="{$modrole[lst].modalite}" {if $modrole[lst].modalite == $data.role}selected{/if}> {$modrole[lst].modalite} </option>
			   {/section}
	</select>
	

	<label for="positionusageactivite">Position Usage Activite <em>*</em> :</label>
	<select id="positionusageactivite" name="positionusageactivite"  value="{$data.positionusageactivite}" onclick='rechercheSelect("positionusageactivite", 3, "usageactiviteniv1", "index.php?module=P06interventionsA&libellemodposusagact=", "usageactiviteniv1"); if(this.value=="Non renseigné") document.getElementById("usageactiviteniv1").disabled=true; document.getElementById("usageactiviteniv2").disabled=true;' required title="Veuillez saisir une position d'usage activite" >
			<option value="" {if $data.numinterv == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modposusagact}
					<option value="{$modposusagact[lst].modalite}" {if $modposusagact[lst].modalite == $data.positionusageactivite}selected{/if}> {$modposusagact[lst].modalite} </option>
			   {/section}
	</select>

 	<label for="usageactiviteniv1">Usage Activite Niv 1 : </label>
	<select id="usageactiviteniv1" value="{$data.usageactiviteniv1}"  disabled="disabled" name="usageactiviteniv1" onclick='rechercheSelect("usageactiviteniv1", 3, "usageactiviteniv2", "index.php?module=P06interventionsA&libellemodusagniv1=", "usageactiviteniv2")' title="Veuillez saisir un usage d'activite Niv 1">					
				<option value="{$modalites.modalite}">Choisissez votre information </option>
	</select>

	<label for="usageactiviteniv2">Usage Activite Niv 2 : </label>
	<select id="usageactiviteniv2" value="{$data.usageactiviteniv2}"  disabled="disabled" name="usageactiviteniv2" title="Veuillez saisir un usage d'activite Niv 2">					
				<option value="{$modalites.sousmodalite}">Choisissez votre information </option>
	</select>
	
	<label for="detailsusage">Details Usage : </label>
	<input id="detailsusage" name="detailsusage" value="{$data.detailsusage}" title="Veuillez saisir un détail d'usage" placeholder="Detail Usage">


	<label for="perssaisieinterv">Nom de Saisie <em>*</em> : </label>
	<input id="perssaisieinterv" name="perssaisieinterv" value="{$data.perssaisieinterv}" required title="Veuillez préciser le nom de saisie" placeholder="Nom de Saisie">


	<label for="datesaisieinterv">Date de Saisie <em>*</em> : </label>
	<input id="datesaisieinterv" name="datesaisieinterv" value="{$data.datesaisieinterv}" required title="Veuillez préciser la date de saisie"  placeholder="Date de Saisie">


	</div>
	
</fieldset>
<br>
	<div align="center" style="width:65%">
	<input type="submit" name="Enre_Finterventions" value="Enregistrer" onClick="javascript:setAction(this.form, this.form.Enre_Finterventions, 'Enregistrer')"/>		
	</div>			
</form>








