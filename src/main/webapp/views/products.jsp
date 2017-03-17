<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= basePath %>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>5 Gallon Water Bottle Caps & Plastic Water Bottle Caps on sale - Best manufacturer</title>
    <meta name="keywords" content="China 5 Gallon Water Bottle Caps distributor, China Plastic Water Bottle Caps wholesaler, China Mineral Water Bottle Caps manufacturer, China No Spill Water Bottle Caps exporter" />
    <meta name="description" content="Shenzhen Baoan District Xixiang Jingli Plastic Products Factory， is a supplier and exporter of 5 Gallon Water Bottle Caps, Plastic Water Bottle Caps and Mineral Water Bottle Caps, we has good quality products & service from China.">
    <link type="text/css" rel="stylesheet" href="resources/css/style.css" media="all" />
    <link type="text/css" rel="stylesheet" href="resources/css/index.css" media="all" />
    <link type="text/css" rel="stylesheet" href="resources/css/seo.css" media="all"/>
    <link type="text/css" rel="stylesheet" href="resources/css/list.css" media="all"/>
    <link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.ico" media="screen" />
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--><script type="text/javascript" src="resources/plugins/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="resources/plugins/jsrender/jsrender.min.js"></script>
    <script type="text/javascript" src="resources/js/index.js"></script>
    <script type="text/javascript" src="resources/js/functions.js"></script>

    <script type="text/javascript">
        function open_img(a,event){
            var div = a.parentNode;
            function get_pos(div){
                var pos={'left':0,'top':0}
                while(1){
                    if(!div){
                        break;
                    }
                    pos['left']+=div.offsetLeft;
                    pos['top']+=div.offsetTop;
                    div=div.offsetParent;
                }
                return pos;
            }
            var pos=get_pos(div);
            var show=document.getElementById("p_o");
            if(a.className=='col'){
                a.className='ope'
                show.style.width=121+'px';
                show.style.height='auto';
                show.style.visibility='visible';
                show.style.left=pos['left']+"px";
                show.style.top=pos['top']+17+"px";
            }else{
                a.className='col'
                show.style.visibility='hidden';
            }
        }
    </script>
</head>

<body>
    <div id="maoytID" style="width:115px; height:79px;z-index: 999;position:absolute;right:40px;bottom:60px; ">
        <a href="contactnow" target="_blank">
            <img src="resources/img/floatimage_2.gif" alt="ContactNow"/>
        </a>
    </div>
    <div class="header">
        <div class="head">
            <div class="logo">
                <a href="index" title="China 5 Gallon Water Bottle Caps Manufacturer">
                    <img alt="China 5 Gallon Water Bottle Caps Manufacturer" src="resources/img/logo.gif"/>
                </a>
            </div>
            <table style="width: 450px;" class="com" cellspacing="0" cellpadding="0">
                <tr valign="middle" align="left">
                    <td>
                        <p><span style="font-size:20px" id="company-name">Shenzhen Baoan District Xixiang Jingli Plastic Products Factory</span></p>

                        <p><strong>South China leading manufacturer&nbsp;in &nbsp;water bottle and Non-spill&nbsp;caps.</strong></p>
                    </td>
                </tr>
            </table>
            <table class="lge" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2">
                        <b style=" margin-top: 10px;">Sales & Support <font id="hourZone"></font></b>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <b style="margin: 1px 0;"><a style="text-decoration: none; color:#000;font-size: 12px;" href="contactnow">Request A Quote</a></b>
                    </td>
                </tr>
                <tr>
                    <td width="111" class="map"></td>
                    <td width="129">
                        <div class="sel" id="selectlang">
                            <span>Select Language</span>
                            <a style="cursor: pointer;" class="col"></a>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

        <div class="menu textf">
            <ul id="head_menu">
                <li><a href="index">Home</a></li>
                <li class="cur"><a href="products/view" >Products</a></li>
                <li><a href="aboutus">About Us</a></li>
                <li><a href="factory">Factory Tour</a></li>
                <li><a href="quality">Quality Control</a></li>
                <li><a href="contactus">Contact Us</a></li>
                <li><a href="contactnow">Request A Quote</a></li>
            </ul>
            <table  cellpadding="0" cellspacing="0" style="z-index:90">
                <tr>
                    <td style="padding-right: 20px;">
                        <select id="category-search">
                            <option value="0">All Categories</option>
                            <option value="1">5 Gallon Water Bottle Caps</option>
                            <option value="2">Mineral Water Bottle Caps</option>
                            <option value="3">No Spill Water Bottle Caps</option>
                            <option value="4">5 Gallon Water Bottles</option>
                            <option value="5">3 Gallon Water Bottle</option>
                            <option value="6">5 Gallon Water Bottle Handle</option>
                            <option value="7">5 Gallon Water Bottle Pump</option>
                            <option value="8">5 Gallon Preform</option>
                            <option value="9">Personalized Water Bottle Labels</option>
                            <option value="10">Plastic Flat Bottle Caps</option>
                            <option value="11">Water Bottle Cap Parts</option>
                        </select>
                    </td>
                    <td width="310"><input class="text_wrap" type="text" id="keyword" value="${keyword}"/></td>
                    <td align="left">
                        <input type="button" id="btn-search" value="" class="submit_1" />
                    </td>
                </tr>
            </table>
        </div>
        <script>dealZoneHour();</script>
    </div>
    <div class="guide text8">
        <a href="index">Home</a>
        <span class="index-bread">5 Gallon Water Bottle Caps</span>
    </div>
    <div class="main">
        <div class="left fleft">
            <ul class="l_menu bbox text8" id="nav-categories">
                <li id="catelist" class="tit" >Browse Categories</li>
                <!--分类-->
                <li id="cate_76274" >
                    <strong>
                        <a href=/supplier-76274-5-gallon-water-bottle-caps title="China 5 Gallon Water Bottle Caps Supplier">5 Gallon Water Bottle Caps</a>
                    </strong>
                    <font color="#4E4E4E" style="display: inline-block">(12)</font>
                </li>
                <li id="cate_76275" >
                    <strong>
                        <a href=/supplier-76275-plastic-water-bottle-caps title="China Plastic Water Bottle Caps Supplier">Plastic Water Bottle Caps</a>
                    </strong>
                    <font color="#4E4E4E" style="display: inline-block">(13)</font>
                </li>
                <li id="cate_76276" >
                    <strong><a href=/supplier-76276-mineral-water-bottle-caps title="China Mineral Water Bottle Caps Supplier">Mineral Water Bottle Caps</a></strong>
                    <font color="#4E4E4E" style="display: inline-block">(12)</font>
                </li>
                <li id="cate_76277" >
                    <strong><a href=/supplier-76277-no-spill-water-bottle-caps title="China No Spill Water Bottle Caps Supplier">No Spill Water Bottle Caps</a></strong>
                    <font color="#4E4E4E" style="display: inline-block">(12)</font>
                </li>
                <li id="cate_76278" >
                    <strong><a href=/supplier-76278-5-gallon-water-bottles title="China 5 Gallon Water Bottles Supplier">5 Gallon Water Bottles</a></strong>
                    <font color="#4E4E4E" style="display: inline-block">(12)</font>
                </li>
                <li id="cate_76279" >
                    <strong><a href=/supplier-76279-3-gallon-water-bottle title="China 3 Gallon Water Bottle Supplier">3 Gallon Water Bottle</a></strong>
                    <font color="#4E4E4E" style="display: inline-block">(12)</font>
                </li>
                <li id="cate_76280" >
                    <strong><a href=/supplier-76280-5-gallon-water-bottle-handle title="China 5 Gallon Water Bottle Handle Supplier">5 Gallon Water Bottle Handle</a></strong>
                    <font color="#4E4E4E" style="display: inline-block">(14)</font>
                </li>
                <li id="cate_76281" >
                    <strong><a href=/supplier-76281-5-gallon-water-bottle-pump title="China 5 Gallon Water Bottle Pump Supplier">5 Gallon Water Bottle Pump</a></strong>
                    <font color="#4E4E4E" style="display: inline-block">(12)</font>
                </li>
                <li id="cate_76282" >
                    <strong><a href=/supplier-76282-5-gallon-preform title="China 5 Gallon Preform Supplier">5 Gallon Preform</a></strong>
                    <font color="#4E4E4E" style="display: inline-block">(12)</font>
                </li>
                <li id="cate_76285" >
                    <strong><a href=/supplier-76285-personalized-water-bottle-labels title="China Personalized Water Bottle Labels Supplier">Personalized Water Bottle Labels</a></strong>
                    <font color="#4E4E4E" style="display: inline-block">(3)</font>
                </li>
                <li id="cate_76286" >
                    <strong><a href=/supplier-76286-plastic-flat-bottle-caps title="China Plastic Flat Bottle Caps Supplier">Plastic Flat Bottle Caps</a></strong>
                    <font color="#4E4E4E" style="display: inline-block">(4)</font>
                </li>
                <li id="cate_76287" >
                    <strong><a href=/supplier-76287-water-bottle-cap-parts title="China Water Bottle Cap Parts Supplier">Water Bottle Cap Parts</a></strong>
                    <font color="#4E4E4E" style="display: inline-block">(7)</font>
                </li>
            </ul>
            <div class="clear10"></div>
            <!-- 证书 -->
            <div class="l_cf bbox" id="Certifications">

            </div>
        </div>
        <div class="hidden" id="queryType">${queryType}</div>
        <div class="hidden" id="tag">${tag}</div>
		<div class="hidden" id="cateid">${cateid}</div>
        <div class="right fright">

        </div>
    </div>
    <!--FLAG_FRBIZ_BEGIN-->
    <div class="clear10"></div>
    <div class="footer bbox text8">
    </div>
    <div class="reserved">
	    Copyright © 2017 Shenzhen Baoan District Xixiang Jingli Plastic Products Factory  All rights reserved.<br/>
	    <a href="http://www.beian.gov.cn/portal/registerSystemInfo" style="text-decoration:none;">粤ICP备09192373号</a>
	</div>
    <!--FLAG_FRBIZ_END-->
    <!--FLAG_FRBIZ_static-->
    <!-- static:2016-11-21 12:02:26 -->
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
    <script type="text/x-jsrender" id="template-product-list">
		<div class="clear10"></div>
		<div class="r_pro bbox">
			<div class="tit">
				<h1 class="cate-product-title">{{: category.categoryName}}</h1><b style="color:#555;font-family: arial;margin-left: -5px;font-size: 14px;">({{: category.amount}})</b>
			</div>
			{{for pageInfo.list}}
				<div class="pro">
					<div class="pho">
						<a href="products/{{: #data.id}}/view" title="{{: #data.productName}}">
							{{for #data.pictures}}
								{{if #getIndex() == 0}}
									<img onerror="this.onerror='';this.src='resources/img/nophoto.gif'" src="{{: #data}}" alt="{{: #parent.parent.productName}}"
										onload="pic_reset(this,'140,100');" />
								{{/if}}
							{{/for}}
						</a>
					</div>
					<div style="width:525px;float: left;">
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="80%">
									<h2>
										<a href="products/{{: #data.id}}/view" title="{{: #data.productName}}"	class="texta4">
											{{: #data.productName}}
										</a>
									</h2>
								</td>
								<td valign="top" style="width:*;padding-left:10px;">
									<div class="sub">
										<a href="contactnow" class="submit_2" target="_blank"></a>
									</div>
								</td>
							</tr>
						</table>
						<div class="con text8">
							{{: #data.content}}...&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="products/{{: #data.id}}/view" title="{{: #data.productName}}">
								Read More
							</a>
						</div>
						<span class="fleft">{{: #data.createTime}}</span>
					</div>
					<div class="clear"></div>
				</div>
			{{/for}}
			<div class="pages" style="">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<div class="page-block">
								Page {{: pageInfo.pageNum}} of {{: pageInfo.total}}
								<a href="javascript:void(0);">|&lt;</a>
								{{if pageInfo.hasPreviousPage}}
								    <a href="javascript:void(0);" title="Previous">&lt;&lt;</a>
								{{else}}
								    <a href="javascript:void(0);" class="hidden" title="Previous">&lt;&lt;</a>
								{{/if}}
								<a href="javascript:void(0);" class="cur">1</a>&nbsp;
								<a href="javascript:void(0);">2</a>&nbsp;
								{{if pageInfo.hasNextPage}}
								    <a href="javascript:void(0);" title="Next">&gt;&gt;</a>
								{{else}}
								    <a href="javascript:void(0);" class="hidden" title="Next">&gt;&gt;</a>
								{{/if}}
								<a href="javascript:void(0);"> &gt;|</a>
							</div>
						</td>
					</tr>
				</table>
			</div>
			
		</div>
    </script>
    
    <script type="text/x-jsrender" id="template-products-all">
    	<h1 class="index-top-tip index-top-tip2 index-top-tip3" style="margin-top: -10px;">
    		We are good quality supplier of Mineral Water Bottle Caps and No Spill Water Bottle Caps From China
    	</h1>
		<div class="clear10"></div>
		{{for categories}}
			<div class="r_pro bbox">
				<div class="tit">
					<h2 class="list-main-title"><a href="products/categories/{{: #data.id}}/view" title="{{: #data.categoryName}}">{{: #data.categoryName}}</a></h2>({{: #data.amount}})
				</div>
				<div class="r_procon"></div>
				{{for #data.products}}
					<dl class="text8">
						<dt>
							<a href="products/{{: #data.id}}/view" title="{{: #data.productName}}">
								{{for #data.pictures}}
									{{if #getIndex() == 0}}
										<img onerror ="this.onerror='';this.src='resources/img/nophoto.gif'" src="{{: #data}}" alt="{{: #parent.parent.productName}}" onload="pic_reset(this,'140,100');"/>
									{{/if}}
								{{/for}}
							</a>
						</dt>
						<dd>
							<div>
								<h2><a href="products/{{: #data.id}}/view" title="{{: #data.productName}}">{{: #data.productName}}</a></h2></div>
							<br />
						</dd>
					</dl>
				{{/for}}
				<div class="clear"></div>
			</div>
		{{/for}}
    </script>
    <script type="text/x-jsrender" id="template-Certifications">
    	<div class="tit">Certifications</div>
        	<div class="i_m_g">
                <a href="{{: qualityControl.picture}}" target="_blank" title="Good Quality 5 Gallon Water Bottle Caps on sale">
                    <img src="{{: qualityControl.picture}}" alt="Good Quality 5 Gallon Water Bottle Caps on sale">
                </a>
            </div>
        	<div class="clear10"></div>
        	<dl class="l_msy">
	        	<dd>I'm Online Chat Now</dd>
	        	<dt style="margin-top: 5px; ">
	            	<div class="two1" style="margin-right: 5px; ">
	                	<a href="mailto:{{: contactus.email}}" target="_blank">
	                    	<img src="resources/img/email.gif" height="19 ">
	                	</a>
	            	</div>
	       		</dt>
	    	</dl>
		<div class="l_but">
			<a href="contactnow" class="contact_us" target="_blank"></a>
		</div>
    </script>
    <script type="text/x-jsrender" id="template-carousel">
        <div class="carousel" id="carousel">
            <div style="position: absolute; left: 5px; top:5px;">
                {{for data}}
                    <span class="carousel-control">{{: #getIndex() + 1}}</span>
                {{/for}}
            </div>
            <div class="cb"></div>
            <div class="carousel-pictures">
                <table width="100%" height="100%">
                    <tr>
                        {{for data}}
                            <td valign="middle" align="center" class="hidden">
                                <a href="products/{{: id}}/view" title="{{: productName}}">
                                    {{for pictures}}
                                        {{if #getIndex() == 0}}
                                            <img onload="pic_reset(this,'430,250');" src="{{: #data}}" alt="{{: #parent.parent.productName}}" onerror ="this.onerror='';this.src='resources/img/nophoto.gif'"/>
                                        {{/if}}
                                    {{/for}}
                                </a>
                            </td>
                        {{/for}}
                    </tr>
                </table>
            </div>
            <div class="carousel-caption">
                {{for data}}
                    <a class="hidden" href="products/{{: id}}/view" title="{{: productName}}">
                        {{: productName}}
                    </a>
                {{/for}}
            </div>
        </div>
    </script>
    <script type="text/x-jsrender" id="template-product-advice">
        <ul class="r_hot bbox fright text8" style="width:254px;" id="product-advice">
            <li class="tit">Products</li>
            {{for data}}
                <li>
                    <div class="img_y12">
                        <table width="100%" height="41" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="middle" align="center">
                                    <a style="text-align: center; vertical-align: middle; display: table-cell; width: 55px; overflow: hidden; height: 39px; "  href="products/{{: id}}/view" title="{{: productName}}">
                                        {{for pictures}}
                                            {{if #getIndex() == 0}}
                                                <img onload="pic_reset(this,'55,36');" style="margin-left:0;float: none; vertical-align: middle;" alt="{{: #parent.parent.productName}}" src="{{: #data}}"/>
                                            {{/if}}
                                        {{/for}}
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="tit_y12">
                        <h2 style="font-weight: normal; padding: 0pt 5px;">
                            <a href="products/{{: id}}/view" title="{{: productName}}" style="font-size:0.8em;">{{: productName}}</a>
                        </h2>
                    </div>
                </li>
            {{/for}}
        </ul>
    </script>
</body>
</html>