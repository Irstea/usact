<?php /* Smarty version Smarty-3.1.13, created on 2015-04-29 10:54:51
         compiled from "display\templates\conflit\conflitDisplay.tpl" */ ?>
<?php /*%%SmartyHeaderCode:5487553f71aa294763-02438770%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fce4335a51ea9fa0090234e939c82fae512d5411' => 
    array (
      0 => 'display\\templates\\conflit\\conflitDisplay.tpl',
      1 => 1430297647,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5487553f71aa294763-02438770',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_553f71aa488762_68756360',
  'variables' => 
  array (
    'data' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553f71aa488762_68756360')) {function content_553f71aa488762_68756360($_smarty_tpl) {?><a href="index.php?module=conflitListe">Retour à la liste </a>
<a href="index.php?module=conflitChange&id=<?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_id'];?>
" style="padding-left:4em;">Modifier...</a>
<table class="tableaffichage">
<tr>
<td class="libelleSaisie"> ID du conflit :</td>
<td><?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_id'];?>
</td>
</tr>
<tr>
<tr>
<td class="libelleSaisie"> Nom :</td>
<td><?php echo $_smarty_tpl->tpl_vars['data']->value['personne_saisie_conflit_nom'];?>
</td>
</tr>
<tr>
<td class="libelleSaisie"> Prénom :</td>
<td><?php echo $_smarty_tpl->tpl_vars['data']->value['personne_saisie_conflit_prenom'];?>
</td>
</tr>
<tr>
<td class="libelleSaisie"> Date de début :</td>
<td><?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_date_debut'];?>
</td>
</tr>
<tr>
<td class="libelleSaisie"> Date de fin :</td>
<td><?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_date_fin'];?>
</td>
</tr>
<tr>
<td class="libelleSaisie"> Date de saisie :</td>
<td><?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_date_saisie'];?>
</td>
</tr>
<tr>
<td class="libelleSaisie"> Détail sur le conflit :</td>
<td><?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_detail'];?>
</td>
</tr>
</table>
<?php }} ?>