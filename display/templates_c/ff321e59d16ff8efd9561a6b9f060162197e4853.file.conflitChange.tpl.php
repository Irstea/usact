<?php /* Smarty version Smarty-3.1.13, created on 2015-05-04 15:52:48
         compiled from "display\templates\conflit\conflitChange.tpl" */ ?>
<?php /*%%SmartyHeaderCode:15117553f9867a50dd5-66569761%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ff321e59d16ff8efd9561a6b9f060162197e4853' => 
    array (
      0 => 'display\\templates\\conflit\\conflitChange.tpl',
      1 => 1430747201,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15117553f9867a50dd5-66569761',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_553f9867b9cee3_31558359',
  'variables' => 
  array (
    'data' => 0,
    'LANG' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553f9867b9cee3_31558359')) {function content_553f9867b9cee3_31558359($_smarty_tpl) {?><h2>Modification d'un conflit</h2>
<a href="index.php?module=conflitListe">Retour à la liste</a>
<a href="index.php?module=conflitDisplay&id=<?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_id'];?>
" style="padding-left:2em">Retour au détail de la fiche</a>
<form method="post" action="index.php" onSubmit='return validerForm("nom:le nom est obligatoire,prenom:le prénom est obligatoire")'>
<input type="hidden" name="action" value="M">
<input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['conflit_id'];?>
">
<input type="hidden" name="module" value="conflitWrite">
<table class="tablesaisie">
<tr>
<td>Nom<span class="red">*</span> :</td>
<td><input name="arcachon.personne_saisie_conflit.personne_saisie_conflit_nom" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['personne_saisie_conflit_nom'];?>
"autofocus></td>
</tr>
<tr>
<td>Prénom<span class="red">*</span> :</td>
<td><input name="arcachon.personne_saisie_conflit.personne_saisie_conflit_prenom" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['personne_saisie_conflit_prenom'];?>
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
<td>Date de saisie :</td>
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
<form action="index.php" method="post" onSubmit='return confirmSuppression("Confirmez-vous la suppression ?")'>
<input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['id'];?>
">
<input type="hidden" name="module" value="conflitDelete">
<input type="submit" value="Supprimer">
</form>
</div>
</td>
</tr>
</table>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>
<?php }} ?>