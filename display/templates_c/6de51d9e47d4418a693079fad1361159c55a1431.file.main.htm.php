<?php /* Smarty version Smarty-3.1.13, created on 2015-04-20 16:46:53
         compiled from "display\templates\main.htm" */ ?>
<?php /*%%SmartyHeaderCode:112995535115ddd8283-84653811%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6de51d9e47d4418a693079fad1361159c55a1431' => 
    array (
      0 => 'display\\templates\\main.htm',
      1 => 1429539974,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '112995535115ddd8283-84653811',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'LANG' => 0,
    'fds' => 0,
    'idFocus' => 0,
    'entete' => 0,
    'corps' => 0,
    'enpied' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_5535115debea66_86979451',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5535115debea66_86979451')) {function content_5535115debea66_86979451($_smarty_tpl) {?><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $_smarty_tpl->tpl_vars['LANG']->value['message'][1];?>
</title>
<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['fds']->value;?>
" type="text/css">
<link rel="icon" type="image/png" href="favicon.png" />
</head>
<?php if (strlen($_smarty_tpl->tpl_vars['idFocus']->value)){?>
<body onload='document.getElementById("<?php echo $_smarty_tpl->tpl_vars['idFocus']->value;?>
").focus()'>
<?php }else{ ?>
<body>
<?php }?>
<script language="javascript" SRC="display/javascript/fonctions.js"></script>
<div id="superglobal">
<div id="global">
<?php echo $_smarty_tpl->getSubTemplate ("jquery.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ($_smarty_tpl->tpl_vars['entete']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ($_smarty_tpl->tpl_vars['corps']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</div>
<?php echo $_smarty_tpl->getSubTemplate ($_smarty_tpl->tpl_vars['enpied']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</div>
</body>
</html><?php }} ?>