<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RPG Generador de cartas</title>
 <link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
<%// variables per fer la connexio:
	String user="tomcat";
	String password="thos";
	String host="localhost";
	String db = "cartas";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;	
	
	// recollim valors formulari:
	String nombre=request.getParameter("registro_nombre");
	String contra=request.getParameter("registro_contra");
	
	try{
	
		Class.forName("com.mysql.jdbc.Driver").newInstance ();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
		int i=statement.executeUpdate("insert into Usuarios(nombre,contra)values('"+nombre+"','"+contra+"')");
		session.setAttribute("usuario", nombre);
		out.print("Usuario creado correctamente");
	}catch(SQLException error) {
		out.print("Error de Conexión : "+error.toString());
	} %>