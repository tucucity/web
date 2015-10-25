/**
 * Created by Javier on 25/10/2015.
 */
//Defino variables a utilizar.
var idNuevaEncuesta = null;
var request;
var indexRow = 1;
var tableId = 'tablaItem';
var _data = [];
var _columns = [
    {
        checkbox:true,
    },
    {
        sortable:'true',
        field: 'id',
        title: 'ID'
    },
    {
        sortable:'true',
        field: 'nombre',
        title: 'Nombre'
    },
    {
        sortable:'true',
        field: 'tipo',
        title: 'Tipo'
    },
    {
        field: 'tipo',
        visible: false
    },
    {
        sortable:'true',
        field: 'precio',
        title: 'Precio'
    },
    {
        sortable:'true',
        field: 'activo',
        title: 'Activo'
    }
];

//Definición de las funciones usadas
var createTableWithData = function(tableId, toolbarId, _columns, _data){
    $('#'+tableId).bootstrapTable('destroy');
    $('#'+tableId).bootstrapTable({
        toolbar:'#'+toolbarId,
        showExport: true,
        showPaginationSwitch: true,
        showToggle: true,
        showRefresh: true,
        showColumns: true,
        strictSearch: true,
        search: true,
        sortName: 'id',
        sortOrder: 'asc',
        clickToSelect: true,
        pagination: true,
        data: _data,
        columns: _columns
    });
};
var showDiv = function(id){
    $('#'+id).show('slow');
};
var hideDiv = function(id){
    $('#'+id).hide();
};

//Resetear Button de Valoracion
var resetearRadButton_Valoracion = function(id){
    if(id == 'valPositiva'){
        $('#valPositiva').prop("checked", true);
        $('#valNegativa').prop("checked", false);
    }
    else{
        $('#valPositiva').prop("checked", false);
        $('#valNegativa').prop("checked", true);
    }
};

//Resetear Button de Tipo de Opcion -Cerrada o Abierta-
var resetearRadButton = function(id){
    if(id == 'optAbierto'){
        $('#optAbierto').prop("checked", true);
        $('#optCerrado').prop("checked", false);
    }
    else{
        $('#optAbierto').prop("checked", false);
        $('#optCerrado').prop("checked", true);
    }
};

//BORRAR ITEM
var borrarItem = function(){
    var table = $('#'+tableId);

    //Función jquery que itera para conseguir los ids de las filas seleccionadas de la tabla.
    var ids = $.map(table.bootstrapTable('getSelections'), function (row) {
        return row.id;
    });

    table.bootstrapTable('remove', {
        field: 'id',
        values: ids
    });
};

//GUARDAR ITEM
var guardarItem = function(){
    var nuevoItem = []; //array vacío nuevo Item.

    nuevoItem['contenido'] = $('#contenidoItem').val(); //Guarda el valor en el nuevoItem.
    nuevoItem['idNuevaEncuesta'] = window.idNuevaEncuesta;

    if(nuevoItem['contenido'] != ''){

        nuevoItem['valoracion'] = (document.getElementById('valPositiva').checked) ? 'S' :  'N';

        nuevoItem['valoracion-text'] = (nuevoItem['valoracion']=='S') ? 'Si' : 'No';

        //Si esta chequeado el radbutton cerrado, después agrega opciónes seleccionadas.
        var e = document.getElementById('listaOpciones');
        if(document.getElementById('optCerrado').checked){
            nuevoItem['tipo'] = 2; //tipo 2 es cerrado en la base como entero.
            nuevoItem['tipo-text'] = 'Cerrado';

            //Guarda el valor seleccionado de la opción.
            nuevoItem['opcion_codigo'] = e.options[e.selectedIndex].value;
            nuevoItem['opciones-text'] = e.options[e.selectedIndex].text;
        }
        else{
            nuevoItem['tipo'] = 1; //tipo 1 es abierto en la base como entero.
            nuevoItem['tipo-text'] = 'Abierto';
            nuevoItem['opcion_codigo'] = '';
            nuevoItem['opciones-text'] = '-';
        }

        //Por prevención, si hay un valor viejo en la variable request, lo borra.
        if (request) {
            request.abort();
        }

        var data_item = {
            idNuevaEncuesta : nuevoItem['idNuevaEncuesta'],
            contenido : nuevoItem['contenido'],
            valoracion : nuevoItem['valoracion'],
            tipo : nuevoItem['tipo'],
            opcion_codigo : nuevoItem['opcion_codigo']
        }

        request = $.ajax({
            url: "home/addItem",
            dataType: 'text',
            type: "post",
            data: data_item
        });

        //Request recibido.
        request.done(function(response, textStatus, jqXHR){
            response = JSON.parse(response);
            console.log(response.idItem);
            console.log(response.status);
            console.log( nuevoItem['valoracion']);

            if(response.status == 'OK'){
                idItems = response.idItem;

                $('#contenidoItem').val('');//Borra el valor viejo. Lo limpia al input.
                hideDiv('divOpcion');
                e.selectedIndex = 0; //Reinicia a la primera opción.
                showDiv('notItem');//Muestra mensaje item agregado.

                //Agrega la tabla al item y aumenta el número de fila.
                nuevaFila = {
                    id: idItems, //reemplazar por el índice que devuelve la base.
                    contenido: nuevoItem['contenido'],
                    tipo: nuevoItem['tipo'],
                    tipoText: nuevoItem['tipo-text'],
                    opcionCodigo: nuevoItem['opcion_codigo'],
                    opcionesText: nuevoItem['opciones-text'],
                    valoracion : nuevoItem['valoracion-text']
                };
                $('#'+tableId).bootstrapTable('append', nuevaFila);
                //indexRow = indexRow + 1; //Si uso el indice de la base, no importa.
            }
            else {
                alert('Error de status:' + response.error);
            }
        });

        //Error en el request. Error en la comunicación con el servidor/controlador.
        request.fail(function (jqXHR, textStatus, errorThrown){
            alert("Error1: " + textStatus, errorThrown);
        });
    }
    else{
        showDiv('notItemError2');//Error cuando el campo nombre esta vacío
    }
};


//GUARDAR NOMBRE DE LA ENCUESTA
$("#formNuevaEncuesta").submit(function(event){
    //Previene la acción del submit del form común.
    event.preventDefault();

    //Por prevención, si hay un valor viejo en la variable request, lo borra.
    if (request) {
        request.abort();
    }

    var _nuevaEncuesta = {
        nombre: $('#nombreNuevaEncuesta').val()
    }

    //llamado asincronico.
    request = $.ajax({
        url: "home/addEncuesta", //--> action del controller.
        dataType: 'text',
        type: "post",
        data: _nuevaEncuesta
    });

    //Request recibido.
    request.done(function(response, textStatus, jqXHR){
        response = JSON.parse(response);
        if(response.status == 'OK'){

            //deshabilito y habilito campos.
            window.idNuevaEncuesta = response.idNuevaEncuesta;

            $('#nombreNuevaEncuesta').attr('disabled','disabled');
            $('#agregarItem').removeAttr('disabled');
            $('#remove').removeAttr('disabled');
            showDiv('notEnc');
        }
        else {
            alert('Error:' + response.error);
        }
    });

    //Error en el request. Error en la comunicación con el servidor/controlador.
    request.fail(function (jqXHR, textStatus, errorThrown){
        alert("Error: " + textStatus, errorThrown);
    });
});

//Crea la tabla para los items a partir de un array de los datos _data.
createTableWithData(tableId,'toolbar',_columns,_data);