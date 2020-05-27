var sideBar = document.getElementById("menu");
 
	$(".btn").click(function() {
	  //alert("open");
 
		      sideBar.style.opacity = 1;
			  $("#menu,.page_cover,html").addClass("open");
	  window.location.hash = "#open";
	});

	window.onhashchange = function() {
      //alert("close");
     
	  if (location.hash != "#open") {
	    $("#menu,.page_cover,html").removeClass("open");

		  sideBar.style.opacity = 0;

		  // 바깥색(#f3f4fe)과 동일하게 하다가, 사이드바가 열렸을때는 지정한 색(white)으로 바꿈
	  }
	};