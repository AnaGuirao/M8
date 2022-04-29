<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Crear personaje</title>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<script type="text/javascript" src="javascript/crear_carta.js"></script>
</head>
<body>
	<header>
		<nav>
			<ul class="breadcrumb">
		  		<li><a href="index.jsp">Inicio</a></li>
		  		<li>></li>
		  		<li style="font-weight: bold;">Generar carta</li>
			</ul> 
		</nav>
	</header>
<%!
	int[] dados = {0,0,0,0};
	String razas[] = {"Elfo","Enano","Mediano","Gnomo","SemiOrco","Humano"};
	String caracteristicas[] = {"Fue","Des","Con","Int","Sab","Car"};
	
	public int obtenerNum(int caras) {
		return (int)(Math.random()*caras);
	}
	
	public int generarDados(int veces, int caras) {
		for(int i = 0; i < veces; i++) {
			dados[i] = obtenerNum(caras)+1;
		}
		if (caras == 6) {
			java.util.Arrays.sort(dados);
		}
		int suma = 0;
		for (int i = 1; i < 4; i++){
			suma = suma + dados[i];
		}
		return suma;
	}
%>
<div class="body" style="padding-bottom:10px;">
<h1 id="titulo_crear_personaje">Crear personaje</h1>
<form action="generar_carta.jsp" method="post">
	<h2>Valores para asignar</h2>
	<p class="linea_blanca">Nombre de la carta</p>
	<input type="text" style="width:200px;" id="nombre_carta" name="nombre_carta" required minlength="3" maxlength="30" size="10">
	<span id="mensaje_nombre" style="padding-left:10px; color:red;"></span>
	<p class="linea_blanca">Seleccionar raza</p>
	<select id="razas" class="razas" name="razas">
		<%	for (int x = 0; x <= razas.length; x++) { 
				if(x==0) {%>
				<option value="0" id="raza_default">---</option>
			<%} else { %>
			    <option value="<%=razas[x-1]%>"><%=razas[x-1]%></option>
			<%}
			} %>
	</select>
	<span id="mensaje_raza" style="padding-left:10px; color:red;"></span>
	<p class="linea_blanca">Seleccionar stats</p>
	<%	
		int dados_stats[] = {0,0,0,0,0,0};
		for (int i = 0; i < 6; i++) {
			dados_stats[i] = generarDados(4,6);
		}
		for (int i = 0; i < 6; i++) {
	%>
		<div style="margin-bottom: 5px; padding-left: 5px; display: inline">
			<span><%=caracteristicas[i]%>: </span>
			<select id="stats<%=i%>" class="stats<%=i%>" name="stats<%=i%>">
			<%	for (int x = 0; x <= dados_stats.length; x++) { 
					if(x==0) {%>
					<option value="0" id="stats_default<%=i%>">---</option>
					<%} else { %>
			    <option id="<%out.print("dado"+x);%>" value="<%=dados_stats[x-1]%>"><%=dados_stats[x-1]%></option>
			<%}} %>
			</select>
		</div>
	<%} %>
	<span id="mensaje_stats" style="color:red"></span>
	<button type="button" id="reset" style="float:right; margin-right:20px;">Resetear</button>
	<button type="button" id="confirmar" name="confirmar" style="float:right; margin-right:20px;">Añadir</button>
</form>
</div>
<div class="body">
	<h2>Vista prévia de la carta</h2>
	<table style="background-color:white; padding:10px;">
		<caption id="tipo_carta"></caption>
		<tr>
			<th rowspan="9"><img id="img_pj" src="img/1.png" style="height:325px; margin-right:15px;"/></th>
	        <th>Carac.</th>
	        <th>Valor Base</th>
	        <th>Mod.</th>
	        <th>Valor Final</th>
	    </tr>
	    <tr>
	        <td>FUE:</td>
	        <td id="stat_fue">0</td>
	        <td id="mod_0">0</td>
	        <td id="vf_fue">0</td>
	     </tr>
	     <tr>
	        <td>DES:</td>
	        <td id="stat_des">0</td>
	        <td id="mod_1">0</td>
	        <td id="vf_des">0</td>
	     </tr>
	    <tr>
	        <td>CON:</td>
	        <td id="stat_con">0</td>
	        <td id="mod_2">0</td>
	        <td id="vf_con">0</td>
	    </tr>
	    <tr>
	        <td>INT:</td>
	        <td id="stat_int">0</td>
	        <td id="mod_3">0</td>
	        <td id="vf_int">0</td>
	    </tr>
	    <tr>
	        <td>SAB:</td>
	        <td id="stat_sab">0</td>
	        <td id="mod_4">0</td>
	        <td id="vf_sab">0</td>
	    </tr>
	    <tr>
	        <td>CAR:</td>
	        <td id="stat_car">0</td>
	        <td id="mod_5">0</td>
	        <td id="vf_car">0</td>
	    </tr>
	    <tr>
	        <td id="pv">P.V (0)</td>
	        <td colspan="3"><progress id="barra_vida" style="width:400px" max="100" value="0"></progress></td>
	    </tr>
	    <tr>
	        <td id="pm">P.M (0)</td>
	        <td colspan="3"><progress id="barra_mana" style="width:400px" max="100" value="0"></progress></td>
	    </tr>
	 </table>
</div>
<form action="index.jsp" id="form_enviar_datos" class="body">
	<input id="ih_nombre" name="ih_nombre" type="hidden" value="">
	<input id="ih_raza" name="ih_raza" type="hidden" value="">
	<input id="ih_img" name="ih_img" type="hidden" value="">
	<input id="ih_fue" name="ih_fue" type="hidden" value="">
	<input id="ih_des" name="ih_des" type="hidden" value="">
	<input id="ih_con" name="ih_con" type="hidden" value="">
	<input id="ih_int" name="ih_int" type="hidden" value="">
	<input id="ih_sab" name="ih_sab" type="hidden" value="">
	<input id="ih_car" name="ih_car" type="hidden" value="">
	<input id="ih_pv" name="ih_pv" type="hidden" value="">
	<input id="ih_pm" name="ih_pm" type="hidden" value="">
	<input type="submit" value="Crear carta" id="btn_enviar_datos" name="btn_enviar_datos" disabled="true" />
</form>
</body>
</html>