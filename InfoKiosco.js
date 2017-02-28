function CortesKiosco()
{                               
    jQuery.post("CortesKiosco.php", {
    }, function(data, textStatus){
        if(data != ''){
            alert('Cortes en Maquina: ' + data);
            //enc_fact = data;
        }
        else{
            alert('Error');
        }
       });

};

function VentasKiosco()
{                               
    jQuery.post("VentasKiosco.php", {
    }, function(data, textStatus){
        if(data != ''){
            alert('Ventas del día: ' + data);
            //enc_fact = data;
        }
        else{
            alert('Error');
        }
       });

};

function CajaKiosco()
{                               
    jQuery.post("Caja_Kiosco.php", {
    }, function(data, textStatus){
        if(data != ''){
            alert('Efectivo en Caja: ' + data);
            //enc_fact = data;
        }
        else{
            alert('Error');
        }
       });

};