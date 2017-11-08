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

    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/js/plugins/morris/raphael.min.js"></script>
    <script src="/js/plugins/morris/morris.min.js"></script>
    <script src="/js/plugins/morris/morris-data.js"></script>

    <!-- Flot Charts JavaScript -->
    <!--[if lte IE 8]>
    <script src="js/excanvas.min.js"></script><![endif]-->
    <script src="/js/plugins/flot/jquery.flot.js"></script>
    <script src="/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="/js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="/js/plugins/flot/flot-data.js"></script>


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

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Charts
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-bar-chart-o"></i> Charts
                        </li>
                    </ol>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <h2 class="panel-title"><i class="fa fa-long-arrow-right"></i> Grafos Lineales para Sensor 1
                                <span id="sensor1"></span></h2>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                <#--<div class="flot-chart">-->
                                    <canvas id="ChartTemperatura" width="200" height="100"></canvas>
                                <#--</div>-->
                                </div>

                                <div class="col-lg-6">
                                <#--<div class="flot-chart">-->
                                    <canvas id="ChartHumedad" width="200" height="100"></canvas>
                                <#--</div>-->
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h2 class="panel-title"><i class="fa fa-long-arrow-right"></i> Grafos Lineales para
                                    Sensor 2</h2>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <#--<div class="flot-chart">-->
                                            <canvas id="ChartTemperatura1" width="200" height="200"></canvas>
                                        <#--</div>-->
                                    </div>
                                    <div class="col-lg-6">
                                        <#--<div class="flot-chart">-->
                                            <canvas id="ChartHumedad1" width="200" height="200"></canvas>
                                        <#--</div>-->
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script>
    <script type="text/javascript">
        var ctxHumedad1 = document.getElementById("ChartHumedad");
        var ctxHumedad2 = document.getElementById("ChartHumedad1");
        var ctxTemperatura1 = document.getElementById("ChartTemperatura");
        var ctxTemperatura2 = document.getElementById("ChartTemperatura1");

        var chartHum1 = null;
        var chartHum2 = null;
        var chartTemp1 = null;
        var chartTemp2 = null;


        setInterval(function () {


            $.get("/api/buscar/temperatura/1", function (data, status) {

                var elementsTempe = [];
                var elementsHume = [];
                var label = [];
                data.forEach(function (doc) {
                    //  console.log(doc);
                    var a = new Date(doc["fecha"]).toLocaleTimeString().split(':');
                    var seconds = (+a[0]) * 60 * 60 + (+a[1]) * 60 + (+a[2]);
                    elementsHume.push(doc.humedad);
                    elementsTempe.push(doc.temperatura);
                    label.push(seconds);
                    console.log(label);
                    chartHum1 = new Chart(ctxHumedad1, {
                        type: 'line',
                        data: {
                            datasets: [{
                                label: 'Humedad',
                                data: elementsHume
                            }],
                            labels: label
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        suggestedMin: 0,
                                        suggestedMax: 32
                                    }
                                }]
                            }
                        }


                    })
                    chartTemp1 = new Chart(ctxTemperatura1, {
                        type: 'line',
                        data: {
                            datasets: [{
                                label: 'Temperatura',
                                data: elementsTempe
                            }],
                            labels: label
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        suggestedMin: 0,
                                        suggestedMax: 50
                                    }
                                }]
                            }
                        }


                    })
                });
            });


            $.get("/api/buscar/temperatura/2", function (data, status) {

                var elementsTempe = [];
                var elementsHume = [];
                var label = [];
                data.forEach(function (doc) {
                    //  console.log(doc);
                   // console.log( new Date(doc["fecha"]).toLocaleTimeString())
                    var a = new Date(doc["fecha"]).toLocaleTimeString().split(':');
                    var seconds = (+a[0]) * 60 * 60 + (+a[1]) * 60 + (+a[2]);
                    elementsHume.push(doc.humedad);
                    elementsTempe.push(doc.temperatura);
                    label.push(seconds);
                    console.log(label);
                    chartHum2 = new Chart(ctxHumedad2, {
                        type: 'line',
                        data: {
                            datasets: [{
                                label: 'Humedad',
                                data: elementsHume
                            }],
                            labels: label
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        suggestedMin: 0,
                                        suggestedMax: 32
                                    }
                                }]
                            }
                        }


                    })
                    chartTemp2 = new Chart(ctxTemperatura2, {
                        type: 'line',
                        data: {
                            datasets: [{
                                label: 'Temperatura',
                                data: elementsTempe
                            }],
                            labels: label
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        suggestedMin: 0,
                                        suggestedMax: 50
                                    }
                                }]
                            }
                        }


                    })
                });
            });
        }, 6000);

    </script>
</body>

</html>
