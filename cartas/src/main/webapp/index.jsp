<?xml version="1.0" encoding="UTF-8" ?>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Cartas</title>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
	</head>
	<body>
		<header>
			<p id="nombre">Ana Guirao López</p>
			<a id="registro" href="registro.jsp"><p>Registro</p></a>
		</header>
		<div class="body" id="div_titulo_juego">
			<img src="img/logo.png"/>
		</div>
		<div class="body">
			<h1>Menú</h1>
			<div id="enlaces">
				<div id="enlace_generar_carta">
					<a href="generar_carta.jsp"><p>Generar carta</p></a>
				</div>
				<div id="enlace_ver_cartas">
					<a href="ver_cartas.jsp?pagina=0"><p>Ver cartas</p></a>
				</div>
			</div>
		</div>
		<% if(request.getParameter("btn_enviar_datos") != null) { %>
			<div id="div_datos_enviados">
				<%@include file="insert_bd.jsp"%>
			</div>
		<% }
		else if(request.getParameter("registro_enviar") != null && request.getParameterValues("captcha_humano") != null && request.getParameterValues("captcha_robot") == null) {%>
			<div id="div_datos_enviados">
				<%@include file="registro_bd.jsp"%>
			</div>
		<% }
		else if(request.getParameter("registro_enviar") != null && request.getParameterValues("captcha_humano") == null) {%>
			<div id="div_datos_no_enviados">
				<p>No has seleccionado que eres un humano</p>
			</div>
		<% }; %>
	</body>
</html>