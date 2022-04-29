window.onload = function() {
	
	// Nombre carta
	var nombre_carta = document.getElementById('nombre_carta');
	var titulo_carta = document.getElementById('tipo_carta');
	//Mensajes
	var mensaje_nombre = document.getElementById('mensaje_nombre');
	var mensaje_raza = document.getElementById('mensaje_raza');
	var mensaje_stats = document.getElementById("mensaje_stats");
	// Select raza
 	var select_raza = document.getElementById('razas');
 	// Stats
 	var select_fue = document.getElementById("stats0");
	var select_des = document.getElementById("stats1");
	var select_con = document.getElementById("stats2");
	var select_int = document.getElementById("stats3");
	var select_sab = document.getElementById("stats4");
	var select_car = document.getElementById("stats5");
	// Valores base
 	var vb_fue = document.getElementById('stat_fue');
 	var vb_des = document.getElementById('stat_des');
 	var vb_con = document.getElementById('stat_con');
 	var vb_int = document.getElementById('stat_int');
 	var vb_sab = document.getElementById('stat_sab');
 	var vb_car = document.getElementById('stat_car');
 	// Modificadores
 	var mod_0 = document.getElementById('mod_0');
	var mod_1 = document.getElementById('mod_1');
	var mod_2 = document.getElementById('mod_2');
	var mod_3 = document.getElementById('mod_3');
	var mod_4 = document.getElementById('mod_4');
	var mod_5 = document.getElementById('mod_5'); 
 	// Valores finales
 	var vf_fue = document.getElementById('vf_fue');
 	var vf_des = document.getElementById('vf_des');
 	var vf_con = document.getElementById('vf_con');
 	var vf_int = document.getElementById('vf_int');
 	var vf_sab = document.getElementById('vf_sab');
 	var vf_car = document.getElementById('vf_car');
 	var vf_vida = document.getElementById("pv");
 	var vf_mana = document.getElementById("pm");
 	// Btn enviar
	var btn_enviar_datos = document.getElementById('btn_enviar_datos');
	
	function generar_dado(max) {
		return Math.floor(Math.random() * (max - 1)) + 1;
	}
	
	function comprobar_nombre() {
		var longitud_nombre = (nombre_carta.value).length;
		if(longitud_nombre >= 3 && longitud_nombre <= 10) {
			nombre_carta.style.border = "3px solid green";
			return true;
		}
		mensaje_nombre.innerHTML = "Nombre con el formato incorrecto";
		nombre_carta.style.border = "3px solid red";
		nombre_carta.value = "";
		return false;
	}
	
	function comprobar_raza() {
		if(select_raza.value == 0) {
			mensaje_raza.innerHTML = "Raza no selecionada";
			select_raza.style.border = "3px solid red";
			return false;
		}
		else {
			select_raza.style.border = "3px solid green";
			return true;
		}
	}
 	
 	function generar_mod_y_imagen() {
		if(select_raza.value == "Elfo") {
			mod_0.innerHTML = 0;
			mod_1.innerHTML = 2;
			mod_2.innerHTML = -2;
			mod_3.innerHTML = 2;
			mod_4.innerHTML = 0;
			mod_5.innerHTML = 0;
			document.getElementById("img_pj").src = "img/0.png";
		}
		else if(select_raza.value == "Enano") {
			mod_0.innerHTML = 0;
			mod_1.innerHTML = 0;
			mod_2.innerHTML = 2;
			mod_3.innerHTML = 0;
			mod_4.innerHTML = 2;
			mod_5.innerHTML = -2;
			document.getElementById("img_pj").src = "img/1.png";
		}
		else if(select_raza.value == "Mediano") {
			mod_0.innerHTML = -2;
			mod_1.innerHTML = 2;
			mod_2.innerHTML = 0;
			mod_3.innerHTML = 0;
			mod_4.innerHTML = 0;
			mod_5.innerHTML = 0;
			document.getElementById("img_pj").src = "img/2.png";
		}
		else if(select_raza.value == "Gnomo") {
			mod_0.innerHTML = 2;
			mod_1.innerHTML = 0;
			mod_2.innerHTML = 0;
			mod_3.innerHTML = -2;
			mod_4.innerHTML = 0;
			mod_5.innerHTML = 2;
			document.getElementById("img_pj").src = "img/3.png";
		}
		else if(select_raza.value == "SemiOrco") {
			mod_0.innerHTML = 2;
			mod_1.innerHTML = 0;
			mod_2.innerHTML = 0;
			mod_3.innerHTML = -2;
			mod_4.innerHTML = 0;
			mod_5.innerHTML = -2;
			document.getElementById("img_pj").src = "img/4.png";
		}
		else {
			mod_0.innerHTML = 0;
			mod_1.innerHTML = 0;
			mod_2.innerHTML = 0;
			mod_3.innerHTML = 0;
			mod_4.innerHTML = 0;
			mod_5.innerHTML = 0;
			document.getElementById("img_pj").src = "img/5.png";
		}
	};
	
 	// Sumar stats
 	function sumar_stats(valor, estadistica, mod) {
		document.getElementById(estadistica).innerHTML = Number(valor) + Number(document.getElementById(mod).innerHTML);
	};
	
	// Generar vida y maná
	function vida_mana() {
		var barra_vida = document.getElementById("barra_vida");
		var barra_mana = document.getElementById("barra_mana");
		barra_vida.value = parseInt(vb_con.innerHTML) * generar_dado(9);
	 	document.getElementById("pv").innerHTML = "P.V (" + barra_vida.value + ")";
	 	barra_mana.value = Math.floor((parseInt(vb_int.innerHTML) + parseInt(vb_sab.innerHTML))/2) * generar_dado(5);
	 	document.getElementById("pm").innerHTML = "P.M (" + barra_mana.value + ")";
	};
	
 	// Boton reset
 	var btn_reset = document.getElementById('reset');
	btn_reset.addEventListener("click", function () {
		for(var $y = 0; $y < 6; $y++) {
			var select = document.getElementById("stats"+$y);
			select.selectedIndex = 0;
		};
		// Valores bases = 0
		vb_fue.innerHTML = 0;
		vb_des.innerHTML = 0;
	 	vb_con.innerHTML = 0;
	 	vb_int.innerHTML = 0;
	 	vb_sab.innerHTML = 0;
	 	vb_car.innerHTML = 0;
	 	// Raza
	 	select_raza.selectedIndex = 0;
	 	// Modificadores
	 	mod_0.innerHTML = 0;
	 	mod_1.innerHTML = 0;
	 	mod_2.innerHTML = 0;
	 	mod_3.innerHTML = 0;
	 	mod_4.innerHTML = 0;
	 	mod_5.innerHTML = 0;
	 	// Valores finales = 0
	 	vf_fue.innerHTML = 0;
	 	vf_des.innerHTML = 0;
	 	vf_con.innerHTML = 0;
	 	vf_int.innerHTML = 0;
	 	vf_sab.innerHTML = 0;
	 	vf_car.innerHTML = 0;
	 	vf_vida.innerHTML = "P.V (0)";
	 	vf_mana.innerHTML = "P.M (0)";
	 	document.getElementById('barra_vida').value = 0;
	 	document.getElementById('barra_mana').value = 0;
	 	// Bordes select y mensajes
	 	select_raza.style.border = "none";
	 	mensaje_raza.innerHTML = "";
		nombre_carta.style.border = "none";
		mensaje_nombre.innerHTML = "";
		select_fue.style.border = "none";
		select_des.style.border = "none";
		select_con.style.border = "none";
		select_int.style.border = "none";
		select_sab.style.border = "none";
		select_car.style.border = "none";
		mensaje_stats.innerHTML = "";
		titulo_carta.style.backgroundColor = "none";
 	});
 	
 	/* Si hay un cambio en el select de la raza */
	select_raza.addEventListener("change", function () {
		document.getElementById("raza_default").disabled = true;
		select_raza.style.border = "none";
		mensaje_raza.innerHTML = "";
	});
	/* Si hay un cambio en los selects de los stats */
	select_fue.addEventListener("change", function () {
		document.getElementById("stats_default0").disabled = true;
		select_fue.style.border = "none";
		mensaje_stats.innerHTML = "";
	});
	select_des.addEventListener("change", function () {
		document.getElementById("stats_default1").disabled = true;
		select_des.style.border = "none";
		mensaje_stats.innerHTML = "";
	});
	select_con.addEventListener("change", function () {
		document.getElementById("stats_default2").disabled = true;
		select_con.style.border = "none";
		mensaje_stats.innerHTML = "";
	});
	select_int.addEventListener("change", function () {
		document.getElementById("stats_default3").disabled = true;
		select_int.style.border = "none";
		mensaje_stats.innerHTML = "";
	});
	select_sab.addEventListener("change", function () {
		document.getElementById("stats_default4").disabled = true;
		select_sab.style.border = "none";
		mensaje_stats.innerHTML = "";
	});
	select_car.addEventListener("change", function () {
		document.getElementById("stats_default5").disabled = true;
		select_car.style.border = "none";
		mensaje_stats.innerHTML = "";
	});
 	
 	// Nombre carta
	nombre_carta.addEventListener("keyup", function () {
		var longitud_nombre = (nombre_carta.value).length;
		if(longitud_nombre != 0) {
			nombre_carta.style.border = "3px solid black";
			if(longitud_nombre >= 3 && longitud_nombre <= 10) {
				nombre_carta.style.border = "none";
				mensaje_nombre.innerHTML = "";
			}
			else {
				nombre_carta.style.borderColor = "red";

				if(longitud_nombre < 3) {
					mensaje_nombre.innerHTML = "El mínimo de caracteres es 3";
				}
				else if(longitud_nombre > 10) {
					mensaje_nombre.innerHTML = "El máximo de caracteres es 10";
				}
			}
		}
		else {
			nombre_carta.style.border = "none";
			mensaje_nombre.innerHTML = "";
		}
	});
	
	// Boton confirmar
 	var btn_confirmar = document.getElementById('confirmar');
	btn_confirmar.addEventListener("click", function () { 
		var nombre_correcto = comprobar_nombre();
		var raza_correcta = comprobar_raza();
		var stats_correctos = comprobar_stats();
		if(nombre_correcto && raza_correcta && stats_correctos) {
			vb_fue.innerHTML = select_fue.value;
			vb_des.innerHTML = select_des.value;
		 	vb_con.innerHTML = select_con.value;
		 	vb_int.innerHTML = select_int.value;
		 	vb_sab.innerHTML = select_sab.value;
		 	vb_car.innerHTML = select_car.value;
		 	document.getElementById("tipo_carta").innerHTML = select_raza.value;
		 	generar_mod_y_imagen();
		 	sumar_stats(vb_fue.innerHTML, "vf_fue", "mod_0");
		 	sumar_stats(vb_des.innerHTML, "vf_des", "mod_1");
		 	sumar_stats(vb_con.innerHTML, "vf_con", "mod_2");
		 	sumar_stats(vb_int.innerHTML, "vf_int", "mod_3");
		 	sumar_stats(vb_sab.innerHTML, "vf_sab", "mod_4");
		 	sumar_stats(vb_car.innerHTML, "vf_car", "mod_5");
		 	vida_mana(); 
		 	titulo_carta.style.backgroundColor = "white";
		 	btn_enviar_datos.removeAttribute('disabled');
		}
 	});
 	
 	function comprobar_stats() {
		var dados_generados = [];
		var stat_encontrado = [false,false,false,false,false,false];
		for (var r = 1; r <= 6; r++) {
			dados_generados[r] = document.getElementById("dado"+r).value;
		}
		for (var u = 1; u <= dados_generados.length; u++) {
			if (select_fue.value == dados_generados[u] && stat_encontrado[0] == false) {
				stat_encontrado[0] = true;
				select_fue.style.border = "3px solid green";
			}
			else if (select_des.value == dados_generados[u] && stat_encontrado[1] == false) {
				stat_encontrado[1] = true;
				select_des.style.border = "3px solid green";
			}
			else if (select_con.value == dados_generados[u] && stat_encontrado[2] == false) {
				stat_encontrado[2] = true;
				select_con.style.border = "3px solid green";
			}
			else if (select_int.value == dados_generados[u] && stat_encontrado[3] == false) {
				stat_encontrado[3] = true;
				select_int.style.border = "3px solid green";
			}
			else if (select_sab.value == dados_generados[u] && stat_encontrado[4] == false) {
				stat_encontrado[4] = true;
				select_sab.style.border = "3px solid green";
			}
			else if (select_car.value == dados_generados[u] && stat_encontrado[5] == false) {
				stat_encontrado[5] = true;
				select_car.style.border = "3px solid green";
			}
			else {
				break;
			}
		}
		if(stat_encontrado[0] == false) {
			select_fue.style.border = "3px solid red";
		}
		if(stat_encontrado[1] == false) {
			select_des.style.border = "3px solid red";
		}
		if(stat_encontrado[2] == false) {
			select_con.style.border = "3px solid red";
		}
		if(stat_encontrado[3] == false) {
			select_int.style.border = "3px solid red";
		}
		if(stat_encontrado[4] == false) {
			select_sab.style.border = "3px solid red";
		}
		if(stat_encontrado[5] == false) {
			select_car.style.border = "3px solid red";
		}
		for (var g = 0; g < stat_encontrado.length; g++) {
			if (stat_encontrado[g] == false) {
				mensaje_stats.innerHTML = "Comprueba los stats asignados";
				return false;
			}
		}
		return true;
	}

	btn_enviar_datos.addEventListener("click", function () {
		document.getElementById('ih_nombre').value = nombre_carta.value;
		document.getElementById('ih_raza').value = select_raza.value;
		document.getElementById('ih_img').value = document.getElementById('img_pj').src;
		document.getElementById('ih_fue').value = vf_fue.innerHTML;
		document.getElementById('ih_des').value = vf_des.innerHTML;
		document.getElementById('ih_con').value = vf_con.innerHTML;
		document.getElementById('ih_int').value = vf_int.innerHTML;
		document.getElementById('ih_sab').value = vf_sab.innerHTML;
		document.getElementById('ih_car').value = vf_car.innerHTML;
		document.getElementById('ih_pv').value = document.getElementById('barra_vida').value;
		document.getElementById('ih_pm').value = document.getElementById('barra_mana').value;
 	});
}