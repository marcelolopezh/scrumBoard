<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
     
    <link href="css/style.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
   
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

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
                    <a class="nav-toggler waves-effect waves-	ght d-block d-md-none" href="javascript:void(0)"><i class="fas fa-bars"></i></a>
                </div>
               
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav float-left mr-auto">
                        <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>

                        </li>
                    </ul>
                    
                </div>                
            </nav>
        </header>

       

  
		<div class="container ">
			<div class="card">
	                <div class="card-body">
                   		<div class="row my-5">
							<div class="col-md-3"></div>
							<div class="col-md-6 text-center">
								<c:if test = "${booleanError}">
							        <div class="alert alert-danger" role="alert">
									  <c:out value="${mensaje}" />
									</div>
						        </c:if>	
						        
						        <c:if test = "${booleanSuccess}">
							        <div class="alert alert-success" role="alert">
									  <c:out value="${mensaje}" />
									</div>
						        </c:if>	
							</div>
						</div>
						<div class="row my-5">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<form:form action="/registro" class="form-control" method="POST" modelAttribute="user" >
									<h3 class="text-center"> Registro </h3>
									<hr>
									Nombre
									<form:input path="name" class="form-control" required="true"/>
									
									Apellidos
									<form:input path="lastName" class="form-control" required="true"/>
									
									Email
									<form:input path="email" type="email" class="form-control" required="true"/>
									
									Password
									<form:input path="password" type="password" value="" class="form-control" required="true"/>
									
									Password Confirm
									<form:input path="passwordConfirmation" value="" type="password"  class="form-control" required="true"/>
									
									<div class="mt-5 text-center">
										<input type="submit" value="Registrar" class="btn btn-dark btn-block">
										<small><a href="/login">Ingresar a la plataforma</a></small>
									</div>
								</form:form>
							</div>
							<div class="col-md-2"></div>
						</div>
	                </div>
	            </div>
		</div>

   		</div>
   
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="/js/custom.js"></script>
    
</body>
</html>