<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Temperatura</title>

    <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<#--<script src="/js/jquery.js"></script>-->

    <script
            src="https://code.jquery.com/jquery-1.12.4.min.js"
            integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
            crossorigin="anonymous"></script>
    <!-- Bootstrap Core JavaScript -->


</head>

<body>

<div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">Practica 12</a>
        </div>

        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">

                <li class="active">
                    <a href="/"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
                </li>
                <li class="active">
                    <a href="/producir/Temperatura/"><i class="fa fa-fw fa-bar-chart-o"></i>Nuevo Dispositivo</a>
                </li>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Flot Charts -->
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Enviando Temperatura</h2>

                </div>
            </div>
            <!-- /.row -->


        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<#--<!-- jQuery &ndash;&gt;-->
<#--<script src="/js/jquery.js"></script>-->

<!-- Bootstrap Core JavaScript -->
<script src="/js/bootstrap.min.js"></script>

<#--<!-- Morris Charts JavaScript &ndash;&gt;-->
<#--<script src="/js/plugins/morris/raphael.min.js"></script>-->
<#--<script src="/js/plugins/morris/morris.min.js"></script>-->
<#--<script src="/js/plugins/morris/morris-data.js"></script>-->

<!-- Flot Charts JavaScript -->
<#--<!--[if lte IE 8]><script src="js/excanvas.min.js"></script><![endif]&ndash;&gt;-->
<#--<script src="/js/plugins/flot/jquery.flot.js"></script>-->
<#--<script src="/js/plugins/flot/jquery.flot.tooltip.min.js"></script>-->
<#--<script src="/js/plugins/flot/jquery.flot.resize.js"></script>-->
<#--<script src="/js/plugins/flot/jquery.flot.pie.js"></script>-->
<#--<script src="/js/plugins/flot/flot-data.js"></script>-->
<script type="text/javascript">

    var idEquipo = prompt("Entre el id del Dispositivo: ");

    function getRandomInt(min, max) {
        min = Math.ceil(min);
        max = Math.floor(max);
        return Math.floor(Math.random() * (max - min)) + min; //The maximum is exclusive and the minimum is inclusive
    }

    function postData (idEquipo){
        var temperatura = getRandomInt(-32, 52);
        var humedad = getRandomInt(0, 50);
//        $.post('/api/guardar/temperatura/', {
//            idDispositivo: idEquipo,
//            temperatura: temperatura,
//            humedad: humedad
//        },function(data,status,xhr){
//            console.log(data)
//        } )
        $.ajax({
            type: 'post',
            url: '/api/guardar/temperatura/',
            data: JSON.stringify({
                idDispositivo: idEquipo,
                temperatura: temperatura,
                humedad: humedad
            }),
            contentType: "application/json; charset=utf-8",
            traditional: true,
            success: function (data) {
                console.log(data)
            }
        });
    }
    setInterval(function () {
//                alert("Hello");
       postData(idEquipo);

    }, 10000);
//    console.log(idEquipo)


</script>


</body>

</html>
