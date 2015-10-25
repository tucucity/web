<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="es" ng-app="App"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="es" ng-app="App"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="es" ng-app="App"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="es" ng-app="App"> <!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>{PROYECTO}</title>
    <link rel="icon" href="{IMG}favicon.png">
    <!-- Bootstrap -->
    <link href="{CSS}bootstrap.css" rel="stylesheet">
    <link href="{CSS}font-awesome.min.css" rel="stylesheet">
    <link href="{CSS}default.css" rel="stylesheet">
    <link href="{CSS}simple-sidebar.css" rel="stylesheet">
    <link href="{CSS}sequence.css" rel="stylesheet">

      <!-- js --------------------------------- -->
      <script src="{JS}jquery"></script>
      <script src="{JS}bootstrap.min"></script>
      <script src="{JS}jquery.sequence-min"></script>
      <script src="{JS}vendor/angular.min"></script>
      <script src="{JS}plugins"></script>

      <script src="{JS}default"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  <script src="{JS}vendor/modernizr-2.8.3-respond-1.4.2.min"></script>
  </head>
  <body  ng-app="App">

  <div class="container-fluid tucucity-sinMargin tucucity-sinPadd tucucity-header">
            <div class="container tucucity-sinPadd">
                <nav class="navbar navbar-inverse tucucity-sinMargin">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="{HOME}" style="padding-top: 6px;"><img src="{IMG}logo.png"></a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="{HOME}"><i class="fa fa-home" style="font-size: 20px"></i> Home</a></li>
                                <li><a href="comercios"><i class="fa fa-university"></i> Comercios</a></li>
                                <li><a href="profesionales"><i class="fa fa-graduation-cap"></i> Profesionales</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>
  </div>


      {view}


  <footer>
      <div class="container-fluid tucucity-sinMargin tucucity-sinPadd tucucity-footer1">
          <div class="container tucucity-sinPadd">
              <div class="row tucucity-sinMargin">
                  <div class="col-xs-12 col-lg-2">

                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                      <a>
                          <table>
                              <tr>
                                  <td>
                                      <span>
                                          <i class="fa fa-users"></i>
                                      </span>
                                  </td>
                                  <td>
                                      Quienes
                                      <br>
                                      Somos
                                  </td>
                              </tr>
                          </table>
                      </a>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                      <a>
                          <table>
                              <tr>
                                  <td>
                                      <span>
                                          <i class="fa fa-question"></i>
                                      </span>
                                  </td>
                                  <td>
                                      Preguntas
                                      <br>
                                      Frecuentes
                                  </td>
                              </tr>
                          </table>
                      </a>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                      <a>
                          <table>
                              <tr>
                                  <td>
                                      <span>
                                          <i class="fa fa-envelope"></i>
                                      </span>
                                  </td>
                                  <td>
                                      Contectenos
                                  </td>
                              </tr>
                          </table>
                      </a>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                      <a>
                          <table>
                              <tr>
                                  <td>
                                      <span>
                                          <i class="fa fa-exclamation"></i>
                                      </span>
                                  </td>
                                  <td>
                                      Publicite en
                                      <br>
                                      TucuCity
                                  </td>
                              </tr>
                          </table>
                      </a>
                  </div>
                  <div class="col-xs-12 col-lg-2">

                  </div>
              </div>
          </div>
      </div>
      <div class="container-fluid tucucity-sinMargin tucucity-sinPadd tucucity-footer2">
          <div class="container">
              <div class="row">
                  <div class="col-sm-3">
                      <ul>
                          <li>
                              <b>Empresa</b>
                          </li>
                          <li>
                              <a>Quiénes Somos</a>
                          </li>
                          <li>
                              <a>Preguntas Frecuentes</a>
                          </li>
                      </ul>
                  </div>
                  <div class="col-sm-3">
                      <ul>
                          <li>
                              <b>Contacto</b>
                          </li>
                          <li>
                              <a>Consultas</a>
                          </li>
                          <li>
                              <a>Publicite en TucuCity</a>
                          </li>
                      </ul>
                  </div>
                  <div class="col-sm-3">
                      <ul>
                          <li>
                              <b>Términos y Privacidad</b>
                          </li>
                          <li>
                              <a>Términos y Condiciones</a>
                          </li>
                          <li>
                              <a>Privacidad</a>
                          </li>
                      </ul>
                  </div>
                  <div class="col-sm-3">
                      <ul>
                          <li>
                              <a><i class="fa fa-facebook-square"></i></a>
                              <a><i class="fa fa-twitter-square"></i></a>
                              <a><i class="fa fa-pinterest-square"></i></a>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>

      <div class="container-fluid tucucity-sinMargin tucucity-sinPadd tucucity-footer3">
          <div class="container tucucity-sinPadd">
              <div class="row tucucity-sinMargin">
                  Todos los derechos reservados 2015
              </div>
          </div>
      </div>
  </footer>

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