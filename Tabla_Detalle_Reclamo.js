
	function displayResult()
        {
            var existencia = document.getElementById("txt_Existencia").value;

            if(existencia != '0'){
                
                var Cantidad = document.getElementById("txt_Cantidad").value;
                var Cod_Prod = document.getElementById("txt_Codigo_Producto").value;
                var Descripcion = document.getElementById("txt_Descripcion_Producto").value;
                var Precio_Unitario = document.getElementById("txt_Precio_Unitario").value;
                var Total_Producto = parseFloat(0);
                Total_Producto = (parseFloat(Cantidad) * parseFloat(Precio_Unitario)) * 1;

                document.getElementById("myTable").insertRow(-1).innerHTML = 
                '<td><span class="ColumnHeader"><STRONG>' + Cantidad + '</td><td><span class="ColumnHeader"><STRONG>' + Cod_Prod + '</STRONG></span></td><td><span class="ColumnHeader"><STRONG>' + Descripcion + '</STRONG></span></td><td><span class="ColumnHeader"><STRONG>' + Precio_Unitario + '</STRONG></span></td><td><span class="ColumnHeader"><STRONG>' + Total_Producto + '</td>';
               
                            var total = parseFloat(0);
                            var descuento = parseFloat(document.getElementById("txt_Descuento").value) * 1;
                            var total_venta = parseFloat(0);

                    $("#myTable tbody tr").each(function (index) 
                        {
                            var campo1;
                            $(this).children("td").each(function (index2) 
                            {
                                switch (index2) 
                                {
                                    case 4: campo1 = $(this).text();
                                            break;                                
                                }
                                //$(this).addClass("TableDetail1");
                            })
                            if(campo1 != 'Total'){
                                //alert(parseFloat(campo1));
                                $(this).addClass("TableDetail1");
                                total = (parseFloat(total) + parseFloat(campo1)) * 1;
                                total_venta = (parseFloat(total) - parseFloat(descuento)) * 1;

                                $("input#total_importe").val(parseFloat(total).toFixed(2));
                                $("input#txt_Total_Venta").val(parseFloat(total_venta).toFixed(2));
                            }
                        })    
                    $('input#txt_Cantidad').val('1');
                    $('input#txt_Codigo_Producto').val('');
                    $('textarea#txt_Descripcion_Producto').val('');
                    $('input#txt_Precio_Unitario').val('');
                    $('input#txt_Existencia').val('');
                    $('input#des_prod').val('');
                    $('input#des_prod').focus();
            }
            else{
                alert('Producto sin Existencias en Kisco.');
                $('input#des_prod').focus();
            }
        };

    $(function () {
                $("#btnRecorrer").click(function () 
                {
                    $("#myTable tbody tr").each(function (index) 
                    {
                        var campo1, campo2, campo3, campo4, campo5, campo6, enc_fact;
                        $(this).children("td").each(function (index2) 
                        {
                            switch (index2) 
                            {
                                case 0: campo1 = $(this).text();
                                        break;
                                case 1: campo2 = $(this).text();
                                        break;
                                case 2: campo3 = $(this).text();
                                        break;
                                case 3: campo4 = $(this).text();
                                        break;
                                case 4: campo5 = $(this).text();
                                        break;
                            }
                            //$(this).css("background-color", "#ECF8E0");
                        })
                        if(index == 1){
                            
                            //alert('Incidencia');

                                //alert('ID_Cliente Nuevo: ' + ID_Cliente);
                                var tipoin = $('select#Ddl_Tipo_Inc').val();
                                var descin = $('textarea#txt_Observaciones_Incidencia').val();
                                var aplip = $('select#Ddl_Aplica_Prod').val();
                                var enc_fac = $('input#txt_Encabezado_Fac').val();
                                //alert('----------');
                                //alert('nombre: ' + namec);

                                jQuery.post("Operar_Incidencia.php", {
                                    tipoinci:tipoin,
                                    descripcionin:descin,
                                    aplicap:aplip,
                                    enc_fact:enc_fac
                                    }, function(data, textStatus){
                                    if(data != ''){
                                        alert('Encabezado Factura Ingresado ' + data);
                                        //enc_fact = data;
                                    }
                                    else{
                                        //alert('Error en Encabezado Factura');
                                    }
                                });
                        }
                        if(campo1 != 'Cantidad'){
                            //alert(campo1 + ' - ' + campo2 + ' - ' + campo3 + ' - ' + campo4 + ' - ' + campo5);
                            //var tipop = $('select#Ddl_Tipo_Pago').val();
                            jQuery.post("Operar_Detalle_Incidencia.php", {
                                    codProducto:campo2
                                    }, function(data, textStatus){
                                    if(data != ''){
                                        //alert('Encabezado Factura Ingresado ' + data);
                                        //enc_fact = data;
                                    }
                                    else{
                                        //alert('Error en Encabezado Factura');
                                    }
                            });
                        }
                    })
                    alert('Incidencia Almacenada con Exito');
                })
    });


    function Eliminar (i) {
                //document.getElementsByTagName("table")[0].setAttribute("id","tableid");
                document.getElementById("myTable").deleteRow(i);
                
                var total = parseFloat(0);
                var descuento = parseFloat(document.getElementById("txt_Descuento").value) * 1;
                var total_venta = parseFloat(0);

                $("#myTable tbody tr").each(function (index) 
                    {
                        var campo1;
                        $(this).children("td").each(function (index2) 
                        {
                            switch (index2) 
                            {
                                case 4: campo1 = $(this).text();
                                        break;                                
                            }
                        })
                        if(campo1 != 'Total'){
                            $(this).addClass("TableDetail1");
                            //alert(parseFloat(campo1));
                            total = (parseFloat(total) + parseFloat(campo1)) * 1;
                            total_venta = (parseFloat(total) - parseFloat(descuento)) * 1;

                            $("input#total_importe").val(parseFloat(total).toFixed(2));
                            $("input#txt_Total_Venta").val(parseFloat(total_venta).toFixed(2));
                        }
                    })    
    };