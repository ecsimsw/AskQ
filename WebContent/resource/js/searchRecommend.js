function recommend() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  ul = document.getElementById("myUL");
  li = ul.getElementsByTagName("li");
  if(filter==''){
	  for (i = 0; i < li.length; i++) {
		      li[i].style.display = "none";
      }
  }
  else{
	  for (i = 0; i < li.length; i++) {
	    txtValue = li[i].textContent;
	    if (txtValue.toUpperCase().indexOf(filter) == 0) {
	      li[i].style.display = "block";
	     //display : none , block 
	     
	    } else {
	      li[i].style.display = "none";
	    }
	  }
  }
}