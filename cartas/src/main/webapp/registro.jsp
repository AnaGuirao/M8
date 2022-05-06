<?xml version="1.0" encoding="UTF-8" ?>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Registro</title>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
	</head>
	<body>
		<header>
			<p id="nombre">Ana Guirao López</p>
			<a id="login" href="login.jsp"><p>Login</p></a>
		</header>
		<div class="body">
			<h1>Login</h1>
			<form action="index.jsp" id="form_registro">
			  <label for="registro_nombre">Nombre:</label><br>
			  <input type="text" id="registro_nombre" name="registro_nombre"><br>
			  <label for="registro_contra">Contraseña:</label><br>
			  <input type="password" id="registro_contra" name="registro_contra"><br>
			  <label><input type="checkbox" id="captcha_humano" name="captcha_humano" value="captcha_humano">Marca si eres humano</label>
			  <label><input type="checkbox" id="captcha_robot" name="captcha_robot" value="captcha_robot">Marca si eres un robot</label><br>
			  <input type="submit" id="registro_enviar" name="registro_enviar" value="Entrar">
			</form> 
		</div>
	</body>
</html>