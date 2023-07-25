  $( document ).ready(function() {

      var  tt=$("#trangthai").val();
      if(tt=="0"){
  var submitUrl = $("#submitUrl").val();

   
   $.ajax({
      type: "GET",
      url:submitUrl  
  }); 
    
      }
});
