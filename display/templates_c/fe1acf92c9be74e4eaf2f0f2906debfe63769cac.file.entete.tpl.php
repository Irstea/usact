<?php /* Smarty version Smarty-3.1.13, created on 2015-05-06 13:35:14
         compiled from "display\templates\entete.tpl" */ ?>
<?php /*%%SmartyHeaderCode:160895535115dee99f6-19668837%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fe1acf92c9be74e4eaf2f0f2906debfe63769cac' => 
    array (
      0 => 'display\\templates\\entete.tpl',
      1 => 1430911894,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '160895535115dee99f6-19668837',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_5535115e024627_15298724',
  'variables' => 
  array (
    'LANG' => 0,
    'ident_type' => 0,
    'isConnected' => 0,
    'menu' => 0,
    'message' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5535115e024627_15298724')) {function content_5535115e024627_15298724($_smarty_tpl) {?><h1><img src="display/images/tux-lamp.jpg" width="40"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['message'][1];?>

<div class="header_right">
<a href='index.php?module=setlanguage&langue=fr'>
<img src='display/images/drapeau_francais.png' height='20' border='0'>
</a>
<a href='index.php?module=setlanguage&langue=en'>
<img src='display/images/drapeau_anglais.png' height='20' border='0'>
</a>
&nbsp;
<?php if ($_smarty_tpl->tpl_vars['ident_type']->value=="BDD"||$_smarty_tpl->tpl_vars['ident_type']->value=="LDAP-BDD"){?>
<a href='index.php?module=loginChangePassword'>
<img src='display/images/key.png' height='20' border='0'>
</a>
&nbsp;
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['isConnected']->value==1){?>
<img src='display/images/key_green.png' height='20' border='0' title="<?php echo $_smarty_tpl->tpl_vars['LANG']->value['message'][33];?>
">
<?php }else{ ?>
<img src='display/images/key_red.png' height='20' border='0' title="<?php echo $_smarty_tpl->tpl_vars['LANG']->value['message'][8];?>
">
<?php }?>
</div>
</h1>
<div class="menu"><?php echo $_smarty_tpl->tpl_vars['menu']->value;?>
</div>
<div class="titre2"><?php echo $_smarty_tpl->tpl_vars['message']->value;?>
</div><?php }} ?>