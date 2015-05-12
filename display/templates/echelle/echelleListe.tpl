<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=echelleChange&id=0">{$LANG.gestion.7}</a>
{include file="echelle/echelleSearch.tpl"} 
{if $isSearch == 1}
<a href="index.php?module=echelleChange&id=0">Nouvelle echelle</a>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>ID de l'echelle</th>
			<th>Libellé de l'echelle</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td style="text-align: center;"><a href="index.php?module=echelleDisplay&id={$data[lst].echelle_id}">
										{$data[lst].echelle_id}</a></td>
		<td>{$data[lst].echelle_libelle}</td>
	</tr>
	{/section} </tdata>		
</table>
{/if}