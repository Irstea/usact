<div class="formSaisie">
<div>
<form method="post" action="index.php">
<input type="hidden" name="id" value="{$data.id}">
	<input type="hidden" name="module" value="loginwrite">
	<input type="hidden" name="password" value="{$data.password}">

	<dl>
		<dt>{$LANG.login.0} </dt>
		<dd><input id="login" name="login" value="{$data.login}" autofocus></dd>
	</dl>
	<dl>
		<dt>{$LANG.login.9} </dt>
		<dd><input id="nom" name="nom" value="{$data.nom}"></dd>
	</dl>
	<dl>
		<dt>{$LANG.login.10} </dt>
		<dd><input id="prenom" name="prenom" value="{$data.prenom}"></dd>
	</dl>
	<dl>
		<dt>{$LANG.login.8} </dt>
		<dd><input id="mail" name="mail" value="{$data.mail}"></dd>
	</dl>
		<dl>
		<dt>{$LANG.login.11} </dt>
		<dd><input id="datemodif" name="datemodif" value="{$data.datemodif}" readonly></dd>
	</dl>
	
	<dl>
		<dt>{$LANG.login.1} </dt>
		<dd><input type="password" autocomplete="off" id="pass1" name="pass1" onchange="verifieMdp(this.form.pass1, this.form.pass2)"></dd>
	</dl>
	<dl>
		<dt>{$LANG.login.12} </dt>
		<dd><input type="password" id="pass2" autocomplete="off" name="pass2" onchange="verifieMdp(this.form.pass1, this.form.pass2)"></dd>
	</dl>
	<dl>
	<dt>{$LANG.login.21} </dt>
	<dd><input type="button" name="generate" value="{$LANG.login.22}" onclick="getPassword('pass1', 'pass2', 'motdepasse')">
	<br>
	<input name="motdepasse" id="motdepasse" size="20">
	</dd>
	</dl>
	<dl>
		<dt>{$LANG.login.13} </dt>
		<dd><input type="radio" name="actif" value="1" {if $data.actif == 1}checked{/if}>{$LANG.message.yes}<br>
		<input type="radio" name="actif" value="0" {if $data.actif == 0}checked{/if}>{$LANG.message.no}
		</dd>
	</dl>
	<dl></dl>
	
	<div class="formBouton">
<input type="submit" name="valid" value="{$LANG.message.19}"/>
</div>
</form>
</div>

{if $data.id>0}
<form action="index.php" method="post" onSubmit='return confirmSuppression()'>
<input type="hidden" name="id" value="{$data.id}">
<input type="hidden" name="module" value="logindelete">
<div class="formBouton">
<input type="submit" value="Supprimer">
</div>
</form>
{/if}
 </div>

