<div style="position: relative;">
    <div class="container-fluid tucucity-sinpadd tucucity-fondoWomenShopping tucucity-padd-fondoWomenShopping">

    </div>
    <div class="container-fluid tucucity-buscador">
            <div class="row">
                <div class="col-sm-4">

                </div>
                <div class="col-sm-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="¿Qué estas buscando?">
                      <span class="input-group-btn">
                        <button class="btn btn-danger" type="button"><i class="fa fa-search"></i></button>
                      </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

                <div class="col-sm-4">

                </div>
            </div><!-- /.row -->
    </div>
</div>

<div class="container-fluid tucucity-sinpadd tucucity-fondoRojo">
    <div class="container">
        <div class="row tucucity-noticias">
            <div class='col-xs-12 col-sm-12 col-md-2 col-lg-2 text-center'>
                <img src="{IMG}infobae.png">
                <br>
                <a href="http://www.infobae.com/">NOTICIAS</a>
            </div>
            {rssnoticias}
        </div>
    </div>
</div>
<div class="container-fluid tucucity-fondoDgris tucucity-sinPadd">
    <div class="container" ng-controller="ProductosController">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2 tucucity-articulo" ng-repeat="articulo in Productos">
                <div class="col-sm-12">
                    <img src="{{articulo.articulo_foto}}">
                    <h3>{{articulo.precio}}</h3>
                    <p>
                        {{articulo.articulo_nombre}}
                    </p>
                    <div>
                        <i class="fa fa-home"></i> {{articulo.empresa_nombre}}
                        <br>
                        <i class="fa fa-map-marker"></i> {{articulo.empresa_direccion}}
                        <br>
                        <i class="fa fa-phone"></i> {{articulo.empresa_numero}}
                    </div>
                    <a class="btn btn-danger">Ver Detalles</a>&nbsp;<a class="btn btn-danger"><i class="fa fa-envelope-o"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    app = angular.module('App', []).controller('ProductosController', function($scope,$http)
    {
        $scope.Productos = [];
        buscador = [{text:'',page:0}];
        $http.post('{HOME}BuscardorDeArticulos/buscar/',JSON.stringify($scope.buscador, null, 2)).success(function(data, status, headers, config)
        {
            $scope.Productos = data;
        });
    });
</script>