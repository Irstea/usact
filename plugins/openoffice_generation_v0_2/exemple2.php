<?php

// R�cup�ration des donn�es depuis une BD par exemple
$datasR1 = array(
	array(
		'ingredient'	=> 'Sucre',
		'qte'			=> 150,
		'unite'			=> 'g'
	),
	array(
		'ingredient'	=> 'Farine',
		'qte'			=> 50,
		'unite'			=> 'g'
	),
	array(
		'ingredient'	=> 'Beurre',
		'qte'			=> 50,
		'unite'			=> 'g'
	),
	array(
		'ingredient'	=> 'Orange',
		'qte'			=> 2,
		'unite'			=> 'pi�ces'
	),
	array(
		'ingredient'	=> 'Sel',
		'qte'			=> 1,
		'unite'			=> 'pinc�e'
	),
);
$datasR2 = array(
	array(
		'ingredient'	=> 'Poulet',
		'qte'			=> 1,
		'unite'			=> 'kg'
	),
	array(
		'ingredient'	=> 'Curry',
		'qte'			=> 25,
		'unite'			=> 'g'
	),
	array(
		'ingredient'	=> 'Champignons',
		'qte'			=> 50,
		'unite'			=> 'g'
	),
	array(
		'ingredient'	=> 'Carottes d\'Espagne',
		'qte'			=> '4 ou 5',
		'unite'			=> 'pi�ces'
	),
	array(
		'ingredient'	=> 'Choux',
		'qte'			=> 150,
		'unite'			=> 'g'
	),
);
$datas = array(
	array('recette' => 'G�teau', 'ingr' => $datasR1),
	array('recette' => 'Poulet saut�', 'ingr' => $datasR2)
);


// Chargement de la classe principale
require_once ('calc/classes/OpenOfficeSpreadsheet.class.php');

// Cr�ation du fichier OpenOffice Spreadsheet
$calc = new OpenOfficeSpreadsheet('recettes.ods');

// Cr�ation de la feuille
$sheet = $calc->addSheet('Janvier 2006');

$colBase = 2;
$rowBase = 2;

$col = $colBase;
$row = $rowBase;
// Cellule du titre Ingr�dients
$ingredient = $sheet->getCell($col, $row);
$ingredient->setContent('Ingr�dients');
$ingredient->setWidth('5cm');
$ingredient->setHeight('1cm');
$ingredient->setVerticalAlign('middle');
$ingredient->setTextAlign('center');

// Cellule du titre Quantit�
$qte = $sheet->getCell($col + 1, $row);
$qte->setContent('Quantit�');
$qte->setWidth('2cm');
$qte->setVerticalAlign('middle');
$qte->setTextAlign('center');

// Cellule du titre Unit�
$unite = $sheet->getCell($col + 2, $row);
$unite->setContent('Unit�');
$unite->setWidth('2cm');
$unite->setVerticalAlign('middle');
$unite->setTextAlign('center');

// Styles appliqu�s aux trois cellules ci-dessus
$sheet->setCellBackgroundColor('#FFFFDD', $ingredient, $unite);
$sheet->setCellBorder('0.002cm solid #555555', $ingredient, $unite);
$sheet->setCellColor('#999933', $ingredient, $unite);
$sheet->setCellFontWeight('bold', $ingredient, $unite);

$row++;
// On parcours toutes les recettes
foreach ($datas as $data){
	$cell = $sheet->getCell($col, $row);
	$cell->setBorderRight('0.002cm solid #555555');
	$cell->setContent($data['recette']);
	$cell->setBackgroundColor('#FFEEEE');
	$cell->setHeight('0.6cm');
	$cell->setBorder('0.02cm solid #555555');
	$cell->setVerticalAlign('middle');
	$cell->setTextAlign('center');
	$cell->setFontWeight('bold');
	$cell->setSpannedCols(3);
	$row++;
	foreach ($data['ingr'] as $ingr) {
		$cell_i = $sheet->getCell($col, $row);
		$cell_i->setContent($ingr['ingredient']);
		$cell_i->setBorder('', '0.002cm solid #555555');
		$cell_q = $sheet->getCell($col + 1, $row);
		$cell_q->setBorder('', '0.002cm solid #555555');
		$cell_q->setContent($ingr['qte']);
		$cell_q->setTextAlign('end');
		$cell_u = $sheet->getCell($col + 2, $row);
		$cell_u->setContent($ingr['unite']);
		$cell_u->setTextAlign('start');
		$cell_u->setBorder('', '0.002cm solid #555555');
		$row++;
	}
}

// $cell_u correspond maintenant � la derni�re cellule en bas � droite
if (isset($cell_u)) {
	$sheet->setCellBorderAround('0.02cm solid #555555', $ingredient, $cell_u);
}


// On ajoute une autre feuille pour le fun
$sheet2 = $calc->addSheet('Dr�le');
$cell1 = $sheet2->getCell(2, 3);
$cell2 = $sheet2->getCell(15, 10);
$sheet2->setCellContent('salut', $cell1, $cell2);

$choix =  2;
switch ($choix) {
	case 1:
		echo $calc->saveXML('content');
		break;
	case 2:
		$calc->save();
		break;
	case 3:
		$calc->output();
		break;
	default:
		$calc->save();
}

?>