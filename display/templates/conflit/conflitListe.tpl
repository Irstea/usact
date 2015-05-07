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
			<th>Date début conflit</th>
			<th>Date fin conflit</th>
			<th>Date saisie conflit</th>
			<th>Détail conflit</th>
			<th>Login</th>
		</tr>
	</thead>
	<tdata> {section name=lst loop=$data}
	<tr>
		<td style="text-align: center;"><a href="index.php?module=conflitDisplay&id={$data[lst].conflit_id}">
										{$data[lst].conflit_id}</a></td>
		<td style="text-align: center;">{$data[lst].conflit_date_debut}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_fin}</td>
		<td style="text-align: center;">{$data[lst].conflit_date_saisie}</td>
		<td style="text-align: center;">{$data[lst].conflit_detail}</td>
		<td style="text-align: center;">{$data[lst].conflit_login_saisie}</td>
	</tr>
	{/section} </tdata>	
	
	<a href="index.php?module=conflitChange">Nouveau Conflit</a>
</table>
{/if}
