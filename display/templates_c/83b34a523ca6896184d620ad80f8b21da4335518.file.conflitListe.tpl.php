<?php /* Smarty version Smarty-3.1.13, created on 2015-05-04 15:17:00
         compiled from "display\templates\conflit\conflitListe.tpl" */ ?>
<?php /*%%SmartyHeaderCode:16455553f3cf0ab1f62-99568596%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '83b34a523ca6896184d620ad80f8b21da4335518' => 
    array (
      0 => 'display\\templates\\conflit\\conflitListe.tpl',
      1 => 1430745362,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16455553f3cf0ab1f62-99568596',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_553f3cf0dbb4e1_93351501',
  'variables' => 
  array (
    'LANG' => 0,
    'isSearch' => 0,
    'data' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_553f3cf0dbb4e1_93351501')) {function content_553f3cf0dbb4e1_93351501($_smarty_tpl) {?><script>
	setDataTables("idListe");
</script>
<h2><?php echo $_smarty_tpl->tpl_vars['LANG']->value['gestion'][0];?>
</h2>
<a href="index.php?module=conflitChange&id=0"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['gestion'][7];?>
</a>
<?php echo $_smarty_tpl->getSubTemplate ("conflit/conflitSearch.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
 
<?php if ($_smarty_tpl->tpl_vars['isSearch']->value==1){?>
<form method="get" action="index.php">
	<input type="hidden" name="module" value="conflitPdf"> <input
		type="submit" value="Imprimer la liste au format PDF">
</form>
<table id="idListe" class="tableaffichage">
	<thead>
		<tr>
			<th>ID du conflit</th>
			<th>Nom - Prénom</th>
			<th>Date de début</th>
			<th>Date de fin</th>
			<th>Date de saisie</th>
			<th>Détail sur le conflit</th>
		</tr>
	</thead>
	<tdata> <?php if (isset($_smarty_tpl->tpl_vars['smarty']->value['section']['lst'])) unset($_smarty_tpl->tpl_vars['smarty']->value['section']['lst']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['name'] = 'lst';
$_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['loop'] = is_array($_loop=$_smarty_tpl->tpl_vars['data']->value) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['show'] = true;
$_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['max'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['loop'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['step'] = 1;
$_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['start'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['step'] > 0 ? 0 : $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['loop']-1;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['show']) {
    $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['total'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['loop'];
    if ($_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['total'] == 0)
        $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['show'] = false;
} else
    $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['total'] = 0;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['show']):

            for ($_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['index'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['start'], $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['iteration'] = 1;
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['iteration'] <= $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['total'];
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['index'] += $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['step'], $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['iteration']++):
$_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['rownum'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['iteration'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['index_prev'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['index'] - $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['index_next'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['index'] + $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['first']      = ($_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['iteration'] == 1);
$_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['last']       = ($_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['iteration'] == $_smarty_tpl->tpl_vars['smarty']->value['section']['lst']['total']);
?>
	<tr>
		<td style="text-align: center;"><a href="index.php?module=conflitDisplay&id=<?php echo $_smarty_tpl->tpl_vars['data']->value[$_smarty_tpl->getVariable('smarty')->value['section']['lst']['index']]['conflit_id'];?>
">
										<?php echo $_smarty_tpl->tpl_vars['data']->value[$_smarty_tpl->getVariable('smarty')->value['section']['lst']['index']]['conflit_id'];?>
</a></td>
		<td style="text-align: center;" autofocus><?php echo $_smarty_tpl->tpl_vars['data']->value[$_smarty_tpl->getVariable('smarty')->value['section']['lst']['index']]['personne_saisie_conflit_nom'];?>
 
										<?php echo $_smarty_tpl->tpl_vars['data']->value[$_smarty_tpl->getVariable('smarty')->value['section']['lst']['index']]['personne_saisie_conflit_prenom'];?>
</td>
		<td style="text-align: center;"><?php echo $_smarty_tpl->tpl_vars['data']->value[$_smarty_tpl->getVariable('smarty')->value['section']['lst']['index']]['conflit_date_debut'];?>
</td>
		<td style="text-align: center;"><?php echo $_smarty_tpl->tpl_vars['data']->value[$_smarty_tpl->getVariable('smarty')->value['section']['lst']['index']]['conflit_date_fin'];?>
</td>
		<td style="text-align: center;"><?php echo $_smarty_tpl->tpl_vars['data']->value[$_smarty_tpl->getVariable('smarty')->value['section']['lst']['index']]['conflit_date_saisie'];?>
</td>
		<td style="text-align: center;"><?php echo $_smarty_tpl->tpl_vars['data']->value[$_smarty_tpl->getVariable('smarty')->value['section']['lst']['index']]['conflit_detail'];?>
</td>
	</tr>
	<?php endfor; endif; ?> </tdata>	
	
	<a href="index.php?module=conflitChange">Nouveau Conflit</a>
</table>
<?php }?>
<?php }} ?>