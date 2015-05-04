<?php /* Smarty version Smarty-3.1.13, created on 2015-04-20 16:47:03
         compiled from "display\templates\ident\login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:4367553511670c4b25-73759605%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '142ebf5daf494ec812547ee57e01dad7d8c76186' => 
    array (
      0 => 'display\\templates\\ident\\login.tpl',
      1 => 1429539974,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '4367553511670c4b25-73759605',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'module' => 0,
    'LANG' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_55351167112d48_20817551',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_55351167112d48_20817551')) {function content_55351167112d48_20817551($_smarty_tpl) {?>	<form method="POST" action="index.php">
	<table class="tablesaisie">
	<tr>
	<input type="hidden" name="module" value=<?php echo $_smarty_tpl->tpl_vars['module']->value;?>
>
	<td><?php echo $_smarty_tpl->tpl_vars['LANG']->value['login'][0];?>
 :</td><td> <input name="login" maxlength="32" required autofocus></td>
	</tr>
	<tr><td>
	<?php echo $_smarty_tpl->tpl_vars['LANG']->value['login'][1];?>
 :</td><td><input name="password" type="password" required maxlength="32"></td>
	</tr>
	<tr>
	<td><input type="submit"></td><td> <input type="reset"></td>
	</tr>
	</table>
<?php }} ?>