

//next pic
//检测表单
function formCheck(form)
{

	
    var topic = $("#subject").val();

    var message = $("#message").val();
    var email = $("#email").val();
    var cansubmit = [];
    var safesubmit = true;
            
    if(topic=="")
    {
        $('#topicinfo').parent().css({'background':'#FEF1EF','border':'1px solid #FCC4C7'});
        $('#topicinfo').css({'border':'1px solid red'});
        $('#topicinfo').show();
        cansubmit["topic"] = false;
    }
    else
    {
        cansubmit["topic"] = true;
    }
         
      
	

    if(message.length >3000 || message.length <20)
    {
        $('#messageinfo').parent().css({'background':'#FEF1EF','border':'1px solid #FCC4C7'});
        $('#messageinfo').css({'border':'1px solid red'});
        $('#messageinfo').show();
        cansubmit["message"] = false;
    }
    else
    {
        cansubmit["message"] = true;
    }
          
    if (email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1)
    {
        $('#emailinfo').parent().css({'background':'#FEF1EF','border':'1px solid #FCC4C7'});
        $('#emailinfo').css({'border':'1px solid red'});
        $('#emailinfo').show();
        cansubmit["email"] = false;
    }
    else
    {
        cansubmit["email"] = true;
    }
    //$('#countrycode').value=document.getElementById("country").countrynum;
    //alert(document.getElementById("country").countrynum);
    cansubmit["code"] = true;
    for(var can in cansubmit)
    {
        if(cansubmit[can]==false)
        {
            safesubmit = false;
        }
    }
    if(safesubmit){
        document.inquiry.action="/sendinquiry.html";
        document.inquiry.submit();
        return false;
    }else{
        return false;
    }
}


//js提交
function jsSubmit(content)
{
    var keyword = content.search.value;
    if(keyword==""){
        alert("keyword not be empty!");
    }else {
        this.content.submit();
    }
}
function change_img_up(img,count,comefrom,themes){
    if(comefrom=='PL'){
        datas = dataPL;
        descs = descPL;
        titles = titlePL;
        img_pos = img_pospl;
    }else if(comefrom=='OEM'){
        datas = dataOEM;
        descs = descOEM;
        titles = titleOEM;
        img_pos = img_posoem;
    }else if(comefrom=='RD') {
        datas = dataRD;
        descs = descRD;
        titles = titleRD;
        img_pos = img_posrd;
    }
    if(img_pos+1>=count){
        img_pos = count-1;
    }else{
	img.src = 'resources/img/waiting_small2.gif';
	var imgsrc = datas[img_pos+1 % datas.length];
            var loadimage = new Image();
            loadimage.src = imgsrc;
            loadimage.onload = function(){
                img.src = imgsrc;
	};
	document.getElementById('countNum'+comefrom).innerHTML=img_pos+2+'/'+datas.length;
        document.getElementById('pic'+comefrom).innerHTML=descs[img_pos+1 % descs.length];
        document.getElementById('title'+comefrom).innerHTML=titles[img_pos+1 % titles.length];
        img_pos++;
    }
    if(comefrom=='PL'){
        img_pospl = img_pos;
    }else if(comefrom=='OEM'){
        img_posoem = img_pos;
    }else if(comefrom=='RD') {
        img_posrd = img_pos;
    }

}
function change_img_down(img,comefrom,themes){
    if(comefrom=='PL'){
        datas = dataPL;
        descs = descPL;
        titles = titlePL;
        img_pos = img_pospl;
    }else if(comefrom=='OEM'){
        datas = dataOEM;
        descs = descOEM;
        titles = titleOEM;
        img_pos = img_posoem;
    }else if(comefrom=='RD') {
        dataRD = dataRD;
        descs = descRD;
        titles = titleRD;
        img_pos = img_posrd;
    }
    if(img_pos-1<0){
        img_pos = 0;
    }else{
            img.src = 'resources/img/waiting_small2.gif';
	    var imgsrc = datas[img_pos-1 % datas.length];
            var loadimage = new Image();
            loadimage.src = imgsrc;
            loadimage.onload = function(){
                img.src = imgsrc;
        };
        document.getElementById('countNum'+comefrom).innerHTML=img_pos+'/'+datas.length;
        document.getElementById('pic'+comefrom).innerHTML=descs[img_pos-1 % descs.length];
        document.getElementById('title'+comefrom).innerHTML=titles[img_pos-1 % titles.length];
        img_pos--;
    }
    if(comefrom=='PL'){
        img_pospl = img_pos;
    }else if(comefrom=='OEM'){
        img_posoem = img_pos;
    }else if(comefrom=='RD') {
        img_posrd = img_pos;
    }
}


function getFlashMovieObject(movieName)
{
    if (window.document[movieName])
    {
        return window.document[movieName];
    }
    if (navigator.appName.indexOf("Microsoft Internet")==-1)
    {
        if (document.embeds && document.embeds[movieName])
            return document.embeds[movieName];
    }
    else // if (navigator.appName.indexOf("Microsoft Internet")!=-1)
    {
        return document.getElementById(movieName);
    }
}
function changeflash(prodname,putid){
    getFlashMovieObject("indexflash").gotoprod(putid);
    prodname.className = "cur f";
}
function changeclass(prodname){
    prodname.className="b";
}
function changeAction(formname,url){
    formname.action = url;
//    formname.form.submit();
}
function checknum(obj,num,spanid){
  maxLength = obj.getAttribute("maxlength");
  if(maxLength && obj.value.length > maxLength){
    obj.value = obj.value.substr(0,maxLength);
  }else{
    obj.value = obj.value.substr(0,num);
  }
  document.getElementById(spanid).innerHTML = obj.value.length;
}

function inquiry_submit(pid){
    $('#p'+pid).submit();
    return false;
}