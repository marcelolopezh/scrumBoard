<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 
<%@ page isErrorPage="true" %>   

<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <title>ScrumBoard Taller de Integración</title>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/style.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
	
</head>

<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div> 
    

    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full" data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                	<a class="navbar-brand" href="/">
                        <b class="logo-icon">
                        	<h3><i class="fas fa-home ml-3 mt-1"></i></h3>
                        </b>
                    </a>
                    <a class="nav-toggler waves-effect waves-	ght d-block d-md-none" href="javascript:void(0)"><i class="fas fa-bars"></i></a>
                </div>
               
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav float-left mr-auto">
                        <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>

                        </li>
                    </ul>
                    <ul class="navbar-nav float-right">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <c:out value="${ user.name }"/> <c:out value="${ user.lastName }"/> <i class="fas fa-user "></i></a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated">
                                <a class="dropdown-item" href=""><i class="fas fa-user"></i> Ver mi Perfil</a>
                                <a class="dropdown-item" href="/logout"><i class="fas fa-sign-out-alt"></i> Salir de la sesión</a>
                            </div>
                        </li>
                    </ul>
                </div>                
            </nav>
        </header>

        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="p-15 m-t-10"><a href="javascript:void(0)" class="btn btn-block create-btn text-white no-block d-flex align-items-center"> <span class="hide-menu m-l-5">Opciones</span> </a></li>
                        <!-- User Profile-->
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/showProjects" aria-expanded="false"><i class="fas fa-list-ul"></i><span class="hide-menu">Proyectos</span></a></li>
                       	<li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/createProject" aria-expanded="false"><i class="fas fa-plus-square"></i><span class="hide-menu">Nuevo Proyecto</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>

        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row align-items-center">
                    <div class="col-5">
                        <h4 class="page-title">Inicio</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                            	<h3>Información Proyecto 1</h3>
                                <canvas id="myChart" ></canvas>
                                <script>
                                function randomInt(min, max) {
                                	return min + Math.floor((max - min) * Math.random());
                                }
                                total_dias = randomInt(10,20)
                                array_dias = []
								for(i=1;i<=total_dias;i++){
									array_dias.push(i)
								}
                                
                                total_horas = randomInt(60,70)
                                horas_por_dia = total_horas/total_dias
                                array_horas = []
                                data = []
                                for(i=1;i<=total_dias;i++){
									array_horas.push(total_horas-(i*horas_por_dia))
									data.push(randomInt(5,10))
                                }
                                
                                new Chart(
                                   document.getElementById("myChart"),{
                                   "type":"line",
                                   "data":{
                                       "labels": array_dias,
                                        "datasets":[{
                                            "label":"Trabajo Estimado",
                                            "data":array_horas,
                                            "fill":false,
                                            "borderColor":"rgb(75, 192, 192)",
                                            "lineTension":0.1
                                        },{
                                            "label":"Trabajo Real",
                                            "data":data,
                                            "fill":false,
                                            "borderColor":"rgb(255, 44, 44)",
                                            "lineTension":0.1
                                        }
                                        ]
                                    },
                                   "options":{}
                                   });
								</script>
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                            	<h3>Información Proyecto 2</h3>
                                <canvas id="myChart2" ></canvas>
                                <script>
                                function randomInt(min, max) {
                                	return min + Math.floor((max - min) * Math.random());
                                }
                                let data2 = [];
                                for(i=0;i<14;i++){
									data2.push(randomInt( 30, 50));
                                }
                                new Chart(
                                   document.getElementById("myChart2"),{
                                   "type":"line",
                                   "data":{
                                       "labels": ["January","February","March","April","May","June","July","January","February","March","April","May","June","July"],
                                        "datasets":[{
                                            "label":"My First Dataset",
                                            "data":data2,
                                            "fill":true,
                                            "borderColor":"rgb(75, 192, 192)",
                                            "lineTension":0.2
                                        }]
                                    },
                                   "options":{}
                                   });
								</script>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
          
            <footer class="footer text-center">
                All Rights Reserved by Xtreme Admin. Designed and Developed by <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            
        </div>
    </div>
   
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/sidebarmenu.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
</body>
</html>