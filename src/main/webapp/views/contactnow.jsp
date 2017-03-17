<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Request A Quote</title>
    <link type="text/css" rel="stylesheet" href="resources/css/inquiry.css" media="all" />
    <link type="text/css" rel="stylesheet" href="resources/css/inquiry/basic.css" media="all" />
    <link type="text/css" rel="stylesheet" href="resources/css/inquiry/layout.css" media="all" />
    <link type="text/css" rel="stylesheet" href="resources/css/inquiry/qr.css" media="all" />
    <link type="text/css" rel="stylesheet" href="resources/css/inquiry/style.css" media="all" />
    <script type="text/javascript" src="resources/js/jquery.js"></script>
    <script type="text/javascript" src="resources/js/tinyeditor.js"></script>
    <script type="text/javascript" src="resources/plugins/jsrender/jsrender.min.js"></script>
    <script type="text/javascript" src="resources/js/contactnow.js"></script>
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        var tips = 'Forthebestresults,werecommendincludingthefollowingdetails:-Selfintroduction-Requiredspecifications-Inquireaboutprice/MOQ';
        var sourceTips = '<div style=\" color: #666666;font-size: 11px;left: 20px;line-height: 22px;font-family:Verdana,Arial;\"><div>For the best results, we recommend including the following details:</div><ul style=\"list-style: none outside none;margin:0;padding:0;text-indent: 5px;\"><li>-Self introduction</li><li>-Required specifications</li><li>-Inquire about price/MOQ</li></ul></div>';

        function dealStr(str){
            str = str.replace(/<\/?.+?>/g,"");
            str = str.replace(/(^\s+)|(\s+$)/g,"");
            str = str.replace(/\s/g,"");
            return str;
        }
        function focusfunc(){
            instance.post();
            var message = $("#message").val();
            message = dealStr(message);
            if(message == tips){
                document.getElementById("myframe").contentWindow.document.getElementById('editor').innerHTML = '';
            }
        }
        function blurfunc(){
            instance.post();
            var message = $("#message").val();
            if(message.length < 20 || message.length > 3000){
                $('#message_tips').css({'background':'none repeat scroll 0 0 #F3FCFE','border':'1px solid #87D2E3'});
                $('#messageerror').show();
            }else{
                $('#message_tips').css({'background':'none repeat scroll 0 0 #F5F8FD','border':'0px solid'});
                $('#messageerror').hide();
            }
            message = dealStr(message);
            if(message == ''){
                document.getElementById("myframe").contentWindow.document.getElementById('editor').innerHTML = sourceTips;
            }
        }
        window.onload = function(){
            var ifr = document.getElementById("myframe").contentWindow;
            if (window.attachEvent)
            {
                //IE 的事件代码
                ifr.attachEvent("onfocus",focusfunc);
                ifr.attachEvent("onblur",blurfunc);
            }
            else
            {
                //其它浏览器的事件代码
                ifr.addEventListener("focus", focusfunc, false);
                ifr.addEventListener("blur",blurfunc, false);
            }
        };
        function checknum(obj){
            instance.post();
            maxLength = obj.getAttribute("maxlength");
            if(maxLength && obj.value.length > maxLength){
                obj.value = obj.value.substr(0,maxLength);
            }
        }
        function showtable(tableid){
            var table = document.getElementById(tableid);
            document.getElementById('requestquote').value = 1;
            if(table.style.display == 'none'){
                table.style.display = 'block';
                document.getElementById('requestimg').src = 'resources/img/ico+.gif';
            }else{
                table.style.display = 'none';
                document.getElementById('requestimg').src = 'resources/img/ico-.gif';
            }
        }
        function showfiletable(tableid){
            var table = document.getElementById(tableid);
            if(table.style.display == 'none'){
                table.style.display = 'block';
                document.getElementById('requestfileimg').src = 'resources/img/ico+.gif';
            }else{
                table.style.display = 'none';
                document.getElementById('requestfileimg').src = 'resources/img/ico-.gif';
            }
        }

        function formCheck()
        {
            instance.post();
            var topic = $("#subject").val();
            var message = $("#message").val();
            message = dealStr(message);
            var email = $("#email").val();
            var cansubmit = [];
            var safesubmit = true;

            if(topic.length < 10 || topic.length > 255)
            {
                $('#subject').parent().css({'background':'none repeat scroll 0 0 #F3FCFE','border':'1px solid #87D2E3'});
                $('#topicerror').show();
                $('#subject_tr').show();
                cansubmit["topic"] = false;
            }
            else
            {
                cansubmit["topic"] = true;
            }
            if(message == tips){
                $('#message_tips').css({'background':'none repeat scroll 0 0 #F3FCFE','border':'1px solid #87D2E3'});
                $('#messageerror').show();
                cansubmit["message"] = false;
            }else{
                var message_len = message.length;
                if(message_len >3000 || message_len <20)
                {
                    $('#message_tips').css({'background':'none repeat scroll 0 0 #F3FCFE','border':'1px solid #87D2E3'});
                    $('#messageerror').show();
                    cansubmit["message"] = false;
                }
                else
                {
                    cansubmit["message"] = true;
                }
            }

            if (email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1)
            {
                $('#email').parent().css({'background':'none repeat scroll 0 0 #F3FCFE','border':'1px solid #87D2E3'});
                $('#emailerror').show();
                $('#email_tr').show();
                cansubmit["email"] = false;
            }
            else
            {
                cansubmit["email"] = true;
            }
            cansubmit["code"] = true;
            for(var can in cansubmit)
            {
                if(cansubmit[can]==false)
                {
                    safesubmit = false;
                }
            }
            if(document.getElementById('name').value == "First Name  Last Name"){
                document.getElementById('name').value = "";
            }
            if(document.getElementById('tel').value == "Area - Local Number - Ext"){
                document.getElementById('tel').value = '';
            }
            if(document.getElementById('fax').value == "Area - Local Number - Ext"){
                document.getElementById('fax').value = '';
            }
            if(document.getElementById('website').value == "http://"){
                document.getElementById('website').value = '';
            }
            if(safesubmit){
                return true;
            }else{
                return false;
            }
        }
        function showDiv(){
            document.getElementById("pro_div").style.visibility = "visible";
        }
        function hideDiv(){
            document.getElementById("pro_div").style.visibility = "hidden";
        }
        function pic_reset(drawImage,thumbs_size) {
            var max = thumbs_size.split(',');
            var fixwidth = max[0];
            var fixheight = max[1];
            w=drawImage.width;h=drawImage.height;
            hbak = h;
            if(w>fixwidth) { drawImage.width=fixwidth;drawImage.height=h/(w/fixwidth);hbak=drawImage.height;}
            if(hbak>fixheight) { drawImage.height=fixheight;drawImage.width=w/(h/fixheight);}
        }
        // 上传文件传大小检测
        function getFileSize(fileObj)
        {
            if (document.all) {
                window.oldOnError = window.onerror;
                window.onerror = function(err) {
                    if (err.indexOf('utomation') != -1) {
                        alert('No access to the file permissions.');
                        return true;
                    }
                    else
                        return false;
                };
                var fso = new ActiveXObject('Scripting.FileSystemObject');
                var file = fso.GetFile(fileName);
                window.onerror = window.oldOnError;
                var size = file.Size;
                if(size > 1048576){
                    alert("Large Image");
                }
            }else{
                var image=new Image();
                image.dynsrc=fileObj.value;
                var size = image.fileSize || fileObj.files[0].fileSize;
                if(size > 1048576){
                    alert("Large Image");
                }
            }
        }

        $(function(){
            $('#btn-email-submit').click(function() {
                if(formCheck()){
                    instance.post();
                    var message = $("#message").val();
                    var website = $('#website').val();
                    if (website == 'http://') website = '';
                    var formData = new FormData();
                    formData.append('sender',$('#email').val());
                    formData.append('subject',$('#subject').val());
                    formData.append('content',message);
                    formData.append('senderName',$('#gender').val() + ' ' + $('#name').val());
                    formData.append('senderCompany',$('#company').val());
                    formData.append('senderPhone',$('#tel').val());
                    formData.append('senderFax',$('#fax').val());
                    formData.append('website',website);
                    formData.append('senderCountry',$('#country').val());
                    formData.append('priceTerms',$('#priceTerms').val());
                    formData.append('payment',$('#payment').val());
                    formData.append('initialOrder',$('#initialOrder').val());
                    formData.append('sampleTerms',$('#sampleTerms').val());
                    formData.append('specification',$('#specification').is(':checked'));
                    formData.append('companyDescription',$('#companyDescription').is(':checked'));
                    formData.append('deliverTime',$('#deliverTime').is(':checked'));
                    formData.append('urgent',$('#urgent').is(':checked'));
                    formData.append('subscribed',$('#subscribed').is(':checked'));
                    var file1 = $('#file1').prop('files');
                    if(file1.length >0) formData.append('file',file1[0]);

                    var file2 = $('#file2').prop('files');
                    if(file2.length >0) formData.append('file',file2[0]);
                    var file3 = $('#file3').prop('files');
                    if(file3.length >0) formData.append('file',file3[0]);
                    $.ajax({
                        async : false,
                        url: 'emails',
                        type: 'POST',
                        cache: false,
                        data: formData,
                        processData: false,
                        contentType: false,
                        dataType : 'json',
                        success : function (res) {
                            if (res.success) {
                                alert(res.message);
                            }
                        }
                    });
                } else {

                }
            });
        });
    </script>
</head>
<body>
<div class="f-header">
    <div class="top">
        <table style="width:100%" cellpadding="0" cellpadding="0">
            <tr>
                <td style="width:1%;padding:0; padding-right:10px;" valign="top">
                    <a href="index">
                        <img onload="pic_reset(this,'220,60')" src="resources/img/logo.gif"/>
                    </a>
                </td>
                <td style="width:99%;" valign="top">
                    <div class="top_rightA">Shenzhen Baoan District Xixiang Jingli Plastic Products Factory，</div>
                    <div class="top_rightB">
                        <div class="fontSize fl">Verified Suppliers<span><img src="resources/img/landingpage_16.gif" /><img src="resources/img/landingpage_16.gif" /><img src="resources/img/landingpage_16.gif" /><img src="resources/img/landingpage_16.gif" /><img src="resources/img/landingpage_16.gif" /><img src="resources/img/landingpage_16.gif" /></span></div>
                        <div class="inco fr hl_8">
                            <div class="cb"></div>
                        </div>
                        <div class="cb"></div>
                    </div>
                </td>
            </tr>
        </table>
        <div class="cb"></div>
    </div>
</div>
<form method="POST" name="inquiry" enctype="multipart/form-data">
    <input type="hidden" name="checkfrom" value="vpsinquiry"/>
    <div class="f-content">
        <div class="g_top"></div>
        <div class="g_mid">
            <table cellpadding="0" cellspacing="0" class="g_tab" >
                <tr>
                    <th valign="top" class="th_cs"><span class="qr_po">From:</span></th>
                    <td valign="top" style="padding-bottom: 8px; width: 620px;">
                        <input type="text" id="email" name="email" class="inquiry-text" style="width: 200px; float: left;" maxlength="128" onblur="if(this.value.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1){$('#email').parent().css({'background':'none repeat scroll 0 0 #F3FCFE','border':'1px solid #87D2E3'});$('#emailinfo').show();$('#emailerror').show();$('#email_tr').show();}else{$('#email').parent().css({background:'none repeat scroll 0 0 #F5F8FD',border:'0px solid'});$('#emailerror').hide();$('#email_tr').hide();}"/>
                        <div id="emailinfo" class="s">Enter your Email ID please.</div>
                        <div id="emailerror" class="error_cntr fl">Your email is incorrect!</div>
                    </td>
                    <td><span class="g_sta">Required Information</span></td>
                </tr>
                <tr>
                    <th valign="top" >To:</th>
                    <td colspan="2" valign="top" class="com_pro"  style="padding-bottom: 8px;">
                        <p>
                            <strong id="contactPerson">Mr. zeng</strong>
                            <span id="com-name">()</span>
                            <span>Last Login: 0 hours 25 minutes ago</span>
                        </p>
                    </td>
                </tr>
                <tr id="email_tr" style="height: 1px;width:100%;display:none;">
                    <td></td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <th class="th_cs" valign="top" ><span class="qr_po">Subject:</span></th>
                    <td colspan="2" valign="top"  style="padding-bottom: 8px;">
                        <input name="subject" id="subject" class="inquiry-text" style="width: 610px;" value="Please send me a quote!" onblur="if(this.value.length < 10 || this.value.length > 255){$('#subject').parent().css({'background':'none repeat scroll 0 0 #F3FCFE','border':'1px solid #87D2E3'});$('#topicerror').show();$('#subject_tr').show();}else{$('#subject').parent().css({background:'#F5F8FD',border:'0px solid'});$('#topicerror').hide();$('#subject_tr').hide();}">
                        <div id="topicerror" class="error_cntr"></div>
                    </td>
                </tr>
                <tr id="subject_tr" style="height: 1px;width:100%;display:none;">
                    <td></td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <th class="th_cs" valign="top" ><span class="qr_po">Message:</span></th>
                    <td colspan="2" id="message_tips" valign="top">
                        <textarea name="message" id="message"><div style=" color: #666666;font-size: 11px;left: 20px;line-height: 22px;font-family:Verdana,Arial;"><div>For the best results, we recommend including the following details:</div><ul style="list-style: none outside none;margin:0;padding:0;text-indent: 5px;"><li>-Self introduction</li><li>-Required specifications</li><li>-Inquire about price/MOQ</li></ul></div></textarea>
                        <script type="text/javascript">
                            var instance = new TINY.editor.edit('editor',{
                                id:'message',
                                width:780,
                                height:193,
                                cssclass:'te',
                                controlclass:'tecontrol',
                                rowclass:'teheader',
                                dividerclass:'tedivider',
                                controls:['bold','italic','underline','strikethrough','|','subscript','superscript','|',
                                    'orderedlist','unorderedlist','|','outdent','indent','|','leftalign',
                                    'centeralign','rightalign','blockjustify','|','unformat','|','undo','redo'],
                                footer:true,
                                fonts:['Verdana','Arial','Georgia','Trebuchet MS'],
                                xhtml:true,
                                bodyid:'editor',
                                footerclass:'tefooter',
                                toggle:{text:'source',activetext:'wysiwyg',cssclass:'toggle'},
                                resize:{cssclass:'resize'}
                            });
                        </script>
                        <div id="messageerror" class="error_cntr">Your message must be between 20-3,000 characters!</div>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td colspan="2" style="padding-top: 0">
                        <div class="g_show hl_12">
                            <a href="javascript:void(0);" onclick="showtable('request_table');">
                                <img id="requestimg" src="resources/img/ico-.gif" > Contact & Optional Details                  </a>
                        </div>
                        <table id="request_table" width="100%" cellspacing="0" style="background: #fff;display:none;" cellpadding="0" border="0">
                            <tbody>
                            <tr>
                                <th width="17%"  valign="top" scope="row" class="g_lab">
                                    <label > Name: </label>
                                </th>
                                <td width="83%">
                                    <select id="gender">
                                        <option value="Mr.">Mr.</option>
                                        <option value="Mrs.">Mrs.</option>
                                        <option value="Miss.">Miss.</option>
                                        <option value="Ms.">Ms.</option>
                                        <option value=""></option>
                                    </select>
                                    <input type="text" placeholder="First Name  Last Name" id="name" name="name" maxlength="100" style="width: 180px; margin-right: 10px; color: rgb(136, 136, 136);" class="inquiry-text">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" valign="top"   class="g_lab"><label>Company:</label></th>
                                <td>
                                    <input type="text" style="width:300px" name="company" id="company" class="company inquiry-text" maxlength="200">
                                </td>
                            </tr>
                            <tr>
                                <th valign="top"  class="g_lab"scope="row">
                                    <label>Telephone:</label>
                                </th>
                                <td>
                                    <input type="text" placeholder="Area - Local Number - Ext" id="tel" name="tel" maxlength="60" style="width: 190px; color: rgb(136, 136, 136);" class="hint inquiry-text">
                                    <label style="margin-left: 20px;">Fax: </label><input type="text" placeholder="Area - Local Number - Ext" name="fax" id="fax" maxlength="60" style="width: 190px; color: rgb(136, 136, 136);" class="hint inquiry-text">
                                </td>
                            </tr>
                            <tr>
                                <th class="g_lab" style="font-weight:normal; padding-top: 1px;" scope="row"><label>Website:</label></th>
                                <td>
                                    <input type="text" class="company inquiry-text" style="width:303px;" id="website" name="website" value="http://" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" valign="top"   class="g_lab"><label>Country:</label></th>
                                <td>
                                    <input type="hidden" name="moreinfo" id="moreinfo" value="1">
                                    <select style="padding: 0px ! important; width: 236px; color: rgb(51, 51, 51);" name="country" id="country">
                                        <optgroup label="Select where your company is located">
                                            <option value="" countrynum="">Select Country</option>
                                            <option value="CN" countrynum="86">China (Mainland)</option>
                                            <option value="CA" countrynum="1">Canada</option>
                                            <option value="HK" countrynum="852">Hong Kong</option>
                                            <option value="IN" countrynum="91">India</option>
                                            <option value="ID" countrynum="62">Indonesia</option>
                                            <option value="KR" countrynum="82">South Korea</option>
                                            <option value="MY" countrynum="60">Malaysia</option>
                                            <option value="SG" countrynum="65">Singapore</option>
                                            <option value="TW" countrynum="886">Taiwan</option>
                                            <option value="UK" countrynum="44">United Kingdom</option>
                                            <option value="US" countrynum="1">United States</option>
                                        </optgroup>
                                        <optgroup label="All Countries & Territories (A to Z)">
                                            <option value="AF"  countrynum="93">Afghanistan</option>
                                            <option value="AL"  countrynum="355">Albania</option>
                                            <option value="DZ"  countrynum="213">Algeria</option>
                                            <option value="AS"  countrynum="684">American Samoa</option>
                                            <option value="AD"  countrynum="376">Andorra</option>
                                            <option value="AO"  countrynum="244">Angola</option>
                                            <option value="AI"  countrynum="1-264">Anguilla</option>
                                            <option value="AQ"  countrynum="672">Antarctica</option>
                                            <option value="AG"  countrynum="1-268">Antigua and Barbuda</option>
                                            <option value="AR"  countrynum="54">Argentina</option>
                                            <option value="AM"  countrynum="374">Armenia</option>
                                            <option value="AW"  countrynum="297">Aruba</option>
                                            <option value="AU"  countrynum="61">Australia</option>
                                            <option value="AT"  countrynum="43">Austria</option>
                                            <option value="AZ"  countrynum="994">Azerbaijan</option>
                                            <option value="BS"  countrynum="1-242">Bahamas</option>
                                            <option value="BH"  countrynum="973">Bahrain</option>
                                            <option value="BD"  countrynum="880">Bangladesh</option>
                                            <option value="BB"  countrynum="1-246">Barbados</option>
                                            <option value="BY"  countrynum="375">Belarus</option>
                                            <option value="BE"  countrynum="32">Belgium</option>
                                            <option value="BZ"  countrynum="501">Belize</option>
                                            <option value="BJ"  countrynum="229">Benin</option>
                                            <option value="BM"  countrynum="1-441">Bermuda</option>
                                            <option value="BT"  countrynum="975">Bhutan</option>
                                            <option value="BO"  countrynum="591">Bolivia</option>
                                            <option value="BA"  countrynum="387">Bosnia and Herzegovina</option>
                                            <option value="BW"  countrynum="267">Botswana</option>
                                            <option value="BV"  countrynum="">Bouvet Island</option>
                                            <option value="BR"  countrynum="55">Brazil</option>
                                            <option value="IO"  countrynum="1-284">British Indian Ocean Territory</option>
                                            <option value="BN"  countrynum="673">Brunei Darussalam</option>
                                            <option value="BG"  countrynum="359">Bulgaria</option>
                                            <option value="BF"  countrynum="226">Burkina Faso</option>
                                            <option value="BI"  countrynum="257">Burundi</option>
                                            <option value="KH"  countrynum="855">Cambodia</option>
                                            <option value="CM"  countrynum="237">Cameroon</option>
                                            <option value="CA"  countrynum="1">Canada</option>
                                            <option value="CV"  countrynum="238">Cape Verde</option>
                                            <option value="KY"  countrynum="1-345">Cayman Islands</option>
                                            <option value="CF"  countrynum="236">Central African Republic</option>
                                            <option value="TD"  countrynum="235">Chad</option>
                                            <option value="CL"  countrynum="56">Chile</option>
                                            <option value="CN" selected countrynum="86">China (Mainland)</option>
                                            <option value="CX"  countrynum="61">Christmas Island</option>
                                            <option value="CC"  countrynum="61">Cocos (Keeling) Islands</option>
                                            <option value="CO"  countrynum="57">Colombia</option>
                                            <option value="KM"  countrynum="269">Comoros</option>
                                            <option value="CG"  countrynum="242">Congo</option>
                                            <option value="ZR"  countrynum="243">Congo, The Democratic Republic Of The</option>
                                            <option value="CK"  countrynum="682">Cook Islands</option>
                                            <option value="CR"  countrynum="506">Costa Rica</option>
                                            <option value="CI"  countrynum="225">Cote D'Ivoire</option>
                                            <option value="HR"  countrynum="385">Croatia (local name: Hrvatska)</option>
                                            <option value="CU"  countrynum="53">Cuba</option>
                                            <option value="CY"  countrynum="357">Cyprus</option>
                                            <option value="CZ"  countrynum="420">Czech Republic</option>
                                            <option value="DK"  countrynum="45">Denmark</option>
                                            <option value="DJ"  countrynum="253">Djibouti</option>
                                            <option value="DM"  countrynum="1-767">Dominica</option>
                                            <option value="DO"  countrynum="1-809">Dominican Republic</option>
                                            <option value="TP"  countrynum="670">East Timor</option>
                                            <option value="EC"  countrynum="593">Ecuador</option>
                                            <option value="EG"  countrynum="20">Egypt</option>
                                            <option value="SV"  countrynum="503">El Salvador</option>
                                            <option value="GQ"  countrynum="240">Equatorial Guinea</option>
                                            <option value="ER"  countrynum="291">Eritrea</option>
                                            <option value="EE"  countrynum="372">Estonia</option>
                                            <option value="ET"  countrynum="251">Ethiopia</option>
                                            <option value="FK"  countrynum="500">Falkland Islands (Malvinas)</option>
                                            <option value="FO"  countrynum="298">Faroe Islands</option>
                                            <option value="FJ"  countrynum="679">Fiji</option>
                                            <option value="FI"  countrynum="358">Finland</option>
                                            <option value="FR"  countrynum="33">France</option>
                                            <option value="FX"  countrynum="33">France Metropolitan</option>
                                            <option value="GF"  countrynum="594">French Guiana</option>
                                            <option value="PF"  countrynum="689">French Polynesia</option>
                                            <option value="TF"  countrynum="">French Southern Territories</option>
                                            <option value="GA"  countrynum="241">Gabon</option>
                                            <option value="GM"  countrynum="220">Gambia</option>
                                            <option value="GE"  countrynum="995">Georgia</option>
                                            <option value="DE"  countrynum="49">Germany</option>
                                            <option value="GH"  countrynum="233">Ghana</option>
                                            <option value="GI"  countrynum="350">Gibraltar</option>
                                            <option value="GR"  countrynum="30">Greece</option>
                                            <option value="GL"  countrynum="299">Greenland</option>
                                            <option value="GD"  countrynum="1-473">Grenada</option>
                                            <option value="GP"  countrynum="590">Guadeloupe</option>
                                            <option value="GU"  countrynum="1-671">Guam</option>
                                            <option value="GT"  countrynum="502">Guatemala</option>
                                            <option value="GN"  countrynum="224">Guinea</option>
                                            <option value="GW"  countrynum="245">Guinea-Bissau</option>
                                            <option value="GY"  countrynum="592">Guyana</option>
                                            <option value="HT"  countrynum="509">Haiti</option>
                                            <option value="HM"  countrynum="">Heard and Mc Donald Islands</option>
                                            <option value="HN"  countrynum="504">Honduras</option>
                                            <option value="HK"  countrynum="852">Hong Kong</option>
                                            <option value="HU"  countrynum="36">Hungary</option>
                                            <option value="IS"  countrynum="354">Iceland</option>
                                            <option value="IN"  countrynum="91">India</option>
                                            <option value="ID"  countrynum="62">Indonesia</option>
                                            <option value="IR"  countrynum="98">Iran (Islamic Republic of)</option>
                                            <option value="IQ"  countrynum="964">Iraq</option>
                                            <option value="IE"  countrynum="353">Ireland</option>
                                            <option value="IM"  countrynum="">Isle of Man</option>
                                            <option value="IL"  countrynum="972">Israel</option>
                                            <option value="IT"  countrynum="39">Italy</option>
                                            <option value="JM"  countrynum="1-876">Jamaica</option>
                                            <option value="JP"  countrynum="81">Japan</option>
                                            <option value="JO"  countrynum="962">Jordan</option>
                                            <option value="KZ"  countrynum="7">Kazakhstan</option>
                                            <option value="KE"  countrynum="254">Kenya</option>
                                            <option value="KI"  countrynum="686">Kiribati</option>
                                            <option value="KS"  countrynum="">Kosovo</option>
                                            <option value="KW"  countrynum="965">Kuwait</option>
                                            <option value="KG"  countrynum="996">Kyrgyzstan</option>
                                            <option value="LA"  countrynum="856">Lao People's Democratic Republic</option>
                                            <option value="LV"  countrynum="371">Latvia</option>
                                            <option value="LB"  countrynum="961">Lebanon</option>
                                            <option value="LS"  countrynum="266">Lesotho</option>
                                            <option value="LR"  countrynum="231">Liberia</option>
                                            <option value="LY"  countrynum="218">Libyan Arab Jamahiriya</option>
                                            <option value="LI"  countrynum="423">Liechtenstein</option>
                                            <option value="LT"  countrynum="370">Lithuania</option>
                                            <option value="LU"  countrynum="352">Luxembourg</option>
                                            <option value="MO"  countrynum="853">Macau</option>
                                            <option value="MG"  countrynum="261">Madagascar</option>
                                            <option value="MW"  countrynum="265">Malawi</option>
                                            <option value="MY"  countrynum="60">Malaysia</option>
                                            <option value="MV"  countrynum="960">Maldives</option>
                                            <option value="ML"  countrynum="223">Mali</option>
                                            <option value="MT"  countrynum="356">Malta</option>
                                            <option value="MH"  countrynum="692">Marshall Islands</option>
                                            <option value="MQ"  countrynum="596">Martinique</option>
                                            <option value="MR"  countrynum="222">Mauritania</option>
                                            <option value="MU"  countrynum="230">Mauritius</option>
                                            <option value="YT"  countrynum="269">Mayotte</option>
                                            <option value="MX"  countrynum="52">Mexico</option>
                                            <option value="FM"  countrynum="691">Micronesia</option>
                                            <option value="MD"  countrynum="373">Moldova</option>
                                            <option value="MC"  countrynum="377">Monaco</option>
                                            <option value="MN"  countrynum="976">Mongolia</option>
                                            <option value="MNE"  countrynum="382">Montenegro</option>
                                            <option value="MS"  countrynum="1-664">Montserrat</option>
                                            <option value="MA"  countrynum="212">Morocco</option>
                                            <option value="MZ"  countrynum="258">Mozambique</option>
                                            <option value="MM"  countrynum="95">Myanmar</option>
                                            <option value="NA"  countrynum="264">Namibia</option>
                                            <option value="NR"  countrynum="674">Nauru</option>
                                            <option value="NP"  countrynum="977">Nepal</option>
                                            <option value="NL"  countrynum="31">Netherlands</option>
                                            <option value="AN"  countrynum="599">Netherlands Antilles</option>
                                            <option value="NC"  countrynum="687">New Caledonia</option>
                                            <option value="NZ"  countrynum="64">New Zealand</option>
                                            <option value="NI"  countrynum="505">Nicaragua</option>
                                            <option value="NE"  countrynum="227">Niger</option>
                                            <option value="NG"  countrynum="234">Nigeria</option>
                                            <option value="NU"  countrynum="683">Niue</option>
                                            <option value="NF"  countrynum="672">Norfolk Island</option>
                                            <option value="KP"  countrynum="850">North Korea</option>
                                            <option value="MP"  countrynum="1670">Northern Mariana Islands</option>
                                            <option value="NO"  countrynum="47">Norway</option>
                                            <option value="OM"  countrynum="968">Oman</option>
                                            <option value="Other"  countrynum="">Other Country</option>
                                            <option value="PK"  countrynum="92">Pakistan</option>
                                            <option value="PW"  countrynum="680">Palau</option>
                                            <option value="PS"  countrynum="970">Palestine</option>
                                            <option value="PA"  countrynum="507">Panama</option>
                                            <option value="PG"  countrynum="675">Papua New Guinea</option>
                                            <option value="PY"  countrynum="595">Paraguay</option>
                                            <option value="PE"  countrynum="51">Peru</option>
                                            <option value="PH"  countrynum="63">Philippines</option>
                                            <option value="PN"  countrynum="872">Pitcairn</option>
                                            <option value="PL"  countrynum="48">Poland</option>
                                            <option value="PT"  countrynum="351">Portugal</option>
                                            <option value="PR"  countrynum="1-787">Puerto Rico</option>
                                            <option value="QA"  countrynum="974">Qatar</option>
                                            <option value="RE"  countrynum="262">Reunion</option>
                                            <option value="RO"  countrynum="40">Romania</option>
                                            <option value="RU"  countrynum="7">Russian Federation</option>
                                            <option value="RW"  countrynum="250">Rwanda</option>
                                            <option value="KN"  countrynum="1">Saint Kitts and Nevis</option>
                                            <option value="LC"  countrynum="1">Saint Lucia</option>
                                            <option value="VC"  countrynum="1">Saint Vincent and the Grenadines</option>
                                            <option value="WS"  countrynum="685">Samoa</option>
                                            <option value="SM"  countrynum="378">San Marino</option>
                                            <option value="ST"  countrynum="239">Sao Tome and Principe</option>
                                            <option value="SA"  countrynum="966">Saudi Arabia</option>
                                            <option value="SN"  countrynum="221">Senegal</option>
                                            <option value="SRB"  countrynum="381">Serbia</option>
                                            <option value="SC"  countrynum="248">Seychelles</option>
                                            <option value="SL"  countrynum="232">Sierra Leone</option>
                                            <option value="SG"  countrynum="65">Singapore</option>
                                            <option value="SK"  countrynum="421">Slovakia (Slovak Republic)</option>
                                            <option value="SI"  countrynum="386">Slovenia</option>
                                            <option value="SB"  countrynum="677">Solomon Islands</option>
                                            <option value="SO"  countrynum="252">Somalia</option>
                                            <option value="ZA"  countrynum="27">South Africa</option>
                                            <option value="KR"  countrynum="82">South Korea</option>
                                            <option value="ES"  countrynum="34">Spain</option>
                                            <option value="LK"  countrynum="94">Sri Lanka</option>
                                            <option value="SH"  countrynum="290">St. Helena</option>
                                            <option value="PM"  countrynum="508">St. Pierre and Miquelon</option>
                                            <option value="SD"  countrynum="249">Sudan</option>
                                            <option value="SR"  countrynum="597">Suriname</option>
                                            <option value="SJ"  countrynum="">Svalbard and Jan Mayen Islands</option>
                                            <option value="SZ"  countrynum="268">Swaziland</option>
                                            <option value="SE"  countrynum="46">Sweden</option>
                                            <option value="CH"  countrynum="41">Switzerland</option>
                                            <option value="SY"  countrynum="963">Syrian Arab Republic</option>
                                            <option value="TW"  countrynum="886">Taiwan</option>
                                            <option value="TJ"  countrynum="992">Tajikistan</option>
                                            <option value="TZ"  countrynum="255">Tanzania</option>
                                            <option value="TH"  countrynum="66">Thailand</option>
                                            <option value="MK"  countrynum="389">The former Yugoslav Republic of Macedonia</option>
                                            <option value="TG"  countrynum="228">Togo</option>
                                            <option value="TK"  countrynum="690">Tokelau</option>
                                            <option value="TO"  countrynum="676">Tonga</option>
                                            <option value="TT"  countrynum="1-868">Trinidad and Tobago</option>
                                            <option value="TN"  countrynum="216">Tunisia</option>
                                            <option value="TR"  countrynum="90">Turkey</option>
                                            <option value="TM"  countrynum="993">Turkmenistan</option>
                                            <option value="TC"  countrynum="1-649">Turks and Caicos Islands</option>
                                            <option value="TV"  countrynum="688">Tuvalu</option>
                                            <option value="UG"  countrynum="256">Uganda</option>
                                            <option value="UA"  countrynum="380">Ukraine</option>
                                            <option value="AE"  countrynum="971">United Arab Emirates</option>
                                            <option value="UK"  countrynum="44">United Kingdom</option>
                                            <option value="US"  countrynum="1">United States</option>
                                            <option value="UM"  countrynum="">United States Minor Outlying Islands</option>
                                            <option value="UY"  countrynum="598">Uruguay</option>
                                            <option value="UZ"  countrynum="998">Uzbekistan</option>
                                            <option value="VU"  countrynum="678">Vanuatu</option>
                                            <option value="VA"  countrynum="39">Vatican City State (Holy See)</option>
                                            <option value="VE"  countrynum="58">Venezuela</option>
                                            <option value="VN"  countrynum="84">Vietnam</option>
                                            <option value="VG"  countrynum="1284">Virgin Islands (British)</option>
                                            <option value="VI"  countrynum="1340">Virgin Islands (U.S.)</option>
                                            <option value="WF"  countrynum="681">Wallis And Futuna Islands</option>
                                            <option value="EH"  countrynum="685">Western Sahara</option>
                                            <option value="YE"  countrynum="967">Yemen</option>
                                            <option value="YU"  countrynum="381">Yugoslavia</option>
                                            <option value="ZM"  countrynum="260">Zambia</option>
                                            <option value="ZW"  countrynum="263">Zimbabwe</option>
                                        </optgroup>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th  class="g_lab"  valign="top" scope="row"><label>Optional Details:</label></th>
                                <td style="padding-top: 3px;">
                                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                        <tr><th width="110" class="g_lab" style="font-weight:normal; padding-top: 1px;" scope="row"><label>Price & Terms:</label></th>
                                            <td style="width:400px;">
                                                <span class="fl" style="line-height: 18px;">Price & Terms&nbsp;</span>
                                                <select class="fl"  id="priceTerms" style="width: 116px; color: rgb(51, 51, 51);">
                                                    <option value="--">--</option>
                                                    <option value="FOB">FOB</option>
                                                    <option value="CIF">CIF</option>
                                                    <option value="CNF">CNF</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                                <span class="fl" style="line-height: 18px;">&nbsp;Payment&nbsp;</span>
                                                <select id="payment" style="width: 116px; color: rgb(51, 51, 51);">
                                                    <option value="--">--</option>
                                                    <option value="L/C">L/C</option>
                                                    <option value="T/T">T/T</option>
                                                    <option value="Escrow">Escrow</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                                <input type="hidden" name="requestquote" id="requestquote" value="1">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="g_lab" style="font-weight:normal; padding-top: 1px;" scope="row">
                                                <label>Initial Order:</label>
                                            </th>
                                            <td >
                                                <input type="text" style="width: 262px; margin-right: 10px;" id="initialOrder" maxlength="100" class="hint inquiry-text"><span style="color: rgb(170, 170, 170);">e.g. 10,000/pcs</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="g_lab" style="font-weight:normal; padding-top: 1px;" scope="row">
                                                <label>Sample Terms:</label>
                                            </th>
                                            <td >
                                                <select id="sampleTerms" style="width: 262px; color: rgb(51, 51, 51);">
                                                    <option value="-1">Sample Terms</option>
                                                    <option value="0">Free sample</option>
                                                    <option value="1">Buyer pays shipping fee</option>
                                                    <option value="2">Seller pays shipping fee</option>
                                                    <option value="3">Buyer pays sample fee</option>
                                                    <option value="4">Seller pays sample fee</option>
                                                    <option value="5">Buyer pays both shipping and sample fee</option>
                                                    <option value="6">Seller pays both shipping and sample fee</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr><th class="g_lab" style="font-weight:normal; padding-top: 1px;" scope="row"><label>Other Requests:</label></th>
                                            <td style="padding-left: 0;">
                                                <input type="checkbox" id="specification" value="1">Specifications&nbsp;&nbsp;
                                                <input type="checkbox" id="companyDescription" value="2">Company Description&nbsp;&nbsp;
                                                <input type="checkbox" id="deliverTime" value="4">Deliver Time&nbsp;&nbsp;
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td colspan="2" style="padding-top: 0">
                        <div class="g_show hl_12">
                            <a href="javascript:void(0);" onclick="showfiletable('file');">
                                <img id="requestfileimg" src="resources/img/ico-.gif" > Each file sized 1M max.                  </a>
                            <span style="color:#AAAAAA;font-size:10px;">(Each file sized 1M max.)</span>
                        </div>
                        <table id="file" width="100%" cellspacing="0" style="background: #fff;display:none;" cellpadding="0" border="0">
                            <tbody>
                            <tr>
                                <th width="15%"  valign="top" scope="row" class="g_lab">
                                    <label style="font-size: 11px;font-weight: bold;color:#333333;">File 1:</label>
                                </th>
                                <td width="85%">
                                    <input size="40" type="file" accept="image/jpg,image/jpeg,image/png,image/gif" onchange="getFileSize(this)" id="file1">
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" scope="row" class="g_lab">
                                    <label style="font-size: 11px;font-weight: bold;color:#333333;">File 2:</label>
                                </th>
                                <td>
                                    <input size="40" type="file" accept="image/jpg,image/jpeg,image/png,image/gif" onchange="getFileSize(this)" id="file2">
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" scope="row" class="g_lab">
                                    <label style="font-size: 11px;font-weight: bold;color:#333333;">File 3:</label>
                                </th>
                                <td>
                                    <input size="40" type="file" accept="image/jpg,image/jpeg,image/png,image/gif" onchange="getFileSize(this)" id="file3">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <div style="line-height: 22px;"><input type="checkbox" id="urgent" checked="checked" value="1"/>Please reply me within 24 hours.</div>
                        <div style="line-height: 22px;"><input type="checkbox" id="subscribed" value="1"/>Email me twice a week updates on the latest Product and Supplier info.</div>
                    </td>
                </tr>
            </table>
            <div class="cb"></div>
            <div class="g_btn">
                <input type="image" id="btn-email-submit" src="resources/img/g_04.gif">
            </div>
            <div class="cb"></div>
        </div>
        <div class="g_bot" ></div>
        <div class="cb"></div>
    </div>
</form><!--content-->
<div class="footer hl_0">
</div>
<div class="reserved">
    Copyright © 2017 Shenzhen Baoan District Xixiang Jingli Plastic Products Factory  All rights reserved.<br/>
    <a href="http://www.beian.gov.cn/portal/registerSystemInfo" style="text-decoration:none;">粤ICP备09192373号</a>
</div>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','http://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-71442861-1', 'auto');
    ga('send', 'pageview');

</script>
<noscript><img style="display:none" src="#" rel="nofollow"/></noscript>    <img src="resources/img/ico+.gif" style="display:none;"/>
</body>
<script type="text/x-jsrender" id="template-footer">
    	<ul style="width: 120px;">
        	<li class="tit"><strong>About Us</strong></li>
        	<li>
        		<strong>
                	<a title="China " href="aboutus">Company Profile</a>
            	</strong>
        	</li>
        	<li>
        		<strong>
                	<a title=" factory" href="factory">Factory Tour</a>
            	</strong>
        	</li>
        	<li>
        		<strong>
                	<a title="Good Quality 5 Gallon Water Bottle Caps Supplier" href="quality">Quality Control</a>
            	</strong>
        	</li>
    	</ul>
        {{for data}}
        	<ul style="width: 196px;">
        		<li class="tit">
		      		<strong>
		      			<a href="products/categories/{{: #data.category.id}}/view" title="{{: #data.category.categoryName}} supplier">{{: #data.category.categoryName}}</a>
		      		</strong>
	      		</li>
	      		{{for #data.products}}
	      			<li>
		      			<strong>
		      				<a href="products/{{: #data.id}}/view" title="{{: #data.productName}} supplier">{{: #data.productName}}</a>
		      			</strong>
	      			</li>
	      		{{/for}}
	        </ul>
        {{/for}}
    	<ul style="width: 120px; border:none;">
        		<li class="tit"><strong>Contact Us</strong></li>
        		<li><strong><a title="Contact Info" href="contactus">Contact Info</a></strong></li>
        		<li><strong><a title="Request A Quote" href="contactnow">Request A Quote</a></strong></li>
        		<li><strong><a title="E-Mail" href="mailto:sales@szjlpg.com">E-Mail</a></strong></li>
				<li><strong><a title="Administrators entrance" href="admin/login">Administrator</a></strong></li>
    	</ul>
    	<div class="clear"></div>
    </script>
</html>
