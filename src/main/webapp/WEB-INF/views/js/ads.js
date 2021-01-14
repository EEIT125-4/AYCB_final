

        var remainTime = 5;//閒置時間,原則上時間內有動作應重製
        var fourceTime = 3;//強迫無法關閉時間
        var text = document.getElementById('count');
        var ads = document.getElementById('ads');

        var Timer = null;
        Timer = setInterval(countDown, 1000);


        function countDown() {
            remainTime--;
            text.innerText = text.innerText.substring(0, text.innerText.length - 1) + remainTime;

        }

        //window.setInterval(function () { remainTime--; text.innerText = text.innerText.substring(0, text.innerText.length - 1) + remainTime }, 1000);

        function stopf() {
            alert("停止");
            window.clearTimeout(t);//-停止計時器  


        }

        function ss(){

            if (fourceTime > 0) {
                fourceTime--;
                    $('#adText').text("再" + fourceTime + "秒後可關閉廣告");
                        
                     }else{
                         console.log("fourceTime:"+fourceTime);
                        
                     }

        }

        function allowClose() {
            fourceTime = 3;
    
            console.log("allow close");
            $('#close_btn').css('display', 'none');

            
            $('#adText').text("再" + fourceTime + "秒後可關閉廣告");    
            
            textTimer = setInterval(ss, 1000);

            window.setTimeout(function () {

                $('#close_btn').css('display', 'block');
                $('#adText').text("可關閉廣告");
                window.clearInterval(textTimer);

            }, 3000);


        }


        //轉向連結到 http://taipei.iiiedu.org.tw
        //slide113,location.href-轉向連結到其它網址
        function f() {

            ads.style.display = "block";
            window.clearInterval(Timer);

        }
        let t = window.setTimeout(f, 5000);
        window.setInterval(Timer);


