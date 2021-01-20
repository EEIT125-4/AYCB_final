var board = document.getElementById("board");
var commentCount = 0;

       function checkLogin(){


            $.ajax({
			type: "POST", //傳送方式
			url:path+"/loginCheck", //傳送目的地
			dataType: "json", //資料格式
		
			success: function(data) {
				
				if (data) {

					alert("已登入");


				} else {
					alert("未登入");


				}
			},error:function(){
                alert("請求失敗");
            }


        });
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

}

 //Kevin:根據留言內容調整大小
     $("textarea.comment").css("overflow", "hidden").bind("keydown keyup", function () 
     { $(this).height('0px').height($(this).prop("scrollHeight") + 'px');}).keydown();

		$('.comment').focus(function () {
   				console.log('Comment focus');
                
                let obj=$(this).siblings("div[class='btnarea']");
                showBtnArea(obj);

            });
            
         $('.comment').change(function () {

                postJudgment($(this));

            });
            
            $('.postComment').click(function () {

                console.log("click post");
                resetComment( $(this).siblings("restBtn"));
               
            });
            
            
             $('.resetBtn').click(function () {
                let obj=$(this);
                resetComment(obj);});    
            
             $('.checkReply').click(function () {

                $(this).css('color', 'red');

            });
            
          
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
				$("#comment").val('');
				if (data) {

					alert("留言成功");
					resetComment();


					refresh();

				} else {
					alert("留言失敗");


				}
			},
			error: function(data) {
				alert("server發生錯誤");


			}
		})
	})
});

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
                   if(data.replys!=null){
                   for (let j = 0; j < data.replys.length; j++) {
                   		if (data.replys[j].keynumber == data.comments[i].commentId) {
                    	console.log("reply=" + data.replys[j].contentBox);
                   		replyContent+=
                   		"<p>"
                   		+"<div class='picform'>"
                   		+"<img class='headpic' src=" + path + "/pic/" + data.replys[j].member.iconid+"></div>"
                   		+ "<h5>" + data.comments[i].member.name + "</h5>"
                        + "<div class='commentdate'>" + formatTimeStamp(data.replys[j].commentTime) + "</div>"
                   		 + "<p>"+data.replys[j].contentBox + "</p></p>";
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
                        + "<p>"+data.comments[i].contentBox+"</p>"
                        + "<p><button type='button' style='width:auto' onclick='checkLogin();'>回覆</button></p>"
                        +"<div>"
						+"<textarea class='comment' placeholder='新增公開留言' cols='100' style='resize: none;'></textarea>"
						+"<div class='btnarea' style='margin-left: 50%; display: none;'>"
						+"<button class='resetBtn' type='button' style='width: auto'>取消</button>"
						+"<button class='postComment' type='button' style='width: auto' disabled>留言</button>"
						+"</div></div>"
                        + "<p><button type='button' style='width:auto' value=" + data.comments[i].commentId + " onclick='checkReply(this)'>查看回覆</button></p>"
                        +replyContent
                        +"</div></div>"
                        );

                }
				
            },
			
            error: function (data) {
                console.log("取得失敗!");

            }
			
        });
        }
        
refresh();