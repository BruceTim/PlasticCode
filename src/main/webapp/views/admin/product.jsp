<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

    <head>
        <base href="<%=basePath%>">
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
        <div class="container-fluid">
            <div class="row">
                <input type="hidden"  value="${productId}" id="product-detail-id"/>
                <a href="" target="_blank" class="hidden" id="hidden-a"></a>
                <div id="product-content" class="col-md-12 bbox">

                </div>
            </div>
        </div>

        <script type="text/x-jsrender" id="template-custom-property">
			<div class="form-group custom-property">
				<div class="col-sm-3 col-sm-offset-1"><input type="text" class="form-control col-sm-11 property-name" required placeholder="属性名" /></div>
				<div class=" col-sm-6">
					<input type="text" class="form-control property-value" required placeholder="属性值" />
				</div>
				<a class="col-sm-2 btn-property-delete" href="javascript:void(0)"><i class="glyphicon glyphicon-minus" >删除</i></a>
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
				<form class="form-horizontal" role="form" id="form-product-update">
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
										<option value="{{:id}}">{{:categoryName}}</option>
									{{/for}}
								</select>
							</div>
						</div><br /><br />
						<div class="form-group">
							<label class="col-sm-2 control-label">关键词：</label>
							<div class="col-sm-10 ">
								<div class="col-sm-4">
									<input class="col-sm-12 form-control" type="text" id="tag1" value="{{:product.data.tag1}}"/>
								</div>
								<div class="col-sm-4">
									<input class="col-sm-12 form-control" type="text" id="tag2" value="{{:product.data.tag2}}"/>
								</div>
								<div class="col-sm-4">
									<input class="col-sm-12 form-control" type="text" id="tag3" value="{{:product.data.tag3}}"/>
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
										<span class="help-block">建议使用<font class="font-color-red">7：5</font>比例，<font class="font-color-red">600</font>像素以上，<font class="font-color-red">JPG</font>、<font class="font-color-red">JPEG</font>格式，<font class="font-color-red">200k</font>以下，最多上传<font class="font-color-red">4</font>张</span>
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
								<input class="col-sm-5 form-control" type="text" id="brand-name" value="{{:product.data.brandName}}" placeholder="请输入品牌" required/>
							</div>
						</div><br />
						<div class="form-group">
							<label class="col-sm-2 col-sm-offset-1 control-label">型号：</label>
							<div class=" col-sm-8">
								<input class="col-sm-5 form-control" type="text" id="model-number" value="{{:product.data.modelNumber}}" placeholder="请输入型号" required/>
							</div>
						</div><br />
						<div class="form-group">
							<label class="col-sm-2 col-sm-offset-1 control-label">认证证书：</label>
							<div class=" col-sm-8">
								<input class="col-sm-5 form-control" type="text" id="certification" value="{{:product.data.certification}}" placeholder="请输入证书" required/>
							</div>
						</div><br />
						<div class="form-group">
							<label class="col-sm-2 col-sm-offset-1 control-label">原产地：</label>
							<div class=" col-sm-8">
								<input class="col-sm-5 form-control" type="text" id="place-of-origin" value="{{:product.data.placeOfOrigin}}" placeholder="请输入原产地" required/>
							</div>
						</div><br />
					</fieldset><br />
					<fieldset class="col-sm-offset-1 custom-properties">
						<legend class="second">自定义属性：</legend>
						<div class="form-group">
							<label class="col-sm-4 col-sm-offset-1"><a href="javascript:void(0)" id="btn-property-add"><i class="glyphicon glyphicon-plus" >添加</i></a></label>
							<label class="col-sm-7 ">属性名和属性值必须同时输入</label>
						</div>
						{{props product.data.customProperties}}
							<div class="form-group custom-property">
								<div class="col-sm-3 col-sm-offset-1"><input type="text" class="form-control col-sm-11 property-name" value="{{:key}}" required placeholder="属性名" /></div>
								<div class=" col-sm-6">
									<input type="text" class="form-control property-value" value="{{:prop}}" required placeholder="属性值" />
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
								<input class="col-sm-12 form-control" type="text" value="{{:product.data.minOrderQty}}" required placeholder="1,000 pcs" id="min-order-qty" />
								<p class="help-block">请同时填写数值和单位，建议填写方式为：数量 + 单位，例：1,000 pcs</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">价格：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" value="{{:product.data.price}}" type="text" required placeholder="$0.99~$1.55" id="price" />
								<p class="help-block">请同时填写数值和单位，建议填写方式为：货币类型 + 价格区间 + 计量单位，例：$0.99~$1.55</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">付款方式：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" value="{{:product.data.paymentTerms}}" required placeholder="T/T, Western Union" id="payment" />
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
								<input class="col-sm-12 form-control" type="text" value="{{:product.data.supplyAbility}}" required placeholder="5,000,000pcs per month" id="supply-ability" />
								<p class="help-block">请同时填写数值和单位，建议填写方式为：数量 + 计量单位 + per 时间单位， 例：5,000,000pcs per month</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">发货期限：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" value="{{:product.data.deliveryTime}}" required placeholder="5-8 work days" id="delivery-time" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">常规包装：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" value="{{: product.data.packagingDetails}}" required placeholder="Packed in plastic bag or carton" id="packaging-detail" />
								<p class="help-block">建议填写包装形式、尺寸，各类集装箱能装载的产品件数等信息，便于买家了解</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">产品名称：</label>
							<div class=" col-sm-10">
								<input class="col-sm-12 form-control" type="text" value="{{: product.data.productName}}" required placeholder="请输入产品名称" id="product-name" />
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
								<button class="btn btn-sm btn-warning" id="btn-product-update-check">信息质量检测</button>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-11 col-sm-offset-1">
								<div class="col-sm-5 text-right">
									<button class="btn btn-warning " id="btn-product-update-submit">完成</button>
								</div>
								<div class="col-sm-5 text-left">
									<button class="btn btn-primary" id="btn-product-update-submit-view">保存并预览</button>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</script>
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="resources/plugins/jsrender/jsrender.min.js" type="text/javascript" charset="utf-8"></script>
        <%--<script src="resources/js/admin/index.js" type="text/javascript" charset="utf-8"></script>--%>
        <script src="resources/js/admin/product.js" type="text/javascript" charset="utf-8"></script>
    </body>

</html>
