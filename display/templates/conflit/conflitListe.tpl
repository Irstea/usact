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
			<th>Nom - Prénom</th>
			<th>Date de début</th>
			<th>Date de fin</th>
			<th>Date de saisie</th>
			<th>Détail sur le conflit</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td style="text-align: center;"><a href="index.php?module=conflitDisplay&id={$data[lst].conflit_id}">
										{$data[lst].conflit_id}</a></td>
		<td style="text-align: center;" autofocus>{$data[lst].personne_saisie_conflit_nom} 
										{$data[lst].personne_saisie_conflit_prenom}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_debut}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_fin}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_saisie}</td>
		<td style="text-align: center;">{$data[lst].conflit_detail}</td>
	</tr>
	{/section} </tdata>	
	
	<a href="index.php?module=conflitChange">Nouveau Conflit</a>
</table>
{/if}
