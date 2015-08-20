<table id="entretienListe" class="tableListe">
	<thead>
		<tr>
			<th class="center"><img src="display/images/edit.gif" height="20"></th>
			<th>Date</th>
			<th>Institution<br>représentée</th>
			<th>Statut de<br>l'interviewé</th>
			<th>Localisation</th>
			<th>Binôme ayant<br>mené l'entretien</th>
			<th>Pièce jointe associée</th>
		</tr>
	</thead>
	<tbody>
	{section name=lst loop=$entretien}
		<tr>
			<td class="center">
			<a href="index.php?module=entretienDisplay&entretien_id={$entretien[lst].entretien_id}">
			<img src="display/images/edit.gif" height="20">
			{$entretien[lst].entretien_id}
			</a>
			</td>
			<td>{$entretien[lst].entretien_date}</td>
			<td>{$entretien[lst].institution}</td>
			<td>{$entretien[lst].statut}</td>
			<td>{$entretien[lst].localisation}</td>
			<td>{$entretien[lst].binome}</td>
			<td>{$entretien[lst].piece_jointe}</td>
		</tr>
	{/section}
	</tbody>
</table>
<br>