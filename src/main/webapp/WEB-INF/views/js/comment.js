var board=document.getElementById("board");

$(document).ready(function() {
    $("#postComment").click(function() { 
    console.log("post btn click");
        $.ajax({
            type: "POST", //傳送方式
            url: postUrl, //傳送目的地
            dataType: "json", //資料格式
            data: { //傳送資料
                comment: $("#comment").val() 
              
            },
            success: function(data) {
            	$("#commentform")[0].reset();
                if (data) {
                	
                	swal("留言成功!","","success");
                	refresh();
                	
                } else { 
                	swal("留言失敗!","","error");
                	
                }
            },
            error: function(data) {
            	swal("留言失敗!","","error");
              
            }
        })
    })        
});

function formatTimeStamp(time){
	   var time = new Date(time);
	   var date = (
			   	   (time.getFullYear())  + "-" +
	               (time.getMonth() + 1) + "-" +
	               (time.getDate()) + " " +
	               (time.getHours()) + ":" +
	               (time.getMinutes())
// 	               + ":" +(time.getSeconds())
	              );
	   return date;
	}

function refresh(){
	
	 $.ajax({
         type: "POST", 
         url:getUrl, 
         dataType: "json",


         success: function(data) {
         	
        	 console.log("取得留言!");
        	 console.log(data);  
        	 $('#board').empty();
        	 for(let i=0;i<data.length;i++){
        		 
        		 $('#board').append(
        					        	
						
        		 
        		 "<div class='leavecomment'>"
			     
			     +  "<div class='picform'>"

			     +  "<img class='headpic' src="+path+"/pic/"+data[i].member.iconid
			     +" alt='Image placeholder'>"
			     +"</div>"
			      +"<div>"
			       +"<h3>"+data[i].member.name+"</h3>"
			                +"<div class='commentdate'>"+formatTimeStamp(data[i].commentTime)+"</div>"
			                +"<p>"+data[i].contentBox+"</p>"
			               +"<p><a href='#' class='reply'>回覆</a></p>"
			            +"</div>"
			      
			    +"</div>"
			    +"<br>"
			    );
	 
        	 }
        	 
         
         },
         error: function(data) {
        	 console.log("取得失敗!");
           
         }
     })
	
}
refresh();