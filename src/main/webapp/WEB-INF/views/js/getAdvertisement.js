
  
  var container=$('.footer');

        container.append(


            '<div >'
            + '<span> <button id="inside_ads" type="button" value="200" data-toggle="modal" data-target="#dialog2" style="width: 100px;height: 50px;"'
            + 'onclick="allowClose()">顯示廣告 </button></span>'
            + '<span><button  type="button" style="width: 100px;height: 50px;" id="pop_btn">彈出視窗</button> </span></div>'
            + '<div class="modal fade" id="dialog2" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false" style="width:100%">'
            + '<div class="modal-dialog" role="document" style="width:100%">'
            + '<div class="modal-content" style="width:100%">'
            + '<div class="modal-header">'
            + '<span> <h5 class="modal-title" id="modalTitle"></h5></span>'
            + '<span id="adText"><fieldset></fieldset></span>'

            + '</div style="text-align:center"> <div class="modal-body" id="ads_content"> </div>'



            + '<div class="modal-footer">'
            + '<button id="close_btn" type="button" style="width: 100px;display: none;" class="btn btn-secondary"  data-dismiss="modal">Close</button>'

            + '</div>'
            + '</div>'
            + '</div>'

            + '</div>'
        );


        //廣告相關設定
        var idle = false;
        var ads_content = document.getElementById('ads_content');
        var ads_title=document.getElementById('modalTitle');
        var forceTime = 3;//強迫無法關閉時間     
        var Timer = null;

        //調整閒置時間
        ifvisible.setIdleDuration(600);
        ifvisible.on("idle", function () {

            if (idle == false) {
                idle = true;
                console.log("idle");
                //彈跳視窗通常會被瀏覽器阻擋,特別注意
                $("#inside_ads").click();


            }

        });


        $('#close_btn').click(function () {

            idle = false;
            ads_content.innerHTML = "";
            ads_title.innerHTML="";
            //暫無其他設定           

        })

        $('#pop_btn').click(function () {


            window.open("https://www.mynewcal.com/products/secret01-3-1?gclid=Cj0KCQiA0fr_BRDaARIsAABw4EvYsm5tg2QtY6lfCdSzsFusXjm4FzPgB-osKCZxknLDtmGYsqd78OAaAgFIEALw_wcB&variation=5efdcf7360a580000a50be63", "popup", "width=auto,height=auto,toolbar=no,status=no,resizable=1");


        });

        function ss() {

            if (forceTime > 0) {
                forceTime--;
                console.log('remain:'+forceTime);
                
               $('#adText').text("再" + forceTime + "秒後可關閉廣告");

            } else {
          
                window.clearInterval(textTimer);

            }

        }

        function allowClose() {



//            forceTime = 3;

            console.log("allow close");
            //按鈕隱藏
            $('#close_btn').css('display', 'none');


            //廣告內容

            $.ajax({

                
                async: false,
                type: "get",
                url: "http://localhost:8080/AYCB_final/getOneAd",
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (data) {
                	
                
                	forceTime=data.advlength;
                	console.log("forceTime="+forceTime);
                	console.log("廣告時間:"+data.advlength);
                   
                    console.log("ad=" + data.source);
				
                    ads_content.innerHTML = data.source;
                    ads_title.innerHTML=data.advtitle;
                    

                },
                error: function () {
                    alert("取得廣告失敗");
                }

            });



            $('#adText').text("再" + forceTime + "秒後可關閉廣告");

            textTimer = setInterval(ss, 1000);

            window.setTimeout(function () {

                $('#close_btn').css('display', 'block');
                $('#adText').text("可關閉廣告");
                window.clearInterval(textTimer);

            }, forceTime*1000);


        }