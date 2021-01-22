var oTimerId;
function TimeOut() {

	clearTimeout(oTimerId);
	
    alert('閒置時間過長,請重新登入');
    location.href='http://localhost:8080/AYCB_final/logout';
	


}

function ReCalculate(){

//	var login= <%=(session.getAttribute("member")!=null)?true:false %>;
	
	var memberid=$("#memberid").val();
//	console.log('重新計算判斷:memberid'+memberid);
	if(memberid!=null && memberid>0){	
   
    clearTimeout(oTimerId);
    oTimerId = window.setTimeout('TimeOut()', 10 * 60 * 1000);
    }	
}

 document.onmousedown = ReCalculate;

 document.onmousemove = ReCalculate;
 document.keydown=ReCalculate;
 document.keyup=ReCalculate;

 ReCalculate();