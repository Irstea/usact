<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=conflitChange&id=0">{$LANG.gestion.7}</a>
{include file="conflit/conflitSearch.tpl"} 
{if $isSearch == 1}
<form method="get" action="index.php">
	<input type="hidden" name="module" value="conflitPdf"> <input
		type="submit" value="Imprimer la liste au format PDF">
</form>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>ID du conflit</th>
			<th>Nom - Prénom (conflit)</th>
			<th>Date début conflit</th>
			<th>Date fin conflit</th>
			<th>Date saisie conflit</th>
			<th>Détail conflit</th>
			<th>Recurrence</th>
			<th>Périmetre date saisie</th>
			<th>Périmetre détail</th>
			<th>Bien support niv1</th>
			<th>Bien support niv2</th>
			<th>Type périmetre</th>
			<th>Echelle</th>
			<th>Objet niv1</th>
			<th>Objet niv2</th>
			<th>Nom - Prénom (périmetre)</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td style="text-align: center;"><a href="index.php?module=conflitDisplay&id={$data[lst].conflit_id}">
										{$data[lst].conflit_id}</a></td>
		<td style="text-align: center;">{$data[lst].personne_saisie_conflit_nom} 
										{$data[lst].personne_saisie_conflit_prenom}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_debut}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_fin}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_saisie}</td>
		<td style="text-align: center;">{$data[lst].conflit_detail}</td>
		<td style="text-align: center;">{$data[lst].recurrence} fois</td>
		<td style="text-align: center;">{$data[lst].perimetre_date_saisie}</td>
		<td style="text-align: center;">{$data[lst].perimetre_detail}</td>
		<td style="text-align: center;">{$data[lst].bien_support_niv1_libelle}</td>
		<td style="text-align: center;">{$data[lst].bien_support_niv2_libelle}</td>
		<td style="text-align: center;">{$data[lst].type_perimetre_libelle}</td>
		<td style="text-align: center;">{$data[lst].echelle_libelle}</td>
		<td style="text-align: center;">{$data[lst].objet_niv1_libelle}</td>
		<td style="text-align: center;">{$data[lst].objet_niv2_libelle}</td>
		<td style="text-align: center;">{$data[lst].personne_saisie_perimetre_nom} 
										{$data[lst].personne_saisie_perimetre_prenom}</td>
	</tr>
	{/section} </tdata>	
	
	<a href="index.php?module=conflitChange">Nouveau Conflit</a>
</table>
{/if}
