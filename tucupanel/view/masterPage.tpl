<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="es" ng-app="App" > <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="es" ng-app="App" > <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="es" ng-app="App" > <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="es" ng-app="App" > <!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>{PROYECTO}</title>
    <link rel="icon" href="{IMG}favicon.png">
    <!-- Bootstrap -->
    <link href="{CSS}bootstrap.css" rel="stylesheet">
    <link href="{CSS}bootstrap-theme.css" rel="stylesheet">
    <link href="{CSS}font-awesome.min.css" rel="stylesheet">
    <link href="{CSS}default.css" rel="stylesheet">
    <link href="{CSS}simple-sidebar.css" rel="stylesheet">
    <link href="{CSS}sequence.css" rel="stylesheet">
      <link rel="stylesheet" href="{CSS}bootstrap-table.min.css"/>
      <link rel="stylesheet" href="{CSS}bootstrap-table-filter.css"/>

      <script src="{JS}vendor/jquery"></script>
      <script src="{JS}vendor/bootstrap"></script>
      <script src="{JS}vendor/angular"></script>
      <script type="text/javascript">
          app = angular.module('App', [])
                  .controller('ProductosController', function($scope,$http) {
                      $scope.Message = "Mensaje de Bienvenida. Continuemos!!!";
                  })
                  .controller('DatosTabla', function($scope,$http) {

                      $scope.listaDeArticulos = [];
                      $http.post('{HOME}articulo/getArticulos').success(function(data)
                      {
                          $scope.listaDeArticulos = data;

                      });
                  })
          ();

      </script>
      <script src="{JS}vendor/bootstrap-table-all.min"></script>
      <script src="{JS}vendor/bootstrap-table-export"></script>
      <script src="{JS}vendor/bootstrap-table-filter"></script>
  </head>
  <body>
  <!--[if lt IE 8]>
  <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
  <![endif]-->


  <!-- Add Here your view-->
  <div class="container-fluid">

      {view}

      <div class="container-fluid tucucity-sinMargin tucucity-sinPadd tucucity-footer3">
          <div class="container tucucity-sinPadd">
              <div class="row tucucity-sinMargin">
                  Todos los derechos reservados 2015
              </div>
          </div>
      </div>
  </div>

  <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
    <script>
        (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
        ga('create','UA-XXXXX-X','auto');ga('send','pageview');
    </script>

  </body>
</html>