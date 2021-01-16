$(function(){
$("#nameb").click(function(){
    $("#brand").slideToggle("slow");
	$("#series").hide();
	$("#cate").hide();
  });
});

$(function(){
$("#names").click(function(){
    $("#series").slideToggle("slow");
	$("#brand").hide();
	$("#cate").hide();
  });
});

$(function(){
$("#namec").click(function(){
    $("#cate").slideToggle("slow");
	$("#brand").hide();
	$("#series").hide();
  });
});
