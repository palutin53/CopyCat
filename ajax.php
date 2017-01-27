<script>

// AJAX section

var req;

function loadXMLDoc(url) {
	req = false;
    // branch for native XMLHttpRequest object
    if(window.XMLHttpRequest) {
    	try {
			req = new XMLHttpRequest();
        } catch(e) {
			req = false;
        }
    // branch for IE/Windows ActiveX version
    } else if(window.ActiveXObject) {
       	try {
        	req = new ActiveXObject("Msxml2.XMLHTTP");
      	} catch(e) {
        	try {
          		req = new ActiveXObject("Microsoft.XMLHTTP");
        	} catch(e) {
          		req = false;
        	}
		}
    }
	if(req) {
		req.onreadystatechange = processReqChange;
		req.open("GET", url, true);
		req.send("");
	}
}

function processReqChange() {
	
    // only if req shows "loaded"
    if (req.readyState == 4) {
			
		// OK
        if (req.status == 200) {           
				
				var respuesta = req.responseText;
				//alert (respuesta);
				
				var instruccion = respuesta.substring(0,1);
				
				// de cuota ordinaria.
				if (instruccion == '1')
				{
					var valor = parseFloat(respuesta.substring(1, 100)); 
					
					<?php if ($tiporeciboid == $trCuotaOrdinaria) : ?>
						document.form1.edtValor.value = valor.toFixed(2);
					<?php endif; ?>
					
					<?php if ($tiporeciboid == $trInscripcion) : ?>
						var anterior = parseFloat(document.form1.edtOrdinarias.value);
						document.form1.edtOrdinarias.value = valor.toFixed(2);
						var total = parseFloat(document.form1.edtValor.value) - anterior + valor;
						document.form1.edtValor.value = total.toFixed(2);
					<?php endif; ?>
					
					<?php if ($tiporeciboid == $trConvenio) : ?>
						document.form1.edtOrdinarias.value = valor.toFixed(2);	
						CalcularTotalConvenio();
					<?php endif; ?>			
					
				}
				
				if (instruccion == '3')
				{
					var valor = parseFloat(respuesta.substring(1, 100)); 
					
					<?php if ($tiporeciboid == $trCuotaAnual) : ?>
						document.form1.edtValor.value = valor.toFixed(2);
					<?php endif; ?>	
					
					<?php if ($tiporeciboid == $trConvenioCuotaAnual) : ?>
						document.form1.edtAnuales.value = valor.toFixed(2);	
						CalcularTotalConvenio();
					<?php endif; ?>					
					
				}
				
				if (instruccion == '5')
				{
					var separador;
					var valor1;
					var valor3;
					
					separador = respuesta.indexOf('|');
					
					if (separador > 0)
					{
						valor1 = parseFloat(respuesta.substring(1, separador));
						valor3 = parseFloat(respuesta.substring(separador + 1, 100));
						
						document.form1.edtOrdinarias.value = valor1.toFixed(2);	
						document.form1.edtAnuales.value = valor3.toFixed(2);			
					}				
				}
				
				// Seguro Familiar.
				if (instruccion == '2')
				{
					var valor = parseFloat(respuesta.substring(2, 100)); 
					
					<?php if ($tiporeciboid == $trSeguroFamiliar) : ?>
						document.form1.edtValor.value = valor.toFixed(2);
					<?php endif; ?>			
				}
				
				if (instruccion == 'V')
				{
					
					var valor = parseFloat(respuesta.substring(1, 100)); 
					
					<?php 
						if ($tiporeciboid == $trCuotaOrdinaria || $tiporeciboid == $trCuotaAnual) :
					?>
							document.form1.edtValor.value = valor.toFixed(2);
					<?php
						endif;
					?>

					<?php 
						if ($tiporeciboid == $trInscripcion) :
					?>
						var anterior = parseFloat(document.form1.edtOrdinarias.value);
					
						document.form1.edtOrdinarias.value = valor.toFixed(2);
						var total = parseFloat(document.form1.edtValor.value) - anterior + valor;
						document.form1.edtValor.value = total.toFixed(2);
					<?php
						endif;
					?>
					
				}
				
				if (instruccion == 'I')
				{
					<? $Cadena = ?> respuesta <? ; ?>;
					<?php 
						list($Operacion, $ID_Cliente, $NombreC, $DireccionC, $NitC, $TelefonoC, $CorreoC) = explode(";", $Cadena);
					?>
					
					alert(respuesta.substring(1,2));

					var nombre = document.getElementById('txt_Nombre_Cliente');
					var direccion = document.getElementById('txt_Direccion_Cliente');
					var telefono = document.getElementById('txt_Telefono_Cliente');
					var email = document.getElementById('txt_Email_Cliente');
										
					nombre.value = <?php echo $NombreC ?>;
					direccion.value = <?php echo $DireccionC ?>;
					telefono.value = <?php echo $TelefonoC ?>;
					email.value = <?php echo $CorreoC ?>;						
					
				}
				
				//obj = document.getElementById("InfoPopup"); 
				//obj.innerHTML = req.responseText;
				
        } else {
            alert("Problema con la ejecución de código AJAX\n" +
                req.statusText);
        }
    }
}
</script>