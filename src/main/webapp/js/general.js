$(function(){
	$(':input').attr('autocomplete','off');
	//卡片式div
	/*$(".card").mouseover(function(){
		$(this).css("box-shadow","0 6px 10px 0 rgba(255, 204, 102, 1.0), 0 8px 25px 0 rgba(255, 204, 102, 1.0)");
	});
	$(".card").mouseout(function(){
		$(this).css("box-shadow","0 6px 10px 0 rgba(0, 0, 0, 0.2), 0 8px 25px 0 rgba(0, 0, 0, 0.19)");
	});*/
});



function dformat(str){
	var odate = new Date(str);
	var oYear = odate.getFullYear();
	var oMonth = odate.getMonth()+1;
	var oDay = odate.getDate();
	return oYear + "-" + getzf(oMonth) + "-" + getzf(oDay);
}
function getzf(num){    
    if(parseInt(num) < 10){    
        num = '0'+num;    
    }
    return num;
}