<?php /* Smarty version Smarty-3.1.13, created on 2015-04-29 16:26:31
         compiled from "display\templates\conflit\conflitChangePersonne.tpl" */ ?>
<?php /*%%SmartyHeaderCode:316255540e959838fd1-99178853%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f25db95e8cebdf0994ca25bb72b097ff0e659be1' => 
    array (
      0 => 'display\\templates\\conflit\\conflitChangePersonne.tpl',
      1 => 1430317588,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '316255540e959838fd1-99178853',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_5540e959863f62_11637953',
  'variables' => 
  array (
    'data' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5540e959863f62_11637953')) {function content_5540e959863f62_11637953($_smarty_tpl) {?><form method="post" action="index.php" onSubmit='return validerForm("nom:le nom est obligatoire,prenom:le prénom est obligatoire")'>
<input type="hidden" name="action" value="M">
<input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['personne_saisie_conflit_id'];?>
">
<input type="hidden" name="module" value="conflitWrite">
<table class="tablesaisie">
<tr>
<td>Nom<span class="red">*</span> :</td>
<td><input name="personne_saisie_conflit_nom" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['personne_saisie_conflit_nom'];?>
"></td>
</tr>
<tr>
<td>Prénom<span class="red">*</span> :</td>
<td><input name="personne_saisie_conflit_prenom" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['personne_saisie_conflit_prenom'];?>
"></td>
</tr>
</table><?php }} ?>