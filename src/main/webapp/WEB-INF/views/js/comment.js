var board = document.getElementById("board");
var commentCount = 0;

       function checkLogin(){
       console.log("判斷是否登入");
		let login=false;	

            $.ajax({
            async : false,
			type: "POST", //傳送方式
			url:path+"/loginCheck", //傳送目的地
			dataType: "json", //資料格式
		
			success: function(data) {
				
				if (data) {

//					alert("已登入");
					login=true;	
				


				} else {
//					alert("未登入");
					login=false;	
					
				}
				
			},error:function(){
                alert("請求失敗");
               	login=false;
            }


        });
        console.log('執行結束');
        return login;
       
    }

function postJudgment(obj) {
 // var comment=target.parent().siblings("textarea[class='comment']");
      
            console.log('判斷長度:' + obj.val().length);
            if (obj.val().length > 0) {

                //let postBtn=target.

                $('.postComment').attr('disabled', false);

                resetComment($(this).siblings('restBtn'));

            } else {

                $('.postComment').attr('disabled', true);


            }

	}
	
function showBtnArea(obj) {

	   obj.css('display', 'block');


}

function resetComment(obj) {
 			obj.siblings(".postComment").attr('disabled',true);    
            obj.parent().css('display', 'none');
            obj.siblings().parent().siblings("textarea[class='comment']").val('');
            obj.siblings().parent().siblings("textarea[class='comment']").css('display','none');

}

 //Kevin:根據留言內容調整大小
     $("textarea.comment").css("overflow", "hidden").bind("keydown keyup", function () 
     { $(this).height('0px').height($(this).prop("scrollHeight") + 'px');
     	console.log('textarea調整大小');
     
     }).keydown();

		//動態設定留言欄位獲得焦點事件
        $(document).on('focus','.comment',function(){
            console.log('動態留言列取得焦點')
            // $(this).css('background', 'red');
            // $(this).siblings('.btnarea').children("button[class='resetBtn']").css('background','blue');
            showBtnArea($(this).siblings("div[class='btnarea']"));


        }) ;  
        
        //動態設定取消按鍵

         $(document).on('click','.resetBtn',function(){
                console.log('按下取消');
                
                resetComment($(this));
            });
            
        //動態設定留言欄位文字改變事件
      
            $(document).on('change','.comment',function(){
                console.log('文字改變判斷');
                postJudgment($(this));

            });    
		
		
		//動態設定留言欄位失去焦點事件
		
//		   $(document).on('blur','.comment',function(){
//           
//            //$(this).css('background', '');
//
//            resetComment( $(this).siblings('.btnarea').children("button[class='resetBtn']"));           
//
//        });
		

            
             $('.resetBtn').click(function () {
                let obj=$(this);
                resetComment(obj);}); 
                
                //動態綁定顯示   
                
                 $(document).on('click','.checkReply',function () {
                 if($(this).val()==0){
                  	
                  	$(this).parent().siblings("div[class='replyarea']").css('display','block');
                
                	$(this).text('隱藏回覆');
                	
                	$(this).val(1);
                 
                 }else{
                 
                 	$(this).parent().siblings("div[class='replyarea']").css('display','none');
                
                	$(this).text('顯示回覆');
                 
                 	$(this).val(0);
                 }
                 
               

            });
                
            
//             $('.checkReply').click(function () {
//
//                $(this).css('color', 'red');
//
//            });
                 
     //動態綁定顯示留言區
     $(document).on('click','.sendReply',function(){
     
     console.log('顯示留言區');
     
     $(this).parent().siblings().children('textarea[class="comment"]').css('display', 'block');
     
     	
     
     
     
     
     });            
                 
    //動態綁定送出留言事件      
		$(document).on('click','.postComment',function(){
		
		
		console.log('送出留言動態綁定');
		let comment=$(this).parent().siblings("textarea[class='comment']");
		console.log("comment="+comment.val());
		let postUrl=$(this).val();
		console.log('請求路徑:'+postUrl);
		let check=checkLogin();
		console.log("login狀態:"+check);
		if(check){
		console.log("login");
		
		
		$.ajax({
				
				type: "POST", //傳送方式
				url: postUrl, //傳送目的地
				dataType: "json", //資料格式
				data: { //傳送資料
					comment: comment.val()
	
				},
				success: function(data) {
					comment.val('');
					if (data) {
					
					swal.fire({
	      		      				  title: "success",
	      		      				  text: "留言成功!",
	      		      				  icon: "success",
	      		      				  button: "OK",
	      		      				});
	      		      				
					
					
					
						resetComment($(this).siblings('restBtn'));
						refresh();
	
					} else {
							swal.fire({
	      		    				  title:'fail',
	      		    				  text: "留言失敗!",
	      		    				  icon: "error",
	      		    				  button: "OK",
	      		    				}); 
	
					}
				},
				error: function(data) {
					alert("server發生錯誤");
	
	
				}
			});
			}else{
				console.log("not login");
			
			alert("請先登入");
			
			
			
			}
		
		
		});
	//
		




function formatTimeStamp(time) {
	var time = new Date(time);
	var date = (
		(time.getFullYear()) + "-" +
		(time.getMonth() + 1) + "-" +
		(time.getDate()) + " " +
		(time.getHours()) + ":" +
		(time.getMinutes())
		// 	               + ":" +(time.getSeconds())
	);
	return date;
}

function refresh() {

	 $.ajax({
            type: "POST",
            url: getUrl,
            dataType: "json",


            success: function (data) {
				
                console.log("取得留言!");
                console.log(data);
                commentCount = data.comments.length;
                let replyContent="";
                
                $('#commentCount').text(commentCount + '則留言');
                $('#board').empty();
                for (let i = 0; i < data.comments.length; i++) {
                
                //因為append必須一次性加入所有成對標籤,不得已將回覆內容先存起來
                   replyContent="";
                   let replyNum=0;
                   if(data.replys!=null){
                   for (let j = 0; j < data.replys.length; j++) {
                   		if (data.replys[j].keynumber == data.comments[i].commentId) {
                    	console.log("reply=" + data.replys[j].contentBox);
                    	replyNum+=1;
                   		replyContent+=
                   		"<div class='replyarea' style='background:lightgray;display: none'>"
                   		+"<div class='picform'>"
                   		+"<img class='headpic' src=" + path + "/pic/" + data.replys[j].member.iconid+"></div>"
                   		+ "<h5>" + data.replys[j].member.name + "</h5>"
                        + "<div class='commentdate'>" + formatTimeStamp(data.replys[j].commentTime) + "</div>"
                   		 + "<p>"+data.replys[j].contentBox + "</p></div>";
                   		}
                   		}
                    	
                 
                    }

                    $('#board').append(

                        "<div class='leavecomment'>"

                        + "<div class='picform'>"

                        + "<img class='headpic' src=" + path + "/pic/" + data.comments[i].member.iconid
                        + " alt=''>"
                        + "</div>"
                        + "<div>"
                        + "<h5>" + data.comments[i].member.name + "</h5>"
                        + "<div class='commentdate'>" + formatTimeStamp(data.comments[i].commentTime) + "</div>"
                        + "<p class='content2'>"+data.comments[i].contentBox+"</p>"
                        + "<p>"
                        +"<button type='button' style='width:auto;margin: 5px;margin-left:50%;background-color:#EBD3E8;color:#8F4586;border:none;' class='sendReply btn btn-secondary'>回覆</button>"
                        +"<button type='button' style='width:auto;margin: 5px;background-color:#EBD3E8;color:#8F4586;border:none;' class='checkReply btn btn-secondary' value='0'>查看"+replyNum+"則回覆</button>"
                        +"</p>"
                        +"<div>"
						+"<textarea class='comment' placeholder='新增公開留言' cols='100' style='resize: none;display: none;'></textarea>"
						+"<div class='btnarea' style='margin-left: 50%; display: none;'>"
						+"<button class='resetBtn' type='button' style='width: auto'>取消</button>"
						+"<button class='postComment' type='button' value="+ path +"/leaveComment?key="+ data.comments[i].commentId+"&type=comment style='width: auto' disabled>留言</button>"
						+"</div></div>"
                        + "<p></p>"
                        +replyContent
                        +"</div></div>"
                        );
                        console.log("value="+ path +"/leaveComment?key="+ data.comments[i].commentId+"&type=comment");

                }
				
            },
			
            error: function (data) {
                console.log("取得失敗!");

            }
			
        });
        }
        
refresh();