<p> <font size="4"><b>Enregistrer un acteur</b></font></p> 
<script language="javascript" SRC="display/javascript/fonctions.js"></script>

<div>
<a href="index.php?module=P04acteursL&numconflit={$idconflit}&numconflitexpr={$idconflitexpr}&numeroinsee={$idville}&numerolocalisation={$idlocalisation}&numarticle={$idarticle}" style="color:MediumBlue" title="Retour à la liste acteur">Retour à la liste acteur</a>
</div>

<br>

<style type="text/css">
 {literal}
 /* Affichage */
fieldset {
  padding: 10px;
  margin-left: 0; 
  margin-right: auto;
  width:75%; 
  border:0;
}

label {
  text-align: left;
  display: inline-block;
  margin: 6px;
  padding:6px;
  width:35%;
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


<form method="post" name="acteursM" action="index.php">
<input type="hidden" name="module" value="P04acteursE">
<input type="hidden" name="numacteur" value="{$data.numacteur}">
<input type="hidden" name="numconflit" value="{$idconflit}">
<input type="hidden" name="numconflitexpr" value="{$idconflitexpr}">
<input type="hidden" name="numeroinsee" value="{$idville}">
<input type="hidden" name="numerolocalisation" value="{$idlocalisation}">
<input type="hidden" name="numarticle" value="{$idarticle}">


<fieldset>

<div align="center">
		
	<label for="nomacteurmoral">Nom de l'acteur moral : </label>
	<input id="nomacteurmoral" name="nomacteurmoral" value="{$data.nomacteurmoral}" title="Veuillez saisir un nom d'acteur moral"  placeholder="Nom de l'acteur moral">
	

	<label for="codepostalmoral">Code postal de l'acteur moral : </label>
	<input id="codepostalmoral" name="codepostalmoral" value="{$data.codepostalmoral}" title="Veuillez saisir le code postal moral"  placeholder="Code postal de l'acteur moral">
	

	<label for="villemoral">Ville de l'acteur moral : </label>
	<input id="villemoral" name="villemoral" value="{$data.villemoral}" title="Veuillez saisir la ville de l'acteur moral"  placeholder="Ville de l'acteur moral">

	
	<label for="nomacteurphysique">Nom de l'acteur physique : </label>
	<input id="nomacteurphysique" name="nomacteurphysique" value="{$data.nomacteurphysique}" title="Veuillez saisir un nom d'acteur physique"  placeholder="Nom de l'acteur physique">
	

	<label for="codepostalphysique">Code postal de l'acteur physique : </label>
	<input id="codepostalphysique" name="codepostalphysique" value="{$data.codepostalphysique}" title="Veuillez saisir le code postal physique"  placeholder="Code postal de l'acteur physique">	

	<label for="villephysique">Ville de l'acteur physique : </label>
	<input id="villephysique" name="villephysique" value="{$data.villephysique}" title="Veuillez saisir la ville de l'acteur physique"  placeholder="Ville de l'acteur physique">

	
	<label for="acteurniv1">Acteur de Niveau 1 : </label>
	<select id="acteurniv1" name="acteurniv1"  value="{$data.acteurniv1}" onclick='rechercheSelect("acteurniv1", 3, "acteurniv2", "index.php?module=P04acteursA&libelleNiveau1=", "acteurniv2")' title="Veuillez saisir l'acteur de niveau 1" >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modniveau1}
					<option value="{$modniveau1[lst].modalite}" {if $modniveau1[lst].modalite == $data.acteurniv1}selected{/if}> {$modniveau1[lst].modalite} </option>
			   {/section}
	</select>
		
	
	<label for="acteurniv2">Acteur de Niveau 2 : </label>
	<select id="acteurniv2" value="{$data.acteurniv2}"  disabled="disabled" name="acteurniv2" onclick='rechercheSelect("acteurniv2", 3, "acteurniv3", "index.php?module=P04acteursA&libelleNiveau2=", "acteurniv3")' title="Veuillez saisir l'acteur de niveau 2">					
				<option value="{$modalites.sousmodalite}">Choisissez votre information </option>
	</select>


	<label for="acteurniv3">Acteur de Niveau 3 : </label>
	<select id="acteurniv3" value="{$data.acteurniv3}"  disabled="disabled" name="acteurniv3" title="Veuillez saisir l'acteur de niveau 3">					
				<option value="{$modalites.sousmodalite}">Choisissez votre information </option>
	</select>
	

	<label for="statutacteur">Statut de l'acteur : </label>
	<select id="statutacteur" name="statutacteur"  value="{$data.statutacteur}" title="Veuillez saisir le statut de l'acteur"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatutacteur}
					<option value="{$modstatutacteur[lst].modalite}" {if $modstatutacteur[lst].modalite == $data.statutacteur}selected{/if}> {$modstatutacteur[lst].modalite} </option>
			   {/section}
	</select>

	<label for="detailstatutacteur">Detail du statut de l'acteur : </label>
	<input id="detailstatutacteur" name="detailstatutacteur" value="{$data.detailstatutacteur}" title="Veuillez saisir le detail du statut de l'acteur"  placeholder="Detail statut de l'acteur">



	<label for="orgproduct">Organisme de production : </label>
	<select id="orgproduct" name="orgproduct"  value="{$data.orgproduct}" onclick='if(this.value=="Non") document.getElementById("statutorgprod").disabled=true; document.getElementById("detailorgprod").disabled=true; if(this.value=="Oui") document.getElementById("statutorgprod").disabled=false; document.getElementById("detailorgprod").disabled=false;' title="Veuillez saisir l'organisme de production"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.orgproduct == "Oui" or $data.orgproduct == "-1"}selected{/if}>Oui </option>
	</select>
	
	<label for="statutorgprod">Statut organisme de production : </label>
	<select id="statutorgprod" name="statutorgprod"  value="{$data.statutorgprod}" disabled="disabled" title="Veuillez saisir le statut de l'organisme de production"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutorgprod}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>
		
	<label for="detailorgprod">Detail organisme de production : </label>
	<input id="detailorgprod" name="detailorgprod" disabled="disabled" value="{$data.detailorgprod}" title="Veuillez saisir le detail de l'organisme de production"  placeholder="Details statut organisme de production">



	<label for="partipolitique">Parti politique : </label>
	<select id="partipolitique" name="partipolitique"  value="{$data.partipolitique}" onclick='if(this.value=="Non") document.getElementById("statutpartipolitique").disabled=true; document.getElementById("detailpartipolitique").disabled=true; if(this.value=="Oui") document.getElementById("statutpartipolitique").disabled=false; document.getElementById("detailpartipolitique").disabled=false;' title="Veuillez saisir l'organisme de production"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.partipolitique == "Oui" or $data.partipolitique == "-1"}selected{/if}>Oui </option>
	</select>

	<label for="statutpartipolitique">Statut du parti politique : </label>
	<select id="statutpartipolitique" name="statutpartipolitique"  value="{$data.statutpartipolitique}" disabled="disabled" title="Veuillez saisir le statut du parti politique"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutpartipolitique}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>
		
	<label for="detailpartipolitique">Detail du statut du parti politique : </label>
	<input id="detailpartipolitique" name="detailpartipolitique" disabled="disabled" value="{$data.detailpartipolitique}" title="Veuillez saisir le detail du statut du parti politique"  placeholder="Detail du statut du parti politique">



	<label for="syndicat">Syndicat : </label>
	<select id="syndicat" name="syndicat"  value="{$data.syndicat}" onclick='if(this.value=="Non") document.getElementById("statutsyndicat").disabled=true; document.getElementById("detailsyndicat").disabled=true; if(this.value=="Oui") document.getElementById("statutsyndicat").disabled=false; document.getElementById("detailsyndicat").disabled=false;' title="Veuillez saisir le syndicat"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.syndicat == "Oui" or $data.syndicat == "-1"}selected{/if}>Oui </option>
	</select>

	<label for="statutsyndicat">Statut du syndicat : </label>
	<select id="statutsyndicat" name="statutsyndicat"  value="{$data.statutsyndicat}" disabled="disabled" title="Veuillez saisir le statut du syndicat"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutsyndicat}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>

	<label for="detailsyndicat">Detail du statut du syndicat : </label>
	<input id="detailsyndicat" name="detailsyndicat" disabled="disabled" value="{$data.detailsyndicat}" title="Veuillez saisir le detail du statut du syndicat"  placeholder="Detail du statut du syndicat">



	<label for="comitequartier">Comite du quartier : </label>
	<select id="comitequartier" name="comitequartier"  value="{$data.comitequartier}" onclick='if(this.value=="Non") document.getElementById("statutquartier").disabled=true; document.getElementById("detailquartier").disabled=true; if(this.value=="Oui") document.getElementById("statutquartier").disabled=false; document.getElementById("detailquartier").disabled=false;' title="Veuillez saisir le comité du quartier"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.comitequartier == "Oui" or $data.comitequartier == "-1"}selected{/if}>Oui </option>
	</select>

	<label for="statutquartier">Statut du comite du quartier : </label>
	<select id="statutquartier" name="statutquartier"  value="{$data.statutquartier}" disabled="disabled" title="Veuillez saisir le statut du comité du quartier"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutquartier}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>
	
	<label for="detailquartier">Detail du statut du comite du quartier : </label>
	<input id="detailquartier" name="detailquartier" disabled="disabled" value="{$data.detailquartier}" title="Veuillez saisir le detail du statut du comité du quartier"  placeholder="Detail du statut du comite du quartier">



	<label for="syndiccopropriete">Syndicat de copropriété : </label>
	<select id="syndiccopropriete" name="syndiccopropriete"  value="{$data.syndiccopropriete}" onclick='if(this.value=="Non") document.getElementById("statutcopropriete").disabled=true; document.getElementById("detailcopropriete").disabled=true; if(this.value=="Oui") document.getElementById("statutcopropriete").disabled=false; document.getElementById("detailcopropriete").disabled=false;' title="Veuillez saisir le syndicat de copropriété"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.syndiccopropriete == "Oui" or $data.syndiccopropriete == "-1"}selected{/if}>Oui </option>
	</select>
	
	
	<label for="statutcopropriete">Statut du syndicat de copropriété : </label>
	<select id="statutcopropriete" name="statutcopropriete"  value="{$data.statutcopropriete}" disabled="disabled" title="Veuillez saisir le statut du syndicat de copropriété"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutcopropriete}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>
		
	<label for="detailcopropriete">Detail du statut du syndicat de copropriété : </label>
	<input id="detailcopropriete" name="detailcopropriete" disabled="disabled" value="{$data.detailcopropriete}" title="Veuillez saisir le detail du statut du syndicat de copropriété"  placeholder="Detail du statut du syndicat de copropriété">



	<label for="assopatricult">Association patrimoine/culturelle : </label>
	<select id="assopatricult" name="assopatricult"  value="{$data.assopatricult}" onclick='if(this.value=="Non") document.getElementById("statutassopatricult").disabled=true; document.getElementById("detailassopatricult").disabled=true; if(this.value=="Oui") document.getElementById("statutassopatricult").disabled=false; document.getElementById("detailassopatricult").disabled=false;' title="Veuillez saisir l'association patrimoine/culturelle"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.assopatricult == "Oui" or $data.assopatricult == "-1"}selected{/if}>Oui </option>
	</select>
	
	
	<label for="statutassopatricult">Statut de l'association patrimoine/culturelle : </label>
	<select id="statutassopatricult" name="statutassopatricult"  value="{$data.statutassopatricult}" disabled="disabled" title="Veuillez saisir le statut de l'association patrimoine/culturelle"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutassopatricult}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>
	
	<label for="detailassopatricult">Detail du statut de l'association patrimoine/culturelle : </label>
	<input id="detailassopatricult" name="detailassopatricult" disabled="disabled" value="{$data.detailassopatricult}" title="Veuillez saisir le detail du statut de l'association patrimoine/culturelle"  placeholder="Detail du statut de l'association patrimoine/culturelle">



	<label for="assoenvgeneraliste">Association environnementale généraliste : </label>
	<select id="assoenvgeneraliste" name="assoenvgeneraliste"  value="{$data.assoenvgeneraliste}" onclick='if(this.value=="Non") document.getElementById("statutassoenvgeneraliste").disabled=true; document.getElementById("detailassoenvgeneraliste").disabled=true; if(this.value=="Oui") document.getElementById("statutassoenvgeneraliste").disabled=false; document.getElementById("detailassoenvgeneraliste").disabled=false;' title="Veuillez saisir l'association environnementale généraliste"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.assoenvgeneraliste == "Oui" or $data.assoenvgeneraliste == "-1"}selected{/if}>Oui </option>	
	</select>
	
	<label for="statutassoenvgeneraliste">Statut de l'association environnementale généraliste : </label>
	<select id="statutassoenvgeneraliste" name="statutassoenvgeneraliste"  value="{$data.statutassoenvgeneraliste}" disabled="disabled" title="Veuillez saisir le statut de l'association environnementale généraliste"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutassoenvgeneraliste}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>

	<label for="detailassoenvgeneraliste">Detail du statut de l'association environnementale généraliste : </label>
	<input id="detailassoenvgeneraliste" name="detailassoenvgeneraliste" disabled="disabled" value="{$data.detailassoenvgeneraliste}" title="Veuillez saisir le detail du statut de l'association environnementale généraliste"  placeholder="Detail du statut de l'association environnementale généraliste">
	
	
	
	<label for="assoenvlocalisee">Association environnementale localisée : </label>
	<select id="assoenvlocalisee" name="assoenvlocalisee"  value="{$data.assoenvlocalisee}" onclick='if(this.value=="Non") document.getElementById("statutassoenvlocalisee").disabled=true; document.getElementById("detailassoenvlocalisee").disabled=true; if(this.value=="Oui") document.getElementById("statutassoenvlocalisee").disabled=false; document.getElementById("detailassoenvlocalisee").disabled=false;' title="Veuillez saisir l'association environnementale localisée"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.assoenvlocalisee == "Oui" or $data.assoenvlocalisee == "-1"}selected{/if}>Oui </option>			
	</select>



	<label for="statutassoenvlocalisee">Statut de l'association environnementale localisée : </label>
	<select id="statutassoenvlocalisee" name="statutassoenvlocalisee"  value="{$data.statutassoenvlocalisee}" disabled="disabled" title="Veuillez saisir le statut de l'association environnementale localisée"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutassoenvlocalisee}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>

	<label for="detailassoenvlocalisee">Detail du statut de l'association environnementale localisée : </label>
	<input id="detailassoenvlocalisee" name="detailassoenvlocalisee" disabled="disabled" value="{$data.detailassoenvlocalisee}" title="Veuillez saisir le detail du statut de l'association environnementale localisée"  placeholder="Detail du statut de l'association environnementale localisée">




	<label for="assosportsnautiques">Association sports nautiques : </label>
	<select id="assosportsnautiques" name="assosportsnautiques"  value="{$data.assosportsnautiques}" onclick='if(this.value=="Non") document.getElementById("statutassosportsnautiques").disabled=true; document.getElementById("detailassosportsnautiques").disabled=true; if(this.value=="Oui") document.getElementById("statutassosportsnautiques").disabled=false; document.getElementById("detailassosportsnautiques").disabled=false;' title="Veuillez saisir l'association sports nautiques"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.assosportsnautiques == "Oui" or $data.assosportsnautiques == "-1"}selected{/if}>Oui </option>			
	</select>

	<label for="statutassosportsnautiques">Statut de l'association sports nautiques : </label>
	<select id="statutassosportsnautiques" name="statutassosportsnautiques"  value="{$data.statutassosportsnautiques}" disabled="disabled" title="Veuillez saisir le statut de l'association sports nautiques"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutassosportsnautiques}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>


	<label for="detailassosportsnautiques">Detail du statut de l'association sports nautiques : </label>
	<input id="detailassosportsnautiques" name="detailassosportsnautiques" disabled="disabled" value="{$data.detailassosportsnautiques}" title="Veuillez saisir le detail du statut de l'association sports nautiques"  placeholder="Detail du statut de l'association sports nautiques">
	



	<label for="assosportspleinair">Association sports de plein air : </label>
	<select id="assosportspleinair" name="assosportspleinair"  value="{$data.assosportspleinair}" onclick='if(this.value=="Non") document.getElementById("statutassosportspleinair").disabled=true; document.getElementById("detailassosportspleinair").disabled=true; if(this.value=="Oui") document.getElementById("statutassosportspleinair").disabled=false; document.getElementById("detailassosportspleinair").disabled=false;' title="Veuillez saisir l'association sports de plein air"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.assosportspleinair == "Oui" or $data.assosportspleinair == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="statutassosportspleinair">Statut de l'association sports de plein air : </label>
	<select id="statutassosportspleinair" name="statutassosportspleinair"  value="{$data.statutassosportspleinair}" disabled="disabled" title="Veuillez saisir le statut de l'association sports de plein air"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutassosportspleinair}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>

	<label for="detailassosportspleinair">Detail du statut de l'association sports de plein air : </label>
	<input id="detailassosportspleinair" name="detailassosportspleinair" disabled="disabled" value="{$data.detailassosportspleinair}" title="Veuillez saisir le detail du statut de l'association sports de plein air"  placeholder="Detail du tatut de l'association sports de plein air">



	<label for="assochassepeche">Association chasse/pêche : </label>
	<select id="assochassepeche" name="assochassepeche"  value="{$data.assochassepeche}" onclick='if(this.value=="Non") document.getElementById("statutassochassepeche").disabled=true; document.getElementById("detailassochassepeche").disabled=true; if(this.value=="Oui") document.getElementById("statutassochassepeche").disabled=false; document.getElementById("detailassochassepeche").disabled=false;' title="Veuillez saisir l'association chasse/pêche"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.assochassepeche == "Oui" or $data.assochassepeche == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="statutassochassepeche">Statut de l'association chasse/pêche : </label>
	<select id="statutassochassepeche" name="statutassochassepeche"  value="{$data.statutassochassepeche}" disabled="disabled" title="Veuillez saisir le statut de l'association chasse/pêche"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutassochassepeche}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>

	<label for="detailassochassepeche">Detail du statut de l'association chasse/pêche : </label>
	<input id="detailassochassepeche" name="detailassochassepeche" disabled="disabled" value="{$data.detailassochassepeche}" title="Veuillez saisir le detail du statut de l'association chasse/pêche"  placeholder="Detail du statut de l'association chasse/pêche">



	<label for="autreassosportive">Association sportive (autre) : </label>
	<select id="autreassosportive" name="autreassosportive"  value="{$data.autreassosportive}" onclick='if(this.value=="Non") document.getElementById("statutautreassosport").disabled=true; document.getElementById("detailautreassosport").disabled=true; if(this.value=="Oui") document.getElementById("statutautreassosport").disabled=false; document.getElementById("detailautreassosport").disabled=false;' title="Veuillez saisir l'association sportive"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.autreassosportive == "Oui" or $data.autreassosportive == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="statutautreassosport">Statut de l'association sportive (autre) : </label>
	<select id="statutautreassosport" name="statutautreassosport"  value="{$data.statutautreassosport}" disabled="disabled" title="Veuillez saisir le statut de l'association sportive"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modstatut}
					<option value="{$modstatut[lst].modalite}" {if $modstatut[lst].modalite == $data.statutautreassosport}selected{/if}> {$modstatut[lst].modalite} </option>
			   {/section}
	</select>

	<label for="detailautreassosport">Detail du statut de l'association sportive (autre) : </label>
	<input id="detailautreassosport" name="detailautreassosport" disabled="disabled" value="{$data.detailautreassosport}" title="Veuillez saisir le detail du statut de l'association sportive"  placeholder="Detail du statut de l'association sportive (autre)">


	<label for="maire">Maire : </label>
	<select id="maire" name="maire"  value="{$data.maire}" title="Veuillez saisir le maire"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.maire == "Oui" or $data.maire == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="conseillermunicipal">Conseiller municipal : </label>
	<select id="conseillermunicipal" name="conseillermunicipal"  value="{$data.conseillermunicipal}" title="Veuillez saisir le conseiller municipal"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.conseillermunicipal == "Oui" or $data.conseillermunicipal == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="depute">Depute : </label>
	<select id="depute" name="depute"  value="{$data.depute}" title="Veuillez saisir le depute"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.depute == "Oui" or $data.depute == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="deputeeuropeen">Depute europeen : </label>
	<select id="deputeeuropeen" name="deputeeuropeen"  value="deputeeuropeen" title="Veuillez saisir le depute europeen"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.deputeeuropeen == "Oui" or $data.deputeeuropeen == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="senateur">Senateur : </label>
	<select id="senateur" name="senateur"  value="senateur" title="Veuillez saisir le senateur"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.senateur == "Oui" or $data.senateur == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="presidentconseilregional">President conseil regional : </label>
	<select id="presidentconseilregional" name="presidentconseilregional"  value="presidentconseilregional" title="Veuillez saisir le president conseil regional"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.presidentconseilregional == "Oui" or $data.presidentconseilregional == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="conseillerregional">Conseiller regional : </label>
	<select id="conseillerregional" name="conseillerregional"  value="conseillerregional" title="Veuillez saisir le conseiller regional"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.conseillerregional == "Oui" or $data.conseillerregional == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="presidentconseilgeneral">Président conseil général : </label>
	<select id="presidentconseilgeneral" name="presidentconseilgeneral"  value="presidentconseilgeneral" title="Veuillez saisir le président conseil général"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.presidentconseilgeneral == "Oui" or $data.presidentconseilgeneral == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="conseillergeneral">Conseiller général : </label>
	<select id="conseillergeneral" name="conseillergeneral"  value="conseillergeneral" title="Veuillez saisir le conseiller général"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.conseillergeneral == "Oui" or $data.conseillergeneral == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="presidentepci">Président EPCI : </label>
	<select id="presidentepci" name="presidentepci"  value="presidentepci" title="Veuillez saisir le président EPCI"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.presidentepci == "Oui" or $data.presidentepci == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="membreepci">Membre EPCI : </label>
	<select id="membreepci" name="membreepci"  value="membreepci" title="Veuillez saisir le membre EPCI"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.membreepci == "Oui" or $data.membreepci == "-1"}selected{/if}>Oui </option>			
	</select>


	<label for="eluchambreconsulaire">Elu Chambre consulaire : </label>
	<select id="eluchambreconsulaire" name="eluchambreconsulaire"  value="eluchambreconsulaire" title="Veuillez saisir elu chambre consulaire"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.eluchambreconsulaire == "Oui" or $data.eluchambreconsulaire == "-1"}selected{/if}>Oui </option>			
	</select>
	
	
	<label for="candidatlisteelect">Candidat liste électorale : </label>
	<select id="candidatlisteelect" name="candidatlisteelect"  value="candidatlisteelect" title="Veuillez saisir le candicat liste électorale"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.candidatlisteelect == "Oui" or $data.candidatlisteelect == "-1"}selected{/if}>Oui </option>			
	</select>

	<label for="autre">Autre : </label>
	<select id="autre" name="autre"  value="autre" title="Veuillez saisir autre"  >
			<option value="Non" {if $data.numacteur == 0} selected{/if}>Non </option>
			<option value="Oui" {if $data.autre == "Oui" or $data.autre == "-1"}selected{/if}>Oui </option>			
	</select>
	
	
	<label for="detailautre">Detail Autre : </label>
	<input id="detailautre" name="detailautre" value="{$data.detailautre}" title="Veuillez saisir detail autre"  placeholder="Detail Autre">
			
	<label for="particulier">Particulier : </label>
	<select id="particulier" name="particulier"  value="{$data.particulier}" title="Veuillez saisir le particulier"  >
			<option value="" {if $data.numacteur == 0} selected{/if}>Choisissez votre information </option>
			   {section name=lst loop=$modparticulier}
					<option value="{$modparticulier[lst].modalite}" {if $modparticulier[lst].modalite == $data.particulier}selected{/if}> {$modparticulier[lst].modalite} </option>
			   {/section}
	</select>


	<label for="perssaisieacteur">Nom de saisie <em>*</em> : </label>
	<input id="perssaisieacteur" name="perssaisieacteur" value="{$data.perssaisieacteur}" title="Veuillez saisir le nom de saisie"  placeholder="Nom de saisie">

	<label for="datesaisieacteur">Date de saisie <em>*</em> : </label>
	<input id="datesaisieacteur" name="datesaisieacteur" value="{$data.datesaisieacteur}" title="Veuillez saisir la date de saisie"  placeholder="Date de saisie">

</div>
	
</fieldset>

<br>

<div align="center" style="width:75%">
	<input type="submit" name="Enre_Facteurs" value="Enregistrer" onClick="javascript:setAction(this.form, this.form.Enre_Facteurs, 'Enregistrer')"/>
</div>	
	
</form>







