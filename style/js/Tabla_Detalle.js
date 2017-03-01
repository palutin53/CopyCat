
	function displayResult()
        {
            var Cantidad = document.getElementById("txt_Cantidad").value;
            var Cod_Prod = document.getElementById("Ddl_Tipo_Productos").value;
            var Descripcion = document.getElementById("des_prod").value;
            var Precio_Unitario = document.getElementById("txt_Precio_Unitario").value;
            var Total_Producto = parseFloat(0);
            Total_Producto = (parseFloat(Cantidad) * parseFloat(Precio_Unitario)) * 1;

            document.getElementById("myTable").insertRow(-1).innerHTML = 
            '<td><span class="ColumnHeader"><STRONG>' + Cantidad + '</td><td><span class="ColumnHeader"><STRONG>' + Cod_Prod + '</STRONG></span></td><td><span class="ColumnHeader"><STRONG>' + Descripcion + '</STRONG></span></td><td><span class="ColumnHeader"><STRONG>' + Precio_Unitario + '</STRONG></span></td><td><span class="ColumnHeader"><STRONG>' + Total_Producto + '</td><td><span class="ColumnHeader"><STRONG><input type="button" value="Quitar" onclick="Eliminar(this.parentNode.parentNode.rowIndex)"/></STRONG></span></td>';
           
                        var total = parseFloat(0);

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
                            $("input#total_importe").val(parseFloat(total).toFixed(2));
                        }
                    })    

        };

    $(function () {
                $("#btnRecorrer").click(function () 
                {
                    $("#myTable tbody tr").each(function (index) 
                    {
                        var campo1, campo2, campo3;
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
                            }
                            $(this).css("background-color", "#ECF8E0");
                        })
                        if(campo1 != 'DATO 1'){
                            alert(campo1 + ' - ' + campo2 + ' - ' + campo3);
                        }
                    })
                })
    });


    function Eliminar (i) {
                //document.getElementsByTagName("table")[0].setAttribute("id","tableid");
                document.getElementById("myTable").deleteRow(i);
                var total = parseFloat(0);

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
                            $("input#total_importe").val(parseFloat(total).toFixed(2));
                        }
                    })    
    };