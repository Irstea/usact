<script>
	setDataTables("idListe");
</script>
<h2>Liste des périmètres :</h2>
{include file="conflit/perimetreSearch.tpl"}
{if $isSearch == 1}
<a href="index.php?module=perimetreChange&perimetre_id=0">Nouveau périmètre</a>
<table id="idListe" class="tableListe">
	<thead>
		<tr>
			<th class="center">
			<img src="display/images/edit.gif" height="20">
			</th>
			<th>Type</th>
			<th>Objet</th>
			<th>Bien support</th>
			<th>Description</th>			
			<th>Récurrence</th>						
			<th>Échelle</th>			
		</tr>
	</thead>
	<tbody> {section name=lst loop=$data}
	<tr>
		<td class="center">
		<a href="index.php?module=perimetreDisplay&perimetre_id={$data[lst].perimetre_id}">
			<img src="display/images/edit.gif" height="20">
		</a>
		</td>
		<td>{$data[lst].type_perimetre_libelle}</td>
		<td>{$data[lst].objet_niv1_libelle}<br>{$data[lst].objet_niv2_libelle}</td>
		<td>{$data[lst].bien_support_niv1_libelle}
		<br>{$data[lst].bien_support_niv2_libelle}</td>
		<td>{$data[lst].perimetre_detail}</td>		
		<td>{$data[lst].recurrence_libelle}</td>	
		<td>{$data[lst].echelle_libelle}</td>		
	</tr>
	{/section} 
	</tbody>		
</table>
{/if}
<br>