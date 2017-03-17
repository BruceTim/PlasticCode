<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%= basePath %>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/admin/index.css" />
    <script src="resources/plugins/ckeditor/ckeditor.js" type="text/javascript" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div class="navbar navbar-duomi navbar-static-top" role="navigation">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header col-md-3 col-sm-4">
                    <a class="navbar-brand" href="index" id="logo">精力塑胶管理系统
                    </a>
                </div>
                <div class="col-md-9 col-sm-8">
                    <a href="admin/logout" class="navbar-logout col-md-1"><i class="glyphicon glyphicon-off" ></i>&nbsp;&nbsp;退出</a>
                    <span class="navbar-user col-md-offset-9 col-md-2"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;${username}</span>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <ul id="main-nav" class="main-nav nav nav-tabs nav-stacked" style="">
                    <li>
                        <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-user"></i>&nbsp;用户管理

                            <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                        </a>
                        <ul id="systemSetting" class="nav nav-list secondmenu collapse" style="height: 0px;">
                            <li><a href="javascript:void(0)" id="nav-btn-user-edit"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改信息</a></li>
                            <li><a href="javascript:void(0)" id="nav-btn-user-edit-pwd"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改密码</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#configSetting" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-list"></i> 类别管理
                            <span class="pull-right glyphicon  glyphicon-chevron-toggle"></span>
                        </a>
                        <ul id="configSetting" class="nav nav-list secondmenu collapse">
                            <li><a href="javascript:void(0)" id="nav-btn-category-list"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;类别列表</a></li>
                            <li><a href="javascript:void(0)" id="nav-btn-category-add"><i class="glyphicon glyphicon-plus"></i>&nbsp;类别添加</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#disSetting" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-globe"></i> 产品管理
                            <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                        </a>
                        <ul id="disSetting" class="nav nav-list secondmenu collapse">
                            <li><a href="javascript:void(0)" id="nav-btn-product-add"><i class="glyphicon glyphicon-plus"></i>&nbsp;发布产品</a></li>
                            <li><a href="javascript:void(0)" id="nav-btn-product-list"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;产品列表</a></li>
                            <li><a href="javascript:void(0)" id="nav-btn-product-advice"><i class="glyphicon glyphicon-text-width"></i>&nbsp;产品推荐栏</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#emailSetting" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-envelope"></i> 邮件管理
                            <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                        </a>
                        <ul id="emailSetting" class="nav nav-list secondmenu collapse">
                            <li><a href="javascript:void(0)" id="nav-btn-email-list"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;邮件列表</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#dicSetting" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-cog"></i> 公司详情
                            <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                        </a>
                        <ul id="dicSetting" class="nav nav-list secondmenu collapse">
                            <li><a href="javascript:void(0)" id="nav-btn-aboutus"><i class="glyphicon glyphicon-text-width"></i>&nbsp;关于我们</a></li>
                            <li><a href="javascript:void(0)" id="nav-btn-factory-tour"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;工厂总览</a></li>
                            <li><a href="javascript:void(0)" id="nav-btn-quality"><i class="glyphicon glyphicon-camera"></i>&nbsp;质量监控</a></li>
                            <li><a href="javascript:void(0)" id="nav-btn-contactus"><i class="glyphicon glyphicon-envelope"></i>&nbsp;联系我们</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <a href="" id="hidden-a" class="hidden" target="_blank"></a>
            <div id="main-content" class="col-md-10 bbox">
            </div>
        </div>
    </div>

    <script type="text/x-jsrender" id="template-contactus">
        <div class="col-md-10">
			<center>
				<h1>编辑产品</h1><br />
				<h3 style="color: orangered;font-weight: 400;">提示：发布描述丰富的产品信息，编写符合规范的产品标题，并配置多张不同角度的图片，更有利于获得买家青睐！</h3><br />
			</center>
		</div>
		<div class="col-md-10">
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label">Address:</label>
					<div class=" col-sm-8">
						<input class="col-sm-10 form-control" type="text" id="address" value="{{:data.address}}" placeholder="请输入联系地址" required/>
					</div>
				</div>
				<div class="form-group">
    				<label class="col-sm-2 control-label">Factory Address:</label>
					<div class=" col-sm-8">
						<input class="col-sm-10 form-control" type="text" id="faddress" value="{{:data.fAddress}}" placeholder="请输入工厂地址" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Worktime:</label>
					<div class=" col-sm-8">
						<input class="col-sm-10 form-control" type="text" id="workTime" value="{{:data.workTime}}" placeholder="请输入工作时间" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Business Phone:</label>
					<div class=" col-sm-8">
						<input class="col-sm-10 form-control" type="text" id="tellPhone" value="{{:data.tellPhone}}" placeholder="请输入座机" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Fax:</label>
					<div class=" col-sm-8">
						<input class="col-sm-10 form-control" type="text" id="fax" value="{{:data.fax}}" placeholder="请输入传真" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Contact Person:</label>
					<div class=" col-sm-8">
						<input class="col-sm-10 form-control" type="text" id="contactPerson" value="{{:data.contactPerson}}" placeholder="请输入联系人" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Job Title:</label>
					<div class=" col-sm-8">
						<input class="col-sm-10 form-control" type="text" id="jobTitle" value="{{:data.jobTitle}}" placeholder="请输入联系人职位" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Business Phone:</label>
					<div class=" col-sm-8">
						<input class="col-sm-10 form-control" type="text" id="mphone" value="{{:data.phone}}" placeholder="请输入联系人电话" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Email:</label>
					<div class=" col-sm-8">
						<input class="col-sm-10 form-control" type="email" id="contactEmail" value="{{:data.email}}" placeholder="请输入联系人邮箱" required/>
					</div>
				</div><br />
				<div class="form-group text-center">
					<button class="btn btn-primary" id="btn-contactus-submit">确认修改</button>
				</div>
			</form>
		</div>
    </script>
    <script type="text/x-jsrender" id="template-quality">
		<div class="col-md-10">
			<center>
				<h1>质量监控</h1><br />
				<h3 style="color: orangered;font-weight: 400;">提示：发布详细的公司信息，更有利于获得买家信任！</h3><br />
			</center>
		</div>
		<div class="col-md-10">
			<form class="form-horizontal" role="form">
				<fieldset>
					<legend>
						<font class="col-sm-2">证书信息</font>
						<font class="col-sm-10 legend-desc">证书信息，获取买家信任</font>
					</legend>
					<div class="form-group">
					    <label class="col-sm-2 control-label">Standard:</label>
						<div class=" col-sm-8">
							<input class="col-sm-5 form-control" type="text" id="standard" value="{{:data.standard}}" placeholder="请输入证书标准" required/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Number:</label>
						<div class=" col-sm-8">
							<input class="col-sm-5 form-control" type="text" id="number" value="{{:data.number}}" placeholder="请输入证书号码" required/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Issue Date:</label>
						<div class=" col-sm-8">
							<input class="col-sm-5 form-control" type="text" id="issueDate" value="{{:data.issueDate}}" placeholder="请输入证书生效时间" required/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Expiry Date:</label>
						<div class=" col-sm-8">
							<input class="col-sm-5 form-control" type="text" id="expiryDate" value="{{:data.expiryDate}}" placeholder="请输入证书过期时间" required/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">证书图片：</label>
						<div class="col-sm-10 ">
							<div class="row">
								<div class="col-sm-12">
									<div class="col-sm-3">
										<a href="javasrcipt:void(0)" class="file-input">
											<input type="file" class="input-picture certification-picture" accept="image/jpg,image/jpeg,image/png,image/gif" /> 添加图片
										</a>
									</div>
									<span class="help-block">建议使用<font class="font-color-red">2：3</font>比例，<font class="font-color-red">600</font>像素以上，<font class="font-color-red">JPG</font>、<font class="font-color-red">JPEG</font>格式，<font class="font-color-red">200k</font>以下</span>
								</div>
								<div class="row certification-pictures">
								    {{if data.picture != ''}}
								        <div class="picture-box2">
                                            <img class="img-thumbnail picture" src="{{: data.picture}}"/>
                                            <a href="javascript:void(0)" class="remove url">
                                                <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                        </div>
								    {{/if}}
								</div>
							</div>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>
					    <font class="col-sm-3 text-center">质量监控页面信息</font>
					</legend>
					<div class="form-group">
						<div class="col-sm-11 col-sm-offset-1">
							<textarea id="qualityContent" name="qualityContent" rows="20" cols="15" class="ckeditor"></textarea>
						</div>
					</div>
				</fieldset>
				<div class="form-group text-center">
				    <button class="btn btn-primary" id="btn-quality-submit">确认修改</button>
				</div>
			</form>
		</div>
	</script>
    <script type="text/x-jsrender" id="template-factory">
            <div class="col-md-10">
				<center>
					<h1>工厂预览</h1><br />
					<h3 style="color: orangered;font-weight: 400;">提示：展示公司详细信息，并配置多张公司的图片，更有利于了解贵公司！</h3><br />
				</center>
			</div>
			<div class="col-md-10">
			    <form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">产线图片：</label>
						<div class="col-sm-9">
							<div class="row">
								<div class="col-sm-12">
									<div class="col-sm-3">
										<a href="javasrcipt:void(0)" class="file-input">
											<input type="file" class="input-picture productLine-picture" multiple accept="image/jpg,image/jpeg,image/png,image/gif" /> 添加图片
										</a>
									</div>
									<span class="help-block">建议使用<font class="font-color-red">7：5</font>比例，<font class="font-color-red">600</font>像素以上，<font class="font-color-red">JPG</font>、<font class="font-color-red">JPEG</font>格式，<font class="font-color-red">200k</font>以下</span>
								</div>
								<div class="row productLine-pictures">
								    {{for data.pictures1}}
                                        <div class="picture-box">
                                            <img class="img-thumbnail picture" src="{{: #data}}"/>
                                            <a href="javascript:void(0)" class="remove url">
                                                <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                        </div>
								    {{/for}}
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">OEM&amp;ODM：</label>
						<div class="col-sm-9">
							<div class="row">
								<div class="col-sm-12">
									<div class="col-sm-3">
										<a href="javasrcipt:void(0)" class="file-input">
											<input type="file" class="input-picture OEM-picture" multiple accept="image/jpg,image/jpeg,image/png,image/gif" /> 添加图片
										</a>
									</div>
									<span class="help-block">建议使用<font class="font-color-red">7：5</font>比例，<font class="font-color-red">600</font>像素以上，<font class="font-color-red">JPG</font>、<font class="font-color-red">JPEG</font>格式，<font class="font-color-red">200k</font>以下</span>
								</div>
								<div class="row OEM-pictures">
								    {{for data.pictures2}}
                                        <div class="picture-box">
                                            <img class="img-thumbnail picture" src="{{: #data}}"/>
                                            <a href="javascript:void(0)" class="remove url">
                                                <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                        </div>
								    {{/for}}
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">R&amp;D：</label>
						<div class="col-sm-9">
							<div class="row">
								<div class="col-sm-12">
									<div class="col-sm-3">
										<a href="javasrcipt:void(0)" class="file-input">
											<input type="file" class="input-picture RD-picture" multiple accept="image/jpg,image/jpeg,image/png,image/gif" /> 添加图片
										</a>
									</div>
									<span class="help-block">建议使用<font class="font-color-red">7：5</font>比例，<font class="font-color-red">600</font>像素以上，<font class="font-color-red">JPG</font>、<font class="font-color-red">JPEG</font>格式，<font class="font-color-red">200k</font>以下</span>
								</div>
								<div class="row RD-pictures">
								    {{for data.pictures3}}
                                        <div class="picture-box">
                                            <img class="img-thumbnail picture" src="{{: #data}}"/>
                                            <a href="javascript:void(0)" class="remove url">
                                                <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                        </div>
								    {{/for}}
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">页面图片：</label>
						<div class="col-sm-9">
							<div class="row">
								<div class="col-sm-12">
									<div class="col-sm-3">
										<a href="javasrcipt:void(0)" class="file-input">
											<input type="file"  class="input-picture factory-picture" multiple accept="image/jpg,image/jpeg,image/png,image/gif" /> 添加图片
										</a>
									</div>
									<span class="help-block">建议使用<font class="font-color-red">7：5</font>比例，<font class="font-color-red">600</font>像素以上，<font class="font-color-red">JPG</font>、<font class="font-color-red">JPEG</font>格式，<font class="font-color-red">200k</font>以下</span>
								</div>
								<div class="row factory-pictures">
								    {{for data.pictures4}}
                                        <div class="picture-box">
                                            <img class="img-thumbnail picture" src="{{: #data}}"/>
                                            <a href="javascript:void(0)" class="remove url">
                                                <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                        </div>
								    {{/for}}
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12 text-center">
							<button class="btn btn-primary" id="btn-factoryTour-submit">确认修改</button>
						</div>
					</div><br />
				</form>
			</div>
        </script>
        <script type="text/x-jsrender" id="template-company">
			<div class="col-md-10">
				<center>
					<h1>关于我们</h1><br />
					<h3 style="color: orangered;font-weight: 400;">提示：展示公司详细信息，并配置多张公司的图片，更有利于了解贵公司！</h3><br />
				</center>
			</div>
			<div class="col-md-10">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">公司名称：</label>
						<div class=" col-sm-9">
							<input class="col-sm-5 form-control" type="text" id="company-name" value="{{: data.companyName}}" placeholder="请输入公司名称" required/>
							<p class="help-block">建议在10个单词以内</p>
						</div>
					</div><br />
					<div class="form-group">
						<label class="col-sm-2 control-label">经营类型：</label>
						<div class=" col-sm-9">
							<input class="col-sm-5 form-control" type="text" id="business-type" value="{{: data.businessType}}" placeholder="请输入经营类型" required/>
							<p class="help-block">如果有多个，以
								<font class="font-color-red">英文逗号</font>隔开</p>
						</div>
					</div><br />
					<div class="form-group">
						<label class="col-sm-2 control-label">主要市场：</label>
						<div class=" col-sm-9">
							<input class="col-sm-5 form-control" type="text" id="main-market" value="{{: data.mainMarket}}" placeholder="请输入主要市场" required/>
							<p class="help-block">如果有多个，以
								<font class="font-color-red">英文逗号</font>隔开</p>
						</div>
					</div><br />
					<div class="form-group">
						<label class="col-sm-2 control-label">品牌名称：</label>
						<div class=" col-sm-9">
							<input class="col-sm-5 form-control" type="text" id="brand" value="{{: data.brand}}" placeholder="请输入品牌名称" required/>
						</div>
					</div><br />
					<div class="form-group">
						<label class="col-sm-2 control-label">公司规模：</label>
						<div class=" col-sm-9">
							<input class="col-sm-5 form-control" type="text" id="employees" value="{{: data.employees}}" placeholder="请输入公司规模" required/>
						</div>
					</div><br />
					<div class="form-group">
						<label class="col-sm-2 control-label">成立时间：</label>
						<div class=" col-sm-9">
							<input class="col-sm-5 form-control" type="text" id="established" value="{{: data.established}}" placeholder="请输入成立时间" required/>
						</div>
					</div><br />
					<div class="form-group">
						<label class="col-sm-2 control-label">出口率：</label>
						<div class=" col-sm-9">
							<input class="col-sm-5 form-control" type="text" id="export" value="{{: data.export}}" placeholder="请输入出口率" required/>
							<p class="help-block">例： 20% - 30%</p>
						</div>
					</div><br />
					<div class="form-group">
						<label class="col-sm-2 control-label">公司简介：</label>
						<div class=" col-sm-9">
							<textarea class="col-sm-5 form-control" rows="6" cols="20" id="introduction">{{: data.introduction}}</textarea>
						</div>
					</div><br />
					<div class="form-group">
						<label class="col-sm-2 control-label">公司历史：</label>
						<div class=" col-sm-9">
							<textarea class="col-sm-5 form-control" rows="6" cols="20" id="history">{{: data.history}}</textarea>
						</div>
					</div><br />
					<div class="form-group">
						<label class="col-sm-2 control-label">服务：</label>
						<div class=" col-sm-9">
							<textarea class="col-sm-5 form-control" rows="6" cols="20" id="service">{{: data.service}}</textarea>
						</div>
					</div><br />
					<div class="form-group">
						<label class="col-sm-2 control-label">我们的团队：</label>
						<div class=" col-sm-9">
							<textarea class="col-sm-5 form-control" rows="6" cols="20" id="team">{{: data.team}}</textarea>
						</div>
					</div><br />
					<div class="form-group">
						<label class="col-sm-2 control-label">公司图片：</label>
						<div class="col-sm-9">
							<div class="row">
								<div class="col-sm-12">
									<div class="col-sm-3">
										<a href="javasrcipt:void(0)" class="file-input">
											<input type="file" class="input-picture company-picture" multiple accept="image/jpg,image/jpeg,image/png,image/gif" /> 添加图片
										</a>
									</div>
									<span class="help-block">建议使用<font class="font-color-red">7：5</font>比例，<font class="font-color-red">600</font>像素以上，<font class="font-color-red">JPG</font>、<font class="font-color-red">JPEG</font>格式，<font class="font-color-red">200k</font>以下</span>
								</div>
								<div class="row company-pictures">
								    {{for data.pictures}}
                                        <div class="picture-box">
                                            <img class="img-thumbnail picture" src="{{: #data}}"/>
                                            <a href="javascript:void(0)" class="remove url">
                                                <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                        </div>
								    {{/for}}
								</div>
							</div>
						</div>
					</div><br/>
					<div class="form-group">
						<div class="col-sm-12 text-center">
							<button class="btn btn-primary" id="btn-aboutus-submit">确认修改</button>
						</div>
					</div><br />
				</form>
			</div>
		</script>
        <script type="text/x-jsrender" id="template-product-update">
			<div class="col-md-10">
				<center>
					<h1>编辑产品</h1><br />
					<h3 style="color: orangered;font-weight: 400;">提示：发布描述丰富的产品信息，编写符合规范的产品标题，并配置多张不同角度的图片，更有利于获得买家青睐！</h3><br />
				</center>
			</div>
			<div class="col-md-10">
				<form class="form-horizontal" role="form">
					<fieldset>
						<legend>
							<font class="col-sm-2">基本信息</font>
							<font class="col-sm-10 legend-desc">产品基础资料，对买家找到您的贸易通网站非常重要</font>
						</legend>
						<div class="form-group">
							<label class="col-sm-2 control-label">产品分类:</label>
							<div class="col-sm-7">
								<select class="form-control" id="category">
									{{for categories.data}}
										{{if id == ~root.product.category.id}}
											<option value="{{:id}}" selected="selected">{{:categoryName}}</option>
										{{else}}
											<option value="{{:id}}">{{:categoryName}}</option>
									{{/for}}
								</select>
							</div>
							<div class="col-sm-2">
								<button class="btn btn-sm btn-warning" id="btn-category-add">新建分类</button>
							</div>
						</div><br /><br />
						<div class="form-group">
							<label class="col-sm-2 control-label">关键词：</label>
							<div class="col-sm-10 ">
								<div class="col-sm-4">
									<input class="col-sm-12 form-control" type="text" id="tag1" value="{{product.tag1}}"/>
								</div>
								<div class="col-sm-4">
									<input class="col-sm-12 form-control" type="text" id="tag2" value="{{product.tag2}}"/>
								</div>
								<div class="col-sm-4">
									<input class="col-sm-12 form-control" type="text" id="tag3" value="{{product.tag3}}"/>
								</div>
								<p class="col-sm-12 help-block">每一个文本框一个，最多三个；为避免使用过于宽泛的关键词，建议使用3个字及以上的关键词</p>
								<p class="col-sm-12 help-block font-color-red">关键词过于宽泛，将不利于您的贸易通推广效果</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">产品图片：</label>
							<div class="col-sm-10 ">
								<div class="row">
									<div class="col-sm-12">
										<div class="col-sm-3">
											<a href="javasrcipt:void(0)" class="file-input">
												<input type="file" id="js-file" multiple accept="image/jpg,image/jpeg,image/png,image/gif" /> 添加图片
											</a>
										</div>
										<span class="help-block">建议使用<font class="font-color-red">7：5</font>比例，<font class="font-color-red">600</font>像素以上，<font class="font-color-red">JPG</font>、<font class="font-color-red">JPEG</font>格式，<font class="font-color-red">200k</font>以下</span>
									</div>
									<div class="row files">
									</div>
								</div>
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>
							<font class="col-sm-2">产品属性</font>
							<font class="col-sm-10 legend-desc">完整填写将有助于买家找到并了解您的产品</font>
						</legend>
						<div class="form-group">
							<label class="col-sm-2 col-sm-offset-1 control-label">品牌：</label>
							<div class=" col-sm-8">
								<input class="col-sm-5 form-control" type="text" id="brand-name" value="{{product.brandName}}" placeholder="请输入品牌" required/>
							</div>
						</div><br />
						<div class="form-group">
							<label class="col-sm-2 col-sm-offset-1 control-label">型号：</label>
							<div class=" col-sm-8">
								<input class="col-sm-5 form-control" type="text" id="model-number" value="{{product.modelNumber}}" placeholder="请输入型号" required/>
							</div>
						</div><br />
						<div class="form-group">
							<label class="col-sm-2 col-sm-offset-1 control-label">认证证书：</label>
							<div class=" col-sm-8">
								<input class="col-sm-5 form-control" type="text" id="certification" value="{{product.certification}}" placeholder="请输入证书" required/>
							</div>
						</div><br />
						<div class="form-group">
							<label class="col-sm-2 col-sm-offset-1 control-label">原产地：</label>
							<div class=" col-sm-8">
								<input class="col-sm-5 form-control" type="text" id="place-of-origin" value="{{product.placeOfOrigin}}" placeholder="请输入原产地" required/>
							</div>
						</div><br />
					</fieldset><br />
					<fieldset class="col-sm-offset-1 custom-properties">
						<legend class="second">自定义属性：</legend>
						<div class="form-group">
							<label class="col-sm-4 col-sm-offset-1"><a href="javascript:void(0)" id="btn-property-add"><i class="glyphicon glyphicon-plus" >添加</i></a></label>
							<label class="col-sm-7 ">属性名和属性值必须同时输入</label>
						</div>
						{{props product.customProperties}}
							<div class="form-group custom-property">
								<div class="col-sm-3 col-sm-offset-1"><input type="text" class="form-control col-sm-11 property-name" value="{{#key}}" required placeholder="属性名" /></div>
								<div class=" col-sm-6">
									<input type="text" class="form-control property-value" value="{{#prop}}" required placeholder="属性值" />
								</div>
								<a class="col-sm-2 btn-property-delete" href="javascript:void(0)"><i class="glyphicon glyphicon-minus" >删除</i></a>
							</div>
						{{/props}}
					</fieldset>
					<fieldset>
						<legend>
							<font class="col-sm-2">交易信息</font>
							<font class="col-sm-10 legend-desc">完善交易信息，方便买家做出采购决定</font>
						</legend>
						<div class="form-group">
							<label class="col-sm-2 control-label">最小起订量：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" value="{{product.minOrderQty}}" required placeholder="1,000 pcs" id="min-order-qty" />
								<p class="help-block">请同时填写数值和单位，建议填写方式为：数量 + 单位，例：1,000 pcs</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">价格：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" value="{{product.price}}" type="text" required placeholder="$0.99~$1.55" id="price" />
								<p class="help-block">请同时填写数值和单位，建议填写方式为：货币类型 + 价格区间 + 计量单位，例：$0.99~$1.55</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">付款方式：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" value="{{product.paymentTerms}}" required placeholder="T/T, Western Union" id="payment" />
								<div class="col-sm-12 padding-top-7">
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">L/C</a>
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">D/A</a>
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">D/P</a>
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">T/T</a>
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">Western Union</a>
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">Monery Gram</a>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">供货能力：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" value="{{product.supplyAbility}}" required placeholder="5,000,000pcs per month" id="supply-ability" />
								<p class="help-block">请同时填写数值和单位，建议填写方式为：数量 + 计量单位 + per 时间单位， 例：5,000,000pcs per month</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">发货期限：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" value="{{product.deliveryTime}}" required placeholder="5-8 work days" id="delivery-time" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">常规包装：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" value="{{product.packagingDetail}}" required placeholder="Packed in plastic bag or carton" id="packaging-detail" />
								<p class="help-block">建议填写包装形式、尺寸，各类集装箱能装载的产品件数等信息，便于买家了解</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">产品名称：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" value="{{product.productName}}" required placeholder="请输入产品名称" id="product-name" />
								<p class="help-block">建议包含分类名，并包含2-3个规格、材质、颜色等，长度建议60-80个字，便于买家了解</p>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">产品描述：</label><br /><br />
							<div class="col-sm-11 col-sm-offset-1">
								<textarea id="productContent" name="productContent" rows="20" cols="15" class="ckeditor"></textarea>
							</div>
						</div>
						<br /><br />
						<div class="form-group">
							<div class="col-sm-11 col-sm-offset-1">
								高质量的产品信息将更容易获得曝光和询盘！想知道产品内容是否需要优化吗？马上检测一下吧。&nbsp;&nbsp;
								<button class="btn btn-sm btn-warning" id="btn-product-add-check">信息质量检测</button>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-11 col-sm-offset-1">
								<div class="col-sm-5 text-right">
									<button class="btn btn-warning " id="btn-product-add-submit">完成</button>
								</div>
								<div class="col-sm-5 text-left">
									<button class="btn btn-primary" id="btn-product-add-submit-view">保存并预览</button>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</script>
        <script type="text/x-jsrender" id="template-product-list-advice">
			<div class="col-md-10">
				<center>
					<h1>产品列表</h1><br />
					<h3 style="color: orangered;font-weight: 400;">提示：先选择类别，再勾选产品，每个类别只能勾选5个哦</h3><br />
				</center>
			</div>
			<div class="col-sm-10">
				<div class="col-sm-12">
					<form role="form" class="form-inline">
						<div class="form-group col-sm-9">
							<select class="form-control col-sm-10" id="advice-category">
								<option value="0">首页推荐栏</option>
								{{for categories.data}}
									{{if id == ~root.search.category}}
										<option value="{{:id}}" selected="selected">{{:categoryName}}</option>
									{{else}}
										<option value="{{:id}}">{{:categoryName}}</option>
									{{/if}}
								{{/for}}
							</select>
						</div>
						<div class="form-group col-sm-3">
							<button class="btn btn-primary" id="btn-advice-update">确认修改</button>
						</div>
					</form><br /><br />
					<hr />
				</div>
				<div class="bbox box-advice col-sm-12" id="product-list-advice">
					{{for pageInfo.list}}
						<div class="col-sm-12 padding-top padding-left-right-0">
							<input type="hidden" value="{{:id}}" class="product-list-id" />
							<div class="col-sm-3 col-md-2 padding-left-right-5">
								<a href="javascript:void(0)" class="product">
									<img class="product-list-img" src="{{:pictures[0]}}
									"/>
								</a>
							</div>
							<div class="col-sm-9 col-md-10">
								<div class="col-sm-12">
									<div class="col-sm-9 padding-left-none">
										<p>
											<a href="javascript:void(0)" class="product">
												<font class="product-list-name">{{:productName}}</font>
											</a>
										</p>
									</div>
									<div class="col-sm-3">
										<input type="checkbox" name="select-advice" value="{{:id}}"/>选入推荐栏
									</div>
								</div>
								<div class="col-sm-12">
									<p>
										{{:content}}
									</p>
								</div>
								<div class="col-sm-12">
									<p>{{:createTime}}</p>
								</div>
							</div>
						</div>
						<div class="col-sm-12 padding-left-right-0">
							<hr/>
						</div>
					{{/for}}
				</div>
			</div>
		</script>
        <script type="text/x-jsrender" id="template-product-list">
			<div class="col-md-10">
				<center>
					<h1>产品列表</h1><br />
					<h3 style="color: orangered;font-weight: 400;">提示：删除产品时，推荐栏的该产品也会删除哦！</h3><br />
				</center>
			</div>
			<div class="col-sm-10">
				<div class="col-sm-12">
					<form role="form" class="form-inline">
						<div class="form-group col-sm-4">
							<select class="form-control col-sm-10" id="product-list-category">
								<option value="0">All Categories</option>
								{{for categories.data}}
									{{if id == ~root.search.category}}
										<option value="{{:id}}" selected="selected">{{:categoryName}}</option>
									{{else}}
										<option value="{{:id}}">{{:categoryName}}</option>
									{{/if}}
								{{/for}}
							</select>
						</div>
						<div class="form-group col-sm-6">
							<input type="text" class="form-control " id="product-list-search" value="{{:search.name}}" style="width: 100%;" />
						</div>
						<div class="form-group col-sm-2">
							<button type="text" class="btn btn-sm btn-primary" id="btn-product-list-search">
								<i class="glyphicon glyphicon-search"></i>Search
							</button>
						</div>
					</form><br /><br />
					<hr />
				</div>
				<div class="bbox col-sm-12" id="product-list">
					{{for pageInfo.list}}
						<div class="col-sm-12 padding-top padding-left-right-0">
							<input type="hidden" value="{{:id}}" class="product-list-id" />
							<div class="col-sm-3 col-md-2 padding-left-right-5">
								<a href="javascript:void(0)" class="product">
									<img class="product-list-img" src="{{:pictures[0]}}"/>
								</a>
							</div>
							<div class="col-sm-9 col-md-10">
								<div class="col-sm-12">
									<div class="col-sm-10 padding-left-none">
										<p>
											<a href="javascript:void(0)" class="product">
												<font class="product-list-name">{{:productName}}</font>
											</a>
										</p>
									</div>
									<div class="col-sm-2">
										<button class="btn btn-sm btn-warning btn-product-list-del">删除本产品</button>
									</div>
								</div>
								<div class="col-sm-12">
									<p>
										{{:content}}
									</p>
								</div>
								<div class="col-sm-12">
									<p>{{:createTime}}</p>
								</div>
							</div>
						</div>
						<div class="col-sm-12 padding-left-right-0">
							<hr/>
						</div>
					{{/for}}
					<div class="col-sm-12" id="pages" class="">
						<center></center>
					</div>
				</div>
			</div>
		</script>

        <script type="text/x-jsrender" id="template-product-add">
			<div class="col-md-10">
				<center>
					<h1>发布新产品</h1><br />
					<h3 style="color: orangered;font-weight: 400;">提示：发布描述丰富的产品信息，编写符合规范的产品标题，并配置多张不同角度的图片，更有利于获得买家青睐！</h3><br />
				</center>
			</div>
			<div class="col-md-10">
				<form id="form-product-add" class="form-horizontal" role="form" enctype="multipart/form-data">
					<fieldset>
						<legend>
							<font class="col-sm-2">基本信息</font>
							<font class="col-sm-10 legend-desc">产品基础资料，对买家找到您的贸易通网站非常重要</font>
						</legend>
						<div class="form-group">
							<label class="col-sm-2 control-label">产品分类:</label>
							<div class="col-sm-7">
								<select class="form-control" id="category">
									{{for data}}
									<option value="{{:id}}">{{:categoryName}}</option>
									{{/for}}
								</select>
							</div>
							<div class="col-sm-2">
								<button class="btn btn-sm btn-warning" id="btn-category-add">新建分类</button>
							</div>
						</div><br /><br />
						<div class="form-group">
							<label class="col-sm-2 control-label">关键词：</label>
							<div class="col-sm-10 ">
								<div class="col-sm-4">
									<input class="col-sm-12 form-control" type="text" id="tag1" />
								</div>
								<div class="col-sm-4">
									<input class="col-sm-12 form-control" type="text" id="tag2" />
								</div>
								<div class="col-sm-4">
									<input class="col-sm-12 form-control" type="text" id="tag3" />
								</div>
								<p class="col-sm-12 help-block">每一个文本框一个，最多三个；为避免使用过于宽泛的关键词，建议使用3个字及以上的关键词</p>
								<p class="col-sm-12 help-block font-color-red">关键词过于宽泛，将不利于您的贸易通推广效果</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">产品图片：</label>
							<div class="col-sm-10 ">
								<div class="row">
									<div class="col-sm-12">
										<div class="col-sm-3">
											<a href="javasrcipt:void(0)" class="file-input">
												<input type="file" class="input-picture product-picture" multiple accept="image/jpg,image/jpeg,image/png,image/gif" /> 添加图片
											</a>
										</div>
										<span class="help-block">建议使用<font class="font-color-red">7：5</font>比例，<font class="font-color-red">600</font>像素以上，<font class="font-color-red">JPG</font>、<font class="font-color-red">JPEG</font>格式，<font class="font-color-red">200k</font>以下, 最多上传<font class="font-color-red">4</font>张</span>
									</div>
									<div class="col-sm-12 files">

									</div>
								</div>
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>
							<font class="col-sm-2">产品属性</font>
							<font class="col-sm-10 legend-desc">完整填写将有助于买家找到并了解您的产品</font>
						</legend>
						<div class="form-group">
							<label class="col-sm-2 col-sm-offset-1 control-label">品牌：</label>
							<div class=" col-sm-8">
								<input class="col-sm-5 form-control" type="text" id="brand-name" value="" placeholder="请输入品牌" required/>
							</div>
						</div><br />
						<div class="form-group">
							<label class="col-sm-2 col-sm-offset-1 control-label">型号：</label>
							<div class=" col-sm-8">
								<input class="col-sm-5 form-control" type="text" id="model-number" value="" placeholder="请输入型号" required/>
							</div>
						</div><br />
						<div class="form-group">
							<label class="col-sm-2 col-sm-offset-1 control-label">认证证书：</label>
							<div class=" col-sm-8">
								<input class="col-sm-5 form-control" type="text" id="certification" value="" placeholder="请输入证书" required/>
							</div>
						</div><br />
						<div class="form-group">
							<label class="col-sm-2 col-sm-offset-1 control-label">原产地：</label>
							<div class=" col-sm-8">
								<input class="col-sm-5 form-control" type="text" id="place-of-origin" value="" placeholder="请输入原产地" required/>
							</div>
						</div><br />
					</fieldset><br />
					<fieldset class="col-sm-offset-1 custom-properties">
						<legend class="second">自定义属性：</legend>
						<div class="form-group">
							<label class="col-sm-4 col-sm-offset-1"><a href="javascript:void(0)" id="btn-property-add"><i class="glyphicon glyphicon-plus" >添加</i></a></label>
							<label class="col-sm-7 ">属性名和属性值必须同时输入</label>
						</div>
					</fieldset>
					<fieldset>
						<legend>
							<font class="col-sm-2">交易信息</font>
							<font class="col-sm-10 legend-desc">完善交易信息，方便买家做出采购决定</font>
						</legend>
						<div class="form-group">
							<label class="col-sm-2 control-label">最小起订量：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" required placeholder="1,000 pcs" id="min-order-qty" />
								<p class="help-block">请同时填写数值和单位，建议填写方式为：数量 + 单位，例：1,000 pcs</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">价格：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" required placeholder="$0.99~$1.55" id="price" />
								<p class="help-block">请同时填写数值和单位，建议填写方式为：货币类型 + 价格区间 + 计量单位，例：$0.99~$1.55</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">付款方式：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" required placeholder="T/T, Western Union" id="payment" />
								<div class="col-sm-12 padding-top-7">
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">L/C</a>
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">D/A</a>
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">D/P</a>
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">T/T</a>
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">Western Union</a>
									<a class="btn btn-sm btn-info btn-payment" href="javascript:void(0)">Monery Gram</a>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">供货能力：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" required placeholder="5,000,000pcs per month" id="supply-ability" />
								<p class="help-block">请同时填写数值和单位，建议填写方式为：数量 + 计量单位 + per 时间单位， 例：5,000,000pcs per month</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">发货期限：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" required placeholder="5-8 work days" id="delivery-time" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">常规包装：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" required placeholder="Packed in plastic bag or carton" id="packaging-detail" />
								<p class="help-block">建议填写包装形式、尺寸，各类集装箱能装载的产品件数等信息，便于买家了解</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">产品名称：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" required placeholder="请输入产品名称" id="product-name" />
								<p class="help-block">建议包含分类名，并包含2-3个规格、材质、颜色等，长度建议60-80个字，便于买家了解</p>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">产品描述：</label><br /><br />
							<div class="col-sm-11 col-sm-offset-1">
								<textarea id="productContent" name="productContent" rows="20" cols="15" class="ckeditor"></textarea>
							</div>
						</div>
						<br /><br />
						<div class="form-group">
							<div class="col-sm-11 col-sm-offset-1">
								高质量的产品信息将更容易获得曝光和询盘！想知道产品内容是否需要优化吗？马上检测一下吧。&nbsp;&nbsp;
								<button class="btn btn-sm btn-warning" id="btn-product-add-check">信息质量检测</button>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-11 col-sm-offset-1">
								<div class="col-sm-5 text-right">
									<button class="btn btn-warning " id="btn-product-add-submit">完成</button>
								</div>
								<div class="col-sm-5 text-left">
									<button class="btn btn-primary" id="btn-product-add-submit-view">保存并预览</button>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</script>
        <script type="text/x-jsrender" id="template-custom-property">
			<div class="form-group custom-property">
				<div class="col-sm-3 col-sm-offset-1"><input type="text" class="form-control col-sm-11 property-name" required placeholder="属性名" /></div>
				<div class=" col-sm-6">
					<input type="text" class="form-control property-value" required placeholder="属性值" />
				</div>
				<a class="col-sm-2 btn-property-delete" href="javascript:void(0)"><i class="glyphicon glyphicon-minus" >删除</i></a>
			</div>
		</script>
        <script type="text/x-jsrender" id="template-user-edit">
			<div class="col-md-10">
				<center>
					<h1>个人信息修改</h1><br /><br />
				</center>
			</div>
			<div class="col-md-10">
				<form role="form" class="form-horizontal">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="username" required="required" placeholder="请输入用户名作为登陆名" value="${userInfo.username}">
							<input type="hidden" id="userid" value="${userInfo.id}">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">E-mail</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="email" required="required" placeholder="请输入邮箱" value="${userInfo.email}">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-7">
							<button id="btn-user-edit-submit" class="btn btn-default">确认修改</button>
						</div>
					</div>
				</form>
			</div>
		</script>
        <script type="text/x-jsrender" id="template-user-edit-pwd">
			<div class="col-md-10">
				<center>
					<h1>登陆密码修改</h1><br /><br />
				</center>
			</div>
			<div class="col-md-10">
				<form role="form" class="form-horizontal">
					<div class="form-group">
						<label for="firstpwd" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="firstpwd" required="required">
							<input type="hidden" id="userid" value="1001">
						</div>
					</div>
					<div class="form-group">
						<label for="lastpwd" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="lastpwd" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-7">
							<button id="btn-user-pwd-edit-submit" class="btn btn-default">确认修改</button>
						</div>
					</div>
				</form>
			</div>
		</script>
        <script type="text/x-jsrender" id="template-category-add">
			<div class="col-md-10">
				<center>
					<h1>产品类别添加</h1><br /><br />
				</center>
			</div>
			<div class="col-md-10">
				<form role="form" class="form-horizontal">
					<div class="form-group">
						<label for="categoryName" class="col-sm-2 control-label">类别名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="categoryName" required="required">
							<span class="remind">改类别已经存在</span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-7">
							<button class="btn btn-default" id="btn-category-add-submit">确认添加</button>
						</div>
					</div>
				</form>
			</div>
		</script>
		<script type="text/x-jsrender" id="template-email-list">
			<div class="col-md-10">
				<center>
					<h1>邮件列表</h1><br />
				</center>
			</div>
			<div class="col-sm-10">
				<div class="bbox col-sm-12">
					<table id="email-list" class="table table-condensed table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th align="center">主题</th>
								<th align="center">询盘人邮箱</th>
								<th align="center">状态</th>
								<th align="center">紧急</th>
								<th align="center">时间</th>
							</tr>
						</thead>
						<tbody>
							{{for pageInfo.list}}
								<tr>
									<input type="hidden" value="{{: id}}" class="email-list-id" />
									<td><a href="emails/{{:id}}/detail" target="_blank">{{: subject}}</a></td>
									<td align="center">{{: sender}}</td>
									<td align="center">{{: stateText}}</td>
									<td align="center">
										{{if urgent}}
											<span class="font-color-red">是</span>
										{{else}}
											否
										{{/if}}
									</td>
									<td align="center">{{: createTime}}</td>
								</tr>
							{{/for}}
						</tbody>
					</table>
					<div class="col-sm-12" id="pages" class="">
						<center></center>
					</div>
				</div>
			</div>
		</script>
        <script type="text/x-jsrender" id="template-category-list">
			<div class="col-md-10">
				<center>
					<h1>产品类别列表</h1><br />
					<h3 style="color: orangered;font-weight: 400;">注意：删除类别会把该类别下的产品一起删除，请谨慎删除！</h3><br />
				</center>
			</div>
			<div class="col-md-10">
				<table class="table table-striped table-bordered table-condensed">
					<tr align="center">
						<td>类别编号</td>
						<td>类别名称</td>
						<td>操作</td>
					</tr>
					{{for data}}
					<tr align="center">
						<td class="input-category-list-id">{{:id}}</td>
						<td>
							<input type="text" class="input-list input-category-list-name form-control" value="{{:categoryName}}" required="required" />
							<span class="hidden-category-name" style="display: none;">{{:categoryName}}</span>
							<span class="remind">该类别已存在</span>
						</td>
						<td>
							<button class="btn btn-sm btn-default btn-category-list-update disabled">修改</button>&nbsp;&nbsp;
							<button class="btn btn-sm btn-danger btn-category-list-del">删除</button>
						</td>
					</tr>
					{{/for}}
				</table>
			</div>
		</script>
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="resources/plugins/jsrender/jsrender.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="resources/js/extendPagination.js" type="text/javascript" charset="utf-8"></script>
        <script src="resources/js/ajaxfileupload.js" type="text/javascript" charset="utf-8"></script>
        <script src="resources/js/admin/index.js" type="text/javascript" charset="utf-8"></script>
</body>

</html>