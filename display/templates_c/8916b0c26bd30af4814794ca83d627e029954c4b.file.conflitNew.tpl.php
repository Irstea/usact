<?php /* Smarty version Smarty-3.1.13, created on 2015-05-04 09:45:12
         compiled from "display\templates\conflit\conflitNew.tpl" */ ?>
<?php /*%%SmartyHeaderCode:52955541dd3939a797-87944785%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8916b0c26bd30af4814794ca83d627e029954c4b' => 
    array (
      0 => 'display\\templates\\conflit\\conflitNew.tpl',
      1 => 1430725473,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '52955541dd3939a797-87944785',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_5541dd3942b043_48705216',
  'variables' => 
  array (
    'data' => 0,
    'LANG' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5541dd3942b043_48705216')) {function content_5541dd3942b043_48705216($_smarty_tpl) {?><h2>Déclaration d'un conflit</h2>
<a href="index.php?module=conflitListe">Retour à la liste</a>
<form method="post" action="index.php" onSubmit='return validerForm("nom:le nom est obligatoire,prenom:le prénom est obligatoire")'>
<input type="hidden" name="action" value="M">
<input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_id'];?>
">
<input type="hidden" name="module" value="conflitWrite">
<table class="tablesaisie">

<tr>
<td>ID du conflit <span class="red">*</span> :</td>
<td><input name="conflit_id" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_id'];?>
" autofocus></td>
</tr>
<tr>
<td>Nom<span class="red">*</span> :</td>
<td><input name="personne_saisie_conflit_nom" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['personne_saisie_conflit_nom'];?>
" autofocus></td>
</tr>
<tr>
<td>Prénom<span class="red">*</span> :</td>
<td><input name="personne_saisie_conflit_prenom" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['personne_saisie_conflit_prenom'];?>
"></td>
</tr>
<tr>
<td>Date de début :</td>
<td><input name="conflit_date_debut" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_date_debut'];?>
"></td>
</tr>
<tr>
<td>Date de fin :</td>
<td><input name="conflit_date_fin" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_date_fin'];?>
"></td>
</tr>
<tr>
<td>Date de saisie <span class="red">*</span> :</td>
<td><input name="conflit_date_saisie" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_date_saisie'];?>
"></td>
</tr>
<tr>
<td>Détail sur le conflit :</td>
<td><input name="conflit_detail" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_detail'];?>
"></td>
</tr>
<tr>
<td colspan=2>
<div style="text-align:center;">
<input type="submit" name="valid" value="<?php echo $_smarty_tpl->tpl_vars['LANG']->value['message'][19];?>
"/>
</form>
</div>
</td>
</tr>
</table>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span><?php }} ?>