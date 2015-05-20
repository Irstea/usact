 <table id="bienSupportNiv2Search" class="tableaffichage">
<form method="GET" action="index.php">
<input type="hidden" name="module" value="bienSupportNiv2Liste">
<input type="hidden" name="isSearch" value="1">
<dl>
<dt>Libellé rechercher :</dt>
<dd>
<input class="text10" id="recherche" autocomplete="off" autofocus placeholder="espèce à chercher" title="Tapez au moins 3 caractères...">
<select name="bien_support_niv2_id" id="bien_support_niv2_id">
{if $data.bien_support_niv2_id > 0}
<option value="{$data.bien_support_niv2_id}" selected>{$data.bien_support_libelle}</option>
{/if}
</select>
</dd>
</dl>

</form>
</table>