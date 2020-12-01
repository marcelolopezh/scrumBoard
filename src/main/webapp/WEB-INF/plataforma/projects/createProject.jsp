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
    <link rel="stylesheet" href="/css/style.css">
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
                       	<i class="fas fa-home ml-3 mt-1"></i>
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
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <c:out value="${ loggedUser.name }"/> <c:out value="${ loggedUser.lastName }"/> <i class="fas fa-user "></i></a>
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
                       	<li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/createProject" aria-expanded="false"><i class="fas fa-plus-square "></i><span class="hide-menu ">Nuevo Proyecto</span></a></li>
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
	       		<form:form modelAttribute="project" id="dataForm" action="/createProject"  method="POST" class="card">
	       			<div class="row">
	       				<div class="col-md-12  mt-5">
							<h3 class="text-center">Crear Proyecto</h3>
	       				</div>
	       			</div>
       				<div class="row p-5 ">
	                 	<div class="col-md-4">
		                 	<h4 class="mt-5">Nombre</h4>
			       			<form:input type="text" path="name" id="projectName" class="form-control" required="true"/>
			       			<h4>Descripción</h4>
			       			<form:textarea class="form-control" id="projectDescription" path="description" rows="3" required="true"/>
	                 	</div>
	                 	<div class="col-md-4">
	                	 	<h3></h3>
	                 		<h4 class="mt-5">Añadir Participantes</h4>
	                 		<div class="d-inline">
	                 			<input type="text" class="d-inline form-control" style="width:90%" placeholder="Email" name="searchUser" id="searchUser">
	                 			<button type="button" id="searchUserButton" class="d-inline btn btn-success"><i class="fa fa-search" aria-hidden="true"></i></button>
	                 		</div>
	                 		
	                 		<h3></h3>
	                 		<h4 class="mt-5">Añadir Cliente</h4>
	                 		<div class="d-inline">
	                 			<input type="text" class="d-inline form-control" style="width:90%" placeholder="Email" name="searchClient" id="searchClientInput">
	                 			<button type="button" id="searchClientButton" class="d-inline btn btn-info"><i class="fa fa-search" aria-hidden="true"></i></button>
	                 		</div>
	                 	</div>
	                 	<div class="col-md-4">
	                 		<h3></h3>
	                 		<h4 class="mt-5">Lista de Participantes</h4>
	                 		<div class="participantList">
	                 			
	                 		</div>
	                 		<h4 class="mt-5">Lista de Clientes</h4>
	                 		<div class="clientList">
	                 			
	                 		</div>
	                 	</div>
	                </div>
	                <div class="row">
	                	<div class="col-12 text-center">
	                		<button type="submit" class="btn btn-success" id="createProject">Crear Proyecto</button>
	                	</div>
	                </div>

	       		</form:form>
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