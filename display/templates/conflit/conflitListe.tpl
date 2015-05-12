<script>
	setDataTables("idListe");
</script>
<h2>{$LANG.gestion.0}</h2>
<a href="index.php?module=conflitChange&id=0">{$LANG.gestion.7}</a>
{include file="conflit/conflitSearch.tpl"} 
{if $isSearch == 1}
<a href="index.php?module=conflitChange&id=0">Nouveau Conflit</a>
{section name=lst loop=$data}	
<dl>			
			
		<dt>ID du conflit</dt>
			<dd style="text-align: center;"><a href="index.php?module=conflitDisplay&id={$data[lst].conflit_id}">
			{$data[lst].conflit_id}</a></dd>
		<dt>Date début conflit</dt>
			<dd style="text-align: center;">{$data[lst].conflit_date_debut}</dd>
		<dt>Date fin conflit</dt>
			<dd style="text-align: center;">{$data[lst].conflit_date_fin}</dd>
		<dt>Date saisie conflit</dt>
			<dd style="text-align: center;">{$data[lst].conflit_date_saisie}</dd>
		<dt>Détail conflit</dt>
			<dd>{$data[lst].conflit_detail}</dd>
		<dt>Login</dt>
			<dd>{$data[lst].conflit_login_saisie}</dd>			
 	
</dl>
	{/section}
{/if}
