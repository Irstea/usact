<?php /* Smarty version Smarty-3.1.13, created on 2015-04-30 13:33:39
         compiled from "display\templates\conflit\conflitSearch.tpl" */ ?>
<?php /*%%SmartyHeaderCode:17420553f3d512d0c65-13427795%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'bb89e163987e658f3210903cb9c0ae27f4b5dee0' => 
    array (
      0 => 'display\\templates\\conflit\\conflitSearch.tpl',
      1 => 1430393615,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17420553f3d512d0c65-13427795',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_553f3d51317164_69913927',
  'variables' => 
  array (
    'conflitSearch' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553f3d51317164_69913927')) {function content_553f3d51317164_69913927($_smarty_tpl) {?><table id="conflitSearch" class="tableaffichage">
<form method="GET" action="index.php">
<input type="hidden" name="module" value="conflitListe">
<input type="hidden" name="isSearch" value="1">
<tr>
<td>
ID à rechercher :
<input name="searchId" value="<?php echo $_smarty_tpl->tpl_vars['conflitSearch']->value['searchId'];?>
" maxlength="50" size="30" autofocus>
<br>
<br>
<div style="text-align:center;">
<input type="submit" name="Rechercher...">
</div>
</td>
</tr>
</form>
</table>
<?php }} ?>