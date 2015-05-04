<?php /* Smarty version Smarty-3.1.13, created on 2015-04-20 16:46:54
         compiled from "display\templates\enpied.tpl" */ ?>
<?php /*%%SmartyHeaderCode:264955535115e043a37-28356867%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '634245dd7f34afd0e6211b24d318173c11338226' => 
    array (
      0 => 'display\\templates\\enpied.tpl',
      1 => 1429539974,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '264955535115e043a37-28356867',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'LANG' => 0,
    'melappli' => 0,
    'developpementMode' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_5535115e095ad3_93298476',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5535115e095ad3_93298476')) {function content_5535115e095ad3_93298476($_smarty_tpl) {?><div id="footer">
<?php echo $_smarty_tpl->tpl_vars['LANG']->value['message'][23];?>

<br>
<?php echo $_smarty_tpl->tpl_vars['LANG']->value['message'][25];?>

<a href="mailto:<?php echo $_smarty_tpl->tpl_vars['melappli']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['melappli']->value;?>
</a>
<?php if (strlen($_smarty_tpl->tpl_vars['developpementMode']->value)>1){?>
<br>
<div class="red"><?php echo $_smarty_tpl->tpl_vars['developpementMode']->value;?>
</div>
<?php }?>
</div>
<?php }} ?>