$(function() {
    "use strict";

    $(".preloader").fadeOut();
    // this is for close icon when navigation open in mobile view
    $(".nav-toggler").on('click', function() {
        $("#main-wrapper").toggleClass("show-sidebar");
        $(".nav-toggler i").toggleClass("ti-menu");
    });
    $(".search-box a, .search-box .app-search .srh-btn").on('click', function() {
        $(".app-search").toggle(200);
        $(".app-search input").focus();
    });

    // ============================================================== 
    // Resize all elements
    // ============================================================== 
    $("body, .page-wrapper").trigger("resize");
    $(".page-wrapper").delay(20).show();
    
    //****************************
    /* This is for the mini-sidebar if width is less then 1170*/
    //**************************** 
    var setsidebartype = function() {
        var width = (window.innerWidth > 0) ? window.innerWidth : this.screen.width;
        if (width < 1170) {
            $("#main-wrapper").attr("data-sidebartype", "mini-sidebar");
        } else {
            $("#main-wrapper").attr("data-sidebartype", "full");
        }
    };
    $(window).ready(setsidebartype);
    $(window).on("resize", setsidebartype);

});

function myFunction() {
  // Declare variables
  var input, filter, ul, li, a, i, txtValue;
  input = document.getElementById('myInput');
  filter = input.value.toUpperCase();
  ul = document.getElementById("myUL");
  li = ul.getElementsByTagName('li');

  // Loop through all list items, and hide those who don't match the search query
  for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("a")[0];
    txtValue = a.textContent || a.innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
  if(filter==""){
    for (i = 0; i < li.length; i++) {
  		li[i].style.display = "none";
  	}
  }
}

$(document).ready(function(){
    $("#searchUserButton").click(function(){

    	email = $("#searchUser").val();
    	
    	$.ajax({
		     type: "POST",
		     url: "/searchUser",
		     data: { email : email },
		     success: function(response){
	        
	         var obj = JSON.parse(response);
	         console.log(obj)
	         if(obj){
	         	$(".participantList").append('<div class="alert alert-success"  role="alert">' + email + '</div>');
	         	$("#searchUser").val("");
	         }else{
	         	
	         }
	        }
		})
    })
    
    // PROCEDIMIENTO PARA CLIENTE 
    
    
     $("#searchClientButton").click(function(){

    	email = $("#searchClientInput").val();
    	
    	$.ajax({
		     type: "POST",
		     url: "/searchUserClient",
		     data: { email : email },
		     success: function(response){
	        
	         var obj = JSON.parse(response);
	         console.log(obj)
	         if(obj){
	         	$(".clientList").append('<div class="alert alert-info"  role="alert">' + email + '</div>');
	         	$("#searchClientInput").val("");	
	         }else{
	         	
	         }
	        }
		})
    })
    
    $("#createProject").click(function(){
    	if($("#projectName").val()==""){
    		$("#projectName").focus();
    		return false;
		}
		if($("#projectDescription").val()==""){
    		$("#projectDescription").focus();
    		return false;
		}
    	
    })

})