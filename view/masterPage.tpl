<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<html lang="es" ng-app="App">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  <script src="{JS}vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
  </head>
  <body>



    <div class="container-fluid">
      {view}
    </div>



    <script src="{JS}jquery"></script>
    <script src="{JS}bootstrap.min"></script>
    <script src="{JS}jquery.sequence-min"></script>
    <script src="{JS}angular.min"></script>
    <script src="{JS}plugins.js"></script>

    <script src="{JS}default"></script>
    <!-- SimpleJS -->

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