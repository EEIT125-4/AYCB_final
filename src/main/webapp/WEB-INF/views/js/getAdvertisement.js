
  
  var container=$('.footer');

        container.append(


            '<div>'
            + '<span> <button id="inside_ads" type="button" value="200" data-toggle="modal" data-target="#dialog2" style="width: 100px;height: 50px;"'
            + 'onclick="allowClose()">顯示廣告 </button></span>'
            + '<span><button  type="button" style="width: 100px;height: 50px;" id="pop_btn">彈出視窗</button> </span></div>'
            + '<div class="modal fade" id="dialog2" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">'
            + '<div class="modal-dialog" role="document">'
            + '<div class="modal-content">'
            + '<div class="modal-header">'
            + '<span> <h5 class="modal-title" id="modalTitle">廣告TITLE</h5></span>'
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
        var fourceTime = 3;//強迫無法關閉時間     
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
            //暫無其他設定           

        })

        $('#pop_btn').click(function () {


            window.open("https://www.mynewcal.com/products/secret01-3-1?gclid=Cj0KCQiA0fr_BRDaARIsAABw4EvYsm5tg2QtY6lfCdSzsFusXjm4FzPgB-osKCZxknLDtmGYsqd78OAaAgFIEALw_wcB&variation=5efdcf7360a580000a50be63", "popup", "width=600,height=200,toolbar=no,status=no,resizable=1");


        });

        function ss() {

            if (fourceTime > 0) {
                fourceTime--;
                $('#adText').text("再" + fourceTime + "秒後可關閉廣告");

            } else {
                console.log("fourceTime:" + fourceTime);
                window.clearInterval(textTimer);

            }

        }

        function allowClose() {



            fourceTime = 3;

            console.log("allow close");
            //按鈕隱藏
            $('#close_btn').css('display', 'none');


            //廣告內容

            $.ajax({

                //Kevin:這裡是額外的廣告資源,不需馬上載入故使用非同步	
                async: true,
                type: "get",
                url: "http://localhost:8080/AYCB_final/getOneAd",
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (data) {
                    console.log("ad=" + data.source);

                    ads_content.innerHTML = data.source;


                },
                error: function () {
                    alert("取得廣告失敗");
                }

            })



            $('#adText').text("再" + fourceTime + "秒後可關閉廣告");

            textTimer = setInterval(ss, 1000);

            window.setTimeout(function () {

                $('#close_btn').css('display', 'block');
                $('#adText').text("可關閉廣告");
                window.clearInterval(textTimer);

            }, 3000);


        }