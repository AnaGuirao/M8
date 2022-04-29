<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="US-ASCII">
	<title>Mis cartas</title>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
	<header>
		<nav>
			<ul class="breadcrumb">
		  		<li><a href="index.jsp">Inicio</a></li>
		  		<li>></li>
		  		<li style="font-weight: bold;">Visualizar cartas</li>
			</ul> 
		</nav>
	</header>
	
	<div class="body" style="height: 280px;">
		<h1>Visualizar cartas</h1>
	<%//  variables per fer la connexio:
			String user="tomcat";
			String password="thos";
			String host="localhost";
			String db = "cartas";
			String url = "jdbc:mysql://"+host+"/"+db;
			Connection conn = null;
			Statement statement = null;
			Statement num_registres=null;
			ResultSet rs = null;
			ResultSet num_reg=null;
			int inicio;
			
			//Limito la busqueda
			int TAMANO_PAGINA = 4;
			
			//examino la página a mostrar y el inicio del registro a mostrar
			String pag = request.getParameter("pagina");
			int pagina=Integer.parseInt(pag);
			if (pagina==0) {
			   	inicio = 0;
			    pagina=1;
			}
			else {
			    inicio = (pagina - 1) * TAMANO_PAGINA;
			}
		
		//miro a ver el número total de campos que hay en la tabla con esa búsqueda
		Class.forName("com.mysql.jdbc.Driver").newInstance ();
		conn = DriverManager.getConnection(url, user, password);
		num_registres = conn.createStatement();
		//inmediatamente hacemos una consulta sencilla
		//creamos la consulta
		num_reg = num_registres.executeQuery("SELECT * FROM Carta");
		
		int num_total_registros=0;
		while(num_reg.next()) {
			num_total_registros++;
		}
		
		//calculo el total de páginas
		int total_paginas = (int)Math.ceil(((double)num_total_registros/ TAMANO_PAGINA));
		
		//pongo el número de registros total, el tamaño de página y la página que se muestra
		%>
		<div style="float:left;">
			<h2>Información</h2>
			<p class="linea_blanca">Número de registros encontrados: <%=num_total_registros%></p>
			<p class="linea_blanca">Se mostraran las páginas de <%=TAMANO_PAGINA%> registros de cada una</p>
			<p class="linea_blanca">Mostrando la página <%=pagina%> de <%=total_paginas%></p>
		</div>
	</div>
	<%
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance ();
			conn = DriverManager.getConnection(url, user, password);
			statement = conn.createStatement();
			//inmediatamente hacemos una consulta sencilla
			//creamos la consulta
			String sentence="SELECT * from Carta limit "+inicio+","+TAMANO_PAGINA;
			rs = statement.executeQuery(sentence);
			int contador = 0;
	%>
		<div id="cuerpo_cartas" class="body">
			<h2>Cartas</h2>
			<div id="cartas">
				<% //leemos la consulta
				while(rs.next()) {
				%>
				<div class="carta">
					<div class="body_carta">
						<h3 class="vw_nombre_carta"><%=rs.getString("NOM_carta") %></h3>
						<div class="vw_img">
							<img src="<%out.print(rs.getString("PIC_carta")); %>" height="200" width="100">
						</div>
					</div>
					<div class="body_carta">
						<p class="linea_blanca">Raza: <%=rs.getString("RACE_carta")%></p>
					</div>
					<div class="body_carta">
						<p class="linea_blanca">FUE: <%=rs.getString("FUE_carta")%></p>
						<p class="linea_blanca">DES: <%=rs.getString("DES_carta")%></p>
						<p class="linea_blanca">CON: <%=rs.getString("CON_carta")%></p>
						<p class="linea_blanca">INT: <%=rs.getString("INT_carta")%></p>
						<p class="linea_blanca">SAB: <%=rs.getString("SAB_carta")%></p>
						<p class="linea_blanca">CAR: <%=rs.getString("CAR_carta")%></p>
						<p class="linea_blanca">PV: <%=rs.getString("PV_carta")%></p>
						<progress class="vw_vida" style="width:400px" max="100" value="<%=rs.getString("PV_carta")%>"></progress>
						<p class="linea_blanca">PM: <%=rs.getString("PM_carta")%></p>
						<progress class="vw_mana" style="width:400px" max="100" value="<%=rs.getString("PM_carta")%>"></progress>
					</div>
				</div>
				<% if(contador == 0) { 
					contador = 1;
				   } else {
				%>
				<br>	
				<%	contador = 0;
				   }
				}
				//cerramos la conexión
				rs.close();
				}catch(SQLException error) {
					out.print("Error de Conexión : "+error.toString());
				}  
				%>
			</div>
		</div>
	<div id="paginacion" class="body">
		<%	if (total_paginas > 1){
			    for (int i=1;i<=total_paginas;i++){
			       if (pagina == i)
			          //si muestro el índice de la página actual, no coloco enlace
			          out.print(pagina);
				   else
				      //si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
				      out.print(" <a href=ver_cartas.jsp?pagina="+i+">"+i+"</a> ");
			    }
			}
		%>
	</div>
</body>