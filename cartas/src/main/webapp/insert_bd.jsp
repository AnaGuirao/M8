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
	String nom=request.getParameter("ih_nombre");
	String race=request.getParameter("ih_raza");
	String picture=request.getParameter("ih_img");
	String fue=request.getParameter("ih_fue");
	int nfue=Integer.parseInt(fue);
	String des=request.getParameter("ih_des");
	int ndes=Integer.parseInt(des);
	String con=request.getParameter("ih_con");
	int ncon=Integer.parseInt(con);
	String intt=request.getParameter("ih_int");
	int nint=Integer.parseInt(intt);
	String sab=request.getParameter("ih_sab");
	int nsab=Integer.parseInt(sab);
	String car=request.getParameter("ih_car");
	int ncar=Integer.parseInt(car);
	String pv=request.getParameter("ih_pv");
	int npv=Integer.parseInt(pv);
	String pm=request.getParameter("ih_pm");
	int npm=Integer.parseInt(pm);

try{

	Class.forName("com.mysql.jdbc.Driver").newInstance ();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
int i=statement.executeUpdate("insert into Carta(NOM_carta,PIC_carta,RACE_carta,FUE_carta,DES_carta,CON_carta,INT_carta,SAB_carta,CAR_carta,PV_carta,PM_carta)values('"+nom+"','"+picture+"','"+race+"',"+nfue+","+ndes+","+ncon+","+nint+","+sab+","+car+","+pv+","+pm+")");
out.println("Data is successfully inserted!");
}catch(SQLException error) {
out.print("Error de Conexión : "+error.toString());
} %>
