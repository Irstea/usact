<script>
$(document).ready(function() { 
	$(".selection").change(function () {
		$("#search").submit();
	} );
} ) ;
</script>

<form id="search" method="GET" action="index.php">
<input type="hidden" name="module" value="interventionList">
<input type="hidden" name="isSearch" value="1">

<table id="interventionSearch" class="tableaffichage">
<tr>
<td>
Activité d'usage : 
<select name="usage_activite_niv2_id">
<option value="" {if $dataSearch.usage_activite_niv2_id == ""}selected{/if}>
{section name=lst loop=$usage_activite_niv2}
<option value="{$usage_activite_niv2[lst].usage_activite_niv2_id}" {if $dataSearch.usage_activite_niv2_id == $usage_activite_niv2[lst].usage_activite_niv2_id}selected{/if}>
{$usage_activite_niv2[lst].usage_activite_niv1_libelle} - {$usage_activite_niv2[lst].usage_activite_niv2_libelle}
</option>
{/section}
</select>
<br>
Position dans l'usage :
 <select name="position_usage_activite_id">
<option value="" {if $dataSearch.position_usage_activite_id == ""}selected{/if}>
{section name=lst loop=$position_usage_activite}
<option value="{$position_usage_activite[lst].position_usage_activite_id}" {if $dataSearch.position_usage_activite_id == $position_usage_activite[lst].position_usage_activite_id}selected{/if}>
{$position_usage_activite[lst].position_usage_activite_libelle}
</option>
{/section}
</select>


Rôle : 
<select name="role_id">
<option value="" {if $dataSearch.role_id == ""}selected{/if}>
{section name=lst loop=$role}
<option value="{$role[lst].role_id}" {if $dataSearch.role_id == $role[lst].role_id}selected{/if}>
{$role[lst].role_libelle}
</option>
{/section}
</select>


<input class="submit" type="submit" name="Rechercher..." value="Rechercher" autofocus>
</td>
</tr>
</table>
</form>
