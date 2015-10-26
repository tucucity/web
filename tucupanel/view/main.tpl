<div class="container-fluid tucucity-sinpadd tucucity-fondoBlanco">

    <div class="container" ng-controller="ProductosController">

        <div class="row">
            <div>
                <div>
                    <div>{{Message}}</div>

                    Prueba
                </div>

            </div>
        </div>

        <div class="form-group">
            <div id="toolbar">
                <a role="button" class="btn btn-success" id="agregarItem" onClick="showDiv('panelNuevoItem')">
                    <i class="fa fa-plus"></i> Agregar Item
                </a>
                <a id="remove" class="btn btn-danger" onClick="borrarItem()">
                    <i class="fa fa-trash-o"></i> Eliminar Item
                </a>
            </div>
            <table id="tablaItem"></table>
        </div>

        <div id="panelNuevoItem" class="form-group" style="display:none;">AAAA</div>
        </div>
    </div>

    <div class="row" ng-controller="DatosTabla">
        <div ui-grid="{ data: listaDeArticulos }" class="myGrid"></div>

        <table id="pepepepe">
            <thead>
            <tr>
                <td>Id</td>
                <td>Nombre</td>
                <td>Tipo</td>
                <td>Precio</td>
                <td>Empresa</td>
                <td>Activo</td>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="art in listaDeArticulos">
                <td>{{art.id}}</td>
                <td>{{art.nombre}}</td>
                <td>{{art.tipo}}</td>
                <td>{{art.precio}}</td>
                <td>{{art.empresa}}</td>
                <td>{{art.activo}}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script src="{JS}tableArticulos"></script>

