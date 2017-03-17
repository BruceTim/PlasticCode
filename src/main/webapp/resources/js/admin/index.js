//图片重画
var pic_reset = function(drawImage,thumbs_size) {
	var max = thumbs_size.split(',');
	var fixwidth = max[0];
	var fixheight = max[1];
	w=drawImage.width;h=drawImage.height;
	hbak = h;
	if(w>fixwidth) { drawImage.width=fixwidth;drawImage.height=h/(w/fixwidth);hbak=drawImage.height;}
	if(hbak>fixheight) { drawImage.height=fixheight;drawImage.width=w/(h/fixheight);}
};
$(function() {
	if (!window.FormData) {
        alert('你的浏览器不支持FormData,请换较新版本的浏览器!');
    }
    if (!window.FileReader) {
        alert('你的浏览器不支持FileReader,请换较新版本的浏览器!');
    }
	var pictures = [];
    var pictureFiles = [];
	var payments = [];
	var pictureCount = 0;
	var companyInfo = {
		company : {
			pictures : new Array(),
			pictureUrls : new Array(),
			files : new Array()
		},
		factory : {
			productLine : {
				pictures : new Array(),
				pictureUrls : new Array(),
				files : new Array()
			},
			OEM : {
				pictures : new Array(),
				pictureUrls : new Array(),
				files : new Array()
			},
			RD : {
				pictures : new Array(),
				pictureUrls : new Array(),
				files : new Array()
			},
			factory : {
				pictures : new Array(),
				pictureUrls : new Array(),
				files : new Array()
			}
		}
	};

	var pictureHanlder = {
		add : function ($DOM, files) {

			// 允许上传的图片类型
			var allowTypes = ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'];
			// 512KB，也就是 0.5MB
			var maxSize = 1024 * 512;

			// 如果没有选中文件，直接返回
			if (files.length === 0) {
				return;
			}
			$.each(files, function(index,file) {

				index ++;
				var reader = new FileReader();
				// 如果类型不在允许的类型范围内
				if (allowTypes.indexOf(file.type) === -1) {
					alert('第'+ index +'个的文件类型不对');
					return true;
				}

				if (file.size > maxSize) {
					alert('第'+ index +'个图片太大，不允许上传');
					return true;
				}
				reader.readAsDataURL(file);
				reader.onload = function(e) {
					if ($DOM.hasClass('product-picture')) {
						if(pictureCount >= 4) {
							alert('最多上传4张图片哦！');
							return false;
						}
						pictureCount ++;
						var length = pictures.length;
						pictures.push(this.result);
						pictureFiles.push(file);
						if (pictures.length > length) {
							$('.files').append('<div class="picture-box"><img class="img-thumbnail picture" src="'+ this.result +'"/><a href="javascript:void(0)" class="remove"><i class="glyphicon glyphicon-remove"></i></a></div>');
						}
					} else if ($DOM.hasClass('company-picture')) {
						var length = companyInfo.company.pictures.length;
						companyInfo.company.pictures.push(this.result);
						companyInfo.company.files.push(file);
						if (companyInfo.company.pictures.length > length) {
							$('.company-pictures').append('<div class="picture-box"><img class="img-thumbnail picture" src="'+ this.result +'"/><a href="javascript:void(0)" class="remove"><i class="glyphicon glyphicon-remove"></i></a></div>');
						}
					} else if ($DOM.hasClass('productLine-picture')) {
						var length = companyInfo.factory.productLine.pictures.length;
						companyInfo.factory.productLine.pictures.push(this.result);
						companyInfo.factory.productLine.files.push(file);
						if (companyInfo.factory.productLine.pictures.length > length) {
							$('.productLine-pictures').append('<div class="picture-box"><img class="img-thumbnail picture" src="'+ this.result +'"/><a href="javascript:void(0)" class="remove"><i class="glyphicon glyphicon-remove"></i></a></div>');
						}
					} else if ($DOM.hasClass('OEM-picture')) {
						var length = companyInfo.factory.OEM.pictures.length;
						companyInfo.factory.OEM.pictures.push(this.result);
						companyInfo.factory.OEM.files.push(file);
						if (companyInfo.factory.OEM.pictures.length > length) {
							$('.OEM-pictures').append('<div class="picture-box"><img class="img-thumbnail picture" src="'+ this.result +'"/><a href="javascript:void(0)" class="remove"><i class="glyphicon glyphicon-remove"></i></a></div>');
						}
					} else if ($DOM.hasClass('RD-picture')) {
						var length = companyInfo.factory.RD.pictures.length;
						companyInfo.factory.RD.pictures.push(this.result);
						companyInfo.factory.RD.files.push(file);
						if (companyInfo.factory.RD.pictures.length > length) {
							$('.RD-pictures').append('<div class="picture-box"><img class="img-thumbnail picture" src="'+ this.result +'"/><a href="javascript:void(0)" class="remove"><i class="glyphicon glyphicon-remove"></i></a></div>');
						}
					} else if ($DOM.hasClass('factory-picture')) {
						var length = companyInfo.factory.factory.pictures.length;
						companyInfo.factory.factory.pictures.push(this.result);
						companyInfo.factory.factory.files.push(file);
						if (companyInfo.factory.factory.pictures.length > length) {
							$('.factory-pictures').append('<div class="picture-box"><img class="img-thumbnail picture" src="'+ this.result +'"/><a href="javascript:void(0)" class="remove"><i class="glyphicon glyphicon-remove"></i></a></div>');
						}
					} else if ($DOM.hasClass('certification-picture')) {
						$('.certification-pictures').html('<div class="picture-box2"><img class="img-thumbnail picture" src="'+ this.result +'"/><a href="javascript:void(0)" class="remove"><i class="glyphicon glyphicon-remove"></i></a></div>');
					}
				};
			});
		},
		remove : function ($this) {
			var $parent = $this.parent().parent();
			if ($parent.hasClass('company-pictures')) {
				if ($this.hasClass('url')) {
					companyInfo.company.pictureUrls.splice($parent.find('.remove.url').index($this),1);
				} else {
					companyInfo.company.pictures.splice($parent.find('.remove').not('.url').index($this),1);
					companyInfo.company.files.splice($parent.find('.remove').not('.url').index($this),1);
				}
				$($parent.find('.picture-box').get($parent.find('.remove').index($this))).remove();
			} else if ($parent.hasClass('files')) {
				var i = $parent.find('.remove').index($this);
				pictures.splice(i,1);
				pictureFiles.splice(i,1);
				pictureCount--;
				$($parent.find('.picture-box').get(i)).remove();
			} else if ($parent.hasClass('productLine-pictures')) {
				if ($this.hasClass('url')) {
					companyInfo.factory.productLine.pictureUrls.splice($parent.find('.remove.url').index($this), 1);
				} else {
					companyInfo.factory.productLine.pictures.splice($parent.find('.remove').not('.url').index($this), 1);
					companyInfo.factory.productLine.files.splice($parent.find('.remove').not('.url').index($this), 1);
				}
				$($parent.find('.picture-box').get($parent.find('.remove').index($this))).remove();
			} else if ($parent.hasClass('OEM-pictures')) {
				if ($this.hasClass('url')) {
					companyInfo.factory.OEM.pictureUrls.splice($parent.find('.remove.url').index($this), 1);
				} else {
					companyInfo.factory.OEM.pictures.splice($parent.find('.remove').not('.url').index($this), 1);
					companyInfo.factory.OEM.files.splice($parent.find('.remove').not('.url').index($this), 1);
				}
				$($parent.find('.picture-box').get($parent.find('.remove').index($this))).remove();
			} else if ($parent.hasClass('RD-pictures')) {
				if ($this.hasClass('url')) {
					companyInfo.factory.RD.pictureUrls.splice($parent.find('.remove.url').index($this), 1);
				} else {
					companyInfo.factory.RD.pictures.splice($parent.find('.remove').not('.url').index($this), 1);
					companyInfo.factory.RD.files.splice($parent.find('.remove').not('.url').index($this), 1);
				}
				$($parent.find('.picture-box').get($parent.find('.remove').index($this))).remove();
			} else if ($parent.hasClass('factory-pictures')) {
				if ($this.hasClass('url')) {
					companyInfo.factory.factory.pictureUrls.splice($parent.find('.remove.url').index($this), 1);
				} else {
					companyInfo.factory.factory.pictures.splice($parent.find('.remove').not('.url').index($this), 1);
					companyInfo.factory.factory.files.splice($parent.find('.remove').not('.url').index($this), 1);
				}
				$($parent.find('.picture-box').get($parent.find('.remove').index($this))).remove();
			} else if ($parent.hasClass('certification-pictures')) {
				$parent.empty();
				$('.certification-picture').val('');
			}
		}
	};

	var product_edit = {
		check : function () {
			var tag1 = $('#tag1').val();
			var tag2 = $('#tag2').val();
			var tag3 = $('#tag3').val();
			var brandName = $('#brand-name').val();
			var modelNumber = $('#model-number').val();
			var certification = $('#certification').val();
			var placeOfOrigin = $('#place-of-origin').val();
			var minOrderQty = $('#min-order-qty').val();
			var price = $('#price').val();
			var payment = $('#payment').val();
			var supplyAbliity = $('#supply-ability').val();
			var deliveryTime = $('#delivery-time').val();
			var packaging = $('#packaging-detail').val();
			var propertyName = [];
			$.each($('.custom-properties .property-name'), function(index, ele) {
				propertyName.push($(ele).val());
			});
			var propertyValue = [];
			$.each($('.custom-properties .property-value'), function(index, ele) {
				propertyValue.push($(ele).val());
			});
			var productName = $('#product-name').val();
			var content = CKEDITOR.instances.productContent.document.getBody().getText();
			var descrition = CKEDITOR.instances.productContent.getData();
			
			if (tag1.trim() == '' && tag2.trim() == '' && tag3.trim() == '') {
				alert('输入关键词，将更利于您的贸易通推广效果哦！');
				return false;
			}
			
			if (brandName.trim() == '') {
				alert('请输入品牌名哦！');
				return false;
			}
			if (modelNumber.trim() == '') {
				alert('请输入型号哦！');
				return false;
			}
			if (certification.trim() == '') {
				alert('请输入认证证书哦！');
				return false;
			}
			if (placeOfOrigin.trim() == '') {
				alert('请输入原产地哦！');
				return false;
			}
			if (minOrderQty.trim() == '') {
				alert('请输入最小起订量哦！');
				return false;
			}
			if (price.trim() == '') {
				alert('请输入价格哦！');
				return false;
			}
			if (payment.trim() == '') {
				alert('请输入付款方式哦！');
				return false;
			}
			if (supplyAbliity.trim() == '') {
				alert('请输入供货能力哦！');
				return false;
			}
			if (deliveryTime.trim() == '') {
				alert('请输入发货期限哦！');
				return false;
			}
			if (packaging.trim() == '') {
				alert('请输入常规包装哦！');
				return false;
			}
			if (productName.trim() == '') {
				alert('请输入产品名称哦！');
				return false;
			}
			for (var i=0;i<propertyName.length;i++) {
				if (propertyName[i].trim() == '' || propertyValue[i].trim() == '') {
					alert('自定义属性属性名和属性值要同时输入哦');
					return false;
				}
			}
			if (pictures.length == 0) {
				alert('请上传一下不同角度的产品图片哦！');
				return false;
			}
			return true;
		},
		product_add : function (type) {
			if(product_edit.check()) {

                var formData = new FormData($('#form-product-add')[0]);

				var categoryId = $('#category').val();
                formData.append('category.id', categoryId);
				var tag1 = $('#tag1').val().replace(/\s+/g, ' ');
                formData.append('tag1', tag1);
				var tag2 = $('#tag2').val().replace(/\s+/g, ' ');
                formData.append('tag2', tag2);
				var tag3 = $('#tag3').val().replace(/\s+/g, ' ');
                formData.append('tag3', tag3);
				var brandName = $('#brand-name').val();
                formData.append('brandName', brandName);
				var modelNumber = $('#model-number').val();
                formData.append('modelNumber', modelNumber);
				var certification = $('#certification').val();
                formData.append('certification', certification);
				var placeOfOrigin = $('#place-of-origin').val();
                formData.append('placeOfOrigin', placeOfOrigin);
				var minOrderQty = $('#min-order-qty').val();
                formData.append('minOrderQty', minOrderQty);
				var price = $('#price').val();
                formData.append('price', price);
				var payment = $('#payment').val();
                formData.append('paymentTerms', payment);
				var supplyAbliity = $('#supply-ability').val();
                formData.append('supplyAbility', supplyAbliity);
				var deliveryTime = $('#delivery-time').val();
                formData.append('deliveryTime', deliveryTime);
				var packaging = $('#packaging-detail').val();
                formData.append('packagingDetails', packaging);
				var propertyName = [];
				$.each($('.custom-properties .property-name'), function(index, ele) {
					propertyName.push($(ele).val());
				});
				var propertyValue = [];
				$.each($('.custom-properties .property-value'), function(index, ele) {
					propertyValue.push($(ele).val());
				});
				var productName = $('#product-name').val();
                formData.append('productName', productName);
				var content = CKEDITOR.instances.productContent.document.getBody().getText();
                formData.append('content', content);
				var description = CKEDITOR.instances.productContent.getData();
                // var blob = new Blob([description], { type: "text/html"});
                formData.append('description', description);
                var customProperties = {};
                $.each(propertyName, function(index, name) {
                    customProperties[name] = propertyValue[index];
                });
                formData.append('customProperties', JSON.stringify(customProperties));
                $.each(pictureFiles, function (index, file) {
                    formData.append('file', file);
                });
                $.ajax({
                    async : false,
                    url: 'products',
                    type: 'POST',
                    cache: false,
                    data: formData,
                    processData: false,
                    contentType: false,
                    dataType : 'json',
                    success : function (res) {
                        if (res.success) {
                            if (type == 1) {
                                alert('添加成功！');
                            } else if(type == 2){
                                alert('添加成功！');
                                $('#hidden-a').attr('href', 'products/' + res.data + '/view');
                                $('#hidden-a').click();
                            }
                        } else {
                        	if(res.statusCode == 100001){
                        		location.href = 'admin/login';
							} else if(res.statusCode == 404){
								location.href = '404';
							} else if(res.statusCode == 500){
								location.href = '500';
							}
						}
                    }
                });
            }
		}
	};
	
	var categories = {};
	$.ajax({
		type:"get",
		url:"categories",
		dataType : 'json',
		async:true,
		success : function (data) {
			categories = data;
		}
	});
	var loadProductByCategory = function(cateid){
		var result = {
				search : {
					category : cateid
				},
				categories : categories,
				pageInfo : {
					
				}
		};
		$.ajax({
			type:'get',
			url:'products/categories/' + cateid + '?pageNum=1&pageSize=200',
			dataType : 'json',
			async:true,
			success : function (data) {
				if (data.success) {
					result.pageInfo = data.data;
					var html = $('#template-product-list-advice').render(result);
					$('#main-content').html(html);
					$.ajax({
						type:'get',
						url:'products/categories/' + cateid + '/advices',
						dataType : 'json',
						async:true,
						success : function (adviceData) {
							if(adviceData.success){
//								$('#advice-category').val(cateid);
								$.each(adviceData.data, function(i, product){
									$.each($('input[name="select-advice"]'), function(j, advice){
										if($(advice).val() == product.id){
											$(advice).attr('checked', 'true');
											return false;
										}
									});
								});
							}
						}
					});
				}
			}
		});
	};
	$('#main-content').on('change', '.input-picture', function (event) {
        var files = event.target.files;
		pictureHanlder.add($(this), files);

	}).on('click', '.remove', function(){
		var $this = $(this);
		pictureHanlder.remove($this);
	}).on('click', '#btn-property-add', function() {
		var html = $('#template-custom-property').html();
		$('.custom-properties').append(html);
	}).on('click', '.btn-property-delete', function () {
		var i = $('.custom-properties .btn-property-delete').index($(this));
		$($('.custom-properties .custom-property').get(i)).remove();
	}).on('click', '.btn-payment', function () {
		var content = $('#payment').val();
		if (content != '') {
			payments = content.split(',');
		} else {
			payments = [];
		}
		var value = $(this).html();
		payments.push(value);
		var payment = '';
		$.each(payments, function(index, data) {
			payment += data + ',';
		});
		payment = payment.substr(0, payment.length - 1);
		$('#payment').val(payment);
	}).on('click', '#btn-product-add-check', function () {
		
		if (product_edit.check()){
			alert('还不错，可以点击完成进行提交了');
			return false;
		}
	}).on('click', '#btn-product-add-submit', function () {
		$(this).addClass('disabled');
		$('#btn-product-add-submit-view').addClass('disabled');
		product_edit.product_add(1);
		$(this).removeClass('disabled');
		$('#btn-product-add-submit-view').removeClass('disabled');
        return false;
	}).on('click', '#btn-product-add-submit-view', function () {
		$('#btn-product-add-submit').addClass('disabled');
		$(this).addClass('disabled');
		product_edit.product_add(2);
		$('#btn-product-add-submit').removeClass('disabled');
		$(this).removeClass('disabled');
        return false;
	}).on('click', '#btn-user-edit-submit', function () {
		var user1  = {
			id : $('#main-content #userid').val(),
			username : $('#main-content #username').val(),
			email : $('#main-content #email').val()
		};
		$.ajax({
			type:"put",
			url:"users/" + user1.id,
			dataType : 'json',
			async:true,
			data: user1,
			success: function (result) {
				if (result.success) {
					alert(result.message);
				} else {
					if(result.statusCode == 100001){
						location.href = 'admin/login';
					} else if(result.statusCode == 404){
						location.href = '404';
					} else if(result.statusCode == 500){
						location.href = '500';
					}
				}
			}
		});
		return false;
	}).on('click', '#btn-user-pwd-edit-submit', function () {
		var password1 = $('#firstpwd').val();
		var password2 = $('#lastpwd').val();
		if (password1 != password2) {
			alert('两次密码必须一致！');
			return false;
		} else {
			var userid = $('#userid').val();
			$.ajax({
				type:"put",
				url:"users/" + userid,
				dataType : 'json',
				async:true,
				data: {
					id : userid,
					password : password1
				},
				success: function (result) {
					if (result.success) {
						alert('密码修改成功，请重新登录');
						location.href = 'admin/login'
					} else {
						if(result.statusCode == 100001){
							location.href = 'admin/login';
						} else if(result.statusCode == 404){
							location.href = '404';
						} else if(result.statusCode == 500){
							location.href = '500';
						}
					}
				}
			});
		}
		return false;
	}).on('focusout', '#categoryName', function(){
		var name = $(this).val();
		if (name != '') {
			$.ajax({
				type:"post",
				dataType : 'json',
				url:"categories/checking",
				data: {
					categoryName : name
				},
				async:true,
				success: function(result){
					if(!result.success){
						if(result.statusCode == 100001){
							location.href = 'admin/login';
						} else if(result.statusCode == 404){
							location.href = '404';
						} else if(result.statusCode == 500){
							location.href = '500';
						}else {
							$('#main-content .remind').show();
							$('#main-content #btn-category-add-submit').addClass('disabled');
						}
					} else {
						$('#main-content .remind').hide();
						$('#main-content #btn-category-add-submit').removeClass('disabled');
					}
				}
			});
		}
	}).on('click', '#btn-category-add-submit', function () {
		$(this).addClass('disabled');
		var category = {
			categoryName : $('#main-content #categoryName').val()
		};
		if (category.categoryName != '') {
			$.ajax({
				type:"post",
				dataType : 'json',
				url:"categories/checking",
				data: category,
				async:true,
				success: function(result){
					if(!result.success){
						if(result.statusCode == 100001){
							location.href = 'admin/login';
						} else if(result.statusCode == 404){
							location.href = '404';
						} else if(result.statusCode == 500){
							location.href = '500';
						}else {
							$('#main-content .remind').show();
							$('#main-content #btn-category-add-submit').addClass('disabled');
						}
					} else {
						$.ajax({
							type: "post",
							url: "categories",
							dataType: 'json',
							data: category,
							async: true,
							success: function (res) {
								if (res.success) {
									alert('添加成功');
									$.ajax({
										type: "get",
										url: "categories",
										dataType: 'json',
										async: true,
										success: function (data) {
											categories = data;
										}
									});
								} else {
									if(res.statusCode == 100001){
										location.href = 'admin/login';
									} else if(res.statusCode == 404){
										location.href = '404';
									} else if(res.statusCode == 500){
										location.href = '500';
									}
								}
								$('#main-content #btn-category-add-submit').removeClass('disabled');
							}
						});
					}
				}
			});
		};
		return false;
	}).on('click', '.btn-category-list-update', function(){
		
		var i = $('.btn-category-list-update').index($(this));
		var category = {
			id : $($('#main-content .input-category-list-id').get(i)).text(),
			categoryName : $($('#main-content .input-category-list-name').get(i)).val()
		};
		$.ajax({
			type:"put",
			url:"categories/" + category.id,
			dataType : 'json',
			async:true,
			data : category,
			success: function(result){
				if(result.success) {
					alert(result.message);
					categories[i] = category;
					$($('#main-content .hidden-category-name').get(i)).text(category.categoryName);
				} else {
					if(result.statusCode == 100001){
						location.href = 'admin/login';
					} else if(result.statusCode == 404){
						location.href = '404';
					} else if(result.statusCode == 500){
						location.href = '500';
					}
				}
			}
		});
		return false;
	}).on('click', '.btn-category-list-del', function(){
		var i = $('.btn-category-list-del').index($(this));
		var id = $($('#main-content .input-category-list-id').get(i)).text();
		$.ajax({
			type:"delete",
			url:"categories/" + id,
			dataType : 'json',
			async:true,
			success: function(result){
				alert(result.message);
				if (result.success) {
					categories.splice(i);
				} else {
					if(result.statusCode == 100001){
						location.href = 'admin/login';
					} else if(result.statusCode == 404){
						location.href = '404';
					} else if(result.statusCode == 500){
						location.href = '500';
					}
				}
			}
		});
		$('#nav-btn-category-list').click();
	}).on('focusout', '.input-category-list-name', function(){
		var i = $('.input-category-list-name').index($(this));
		var old_name = $($('.hidden-category-name').get(i)).text();
		var new_name = $(this).val();
		if (new_name == '') {
			$(this).val(old_name);
		} else if (new_name != old_name) {
			$.ajax({
				type:"post",
				url:"categories/checking",
				dataType : 'json',
				async:true,
				data : {categoryName : new_name},
				success: function(result){
					if(!result.success){
						if(result.statusCode == 100001){
							location.href = 'admin/login';
						} else if(result.statusCode == 404){
							location.href = '404';
						} else if(result.statusCode == 500){
							location.href = '500';
						} else {
							$($('#main-content .remind').get(i)).show();
							$($('#main-content .btn-category-list-update').get(i)).addClass('disabled');
						}
					} else {
						$($('#main-content .remind').get(i)).hide();
						$($('#main-content .btn-category-list-update').get(i)).removeClass('disabled');
					}
				}
			});
		} else if (new_name == old_name) {
			$($('.btn-category-list-update').get(i)).addClass('disbaled')
		}
	}).on('change', '#advice-category', function(){
		var caid = $(this).val();
		loadProductByCategory(caid);
	}).on('click', 'input[name="select-advice"]', function(){
		if(!$(this).is(":checked")) {
			$(this).attr("checked",false);
		} else {
			var length = $('input[name="select-advice"]:checked').length;
			if(length > 5){
				alert('每个类别只能推荐5个哦，先取消一个再添加吧！');
				$(this).attr("checked",false);
			} else {
				$(this).attr("checked",true);
			}
		}
	}).on('click', '#btn-advice-update', function(){
		var productIds = [];
		$.each($('input[name="select-advice"]:checked'), function(i, selectAdvice){
			productIds.push(parseInt($(selectAdvice).val()));
		});
		var caid = $('#advice-category').val();
		$.ajax({
			type:'put',
			data: {productIds : productIds},
			url:'products/categories/' + caid + '/advices',
			dataType : 'json',
			async:true,
			traditional: true,
			success : function (resultData) {
				if(resultData.success){
					alert('修改成功！');
				} else {
					alert('修改失败！');
				}
			}
		});
		return false;
	});
	
	$('#main-nav').on('click', '#nav-btn-user-edit', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');
		var html = $('#template-user-edit').html();
		$('#main-content').html(html);
	}).on('click', '#nav-btn-user-edit-pwd', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');
		var html = $('#template-user-edit-pwd').html();
		$('#main-content').html(html);
	}).on('click', '#nav-btn-category-list', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');

		var html = $('#template-category-list').render(categories);
		$('#main-content').html(html);
	}).on('click', '#nav-btn-category-add', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');
		var html = $('#template-category-add').html();
		$('#main-content').html(html);
	}).on('click', '#nav-btn-product-add', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');

		$('#main-content').on('click', '#btn-category-add', function () {
			$('.secondmenu li.active').removeClass('active');
			$(this).parent().addClass('active');
			var html = $('#template-category-add').html();
			$('#main-content').html(html);
		});

		pictures = [];
        pictureFiles = [];
		payments = [];
		pictureCount = 0;
		var html = $('#template-product-add').render(categories);
		$('#main-content').html(html);
		CKEDITOR.replace('productContent', {
			height: 400,
			toolbar: [
				['Source'],
				['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'],
				['NumberedList', 'BulletedList', 'Outdent', 'Indent'],
				['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
				['PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'],
				['Maximize'],
				'/', ['Styles', 'Format', 'Font', 'FontSize'],
				['TextColor', 'BGColor'],
				['Image', 'custimage', 'Table', 'HorizontalRule', 'SpecialChar'],
				['doclink', 'Link', 'Unlink']
			],
			image_previewText: ' ',
			filebrowserImageUploadUrl: '../files/pictures/upload/ckeditor'
		});
		
	}).on('click', '#nav-btn-product-list', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');

		var temp = {
			categories : categories,
			pageInfo : {
			    total : 0,
                pageSize : 10,
                pageNum : 1
            },
			search : {
				category : 0,
				name : '',
                curr : 1,
                limit : 10
			}
		};
        var loadData = function (options) {
            var defaults = {
                curr : 1,
                limit : 10
            };
            $.extend(defaults, options || {});
            var url = 'products/categories/' + temp.search.category +'/search?search=' + temp.search.name +'&pageNum=' + defaults.curr + '&pageSize=' + defaults.limit;
            $.when(
                $.ajax({
                    url : 'categories',
                    type : 'get',
                    async : true,
                    dataType : 'json',
                    success : function (result) {
                        if (result.success) {
                            categories = result;
                            temp.categories = categories;
                        }
                    }
                }),
                $.ajax({
                    url : url,
                    type : 'get',
                    async : true,
                    dataType : 'json',
                    success : function (result) {
                        if(result.success) {
                            temp.pageInfo = result.data;
                        } else {
                            temp.pageInfo = {};
                        }
                    }
                })
            ).done(function (res) {
                show();
            });
        };

		var show = function () {
			var html = $('#template-product-list').render(temp);
			$('#main-content').html(html);
			$('#main-content #pages center').extendPagination({
				pageNum: temp.pageInfo.pageNum,
	            totalCount: temp.pageInfo.total,
	            showCount: 10,
	            limit: temp.pageInfo.pageSize,
	            callback: function (curr, limit, totalCount) {
				    temp.search.curr = curr;
                    temp.search.limit = limit;
					loadData(temp.search);
	            }
	        });
		};
		loadData();
		$('#main-content').on('click', '#btn-product-list-search', function() {
			temp.search = {
				category : $('#product-list-category').val(),
				name : $('#product-list-search').val()
			};
            loadData();
			return false;
		}).on('click', '#product-list a.product', function(){
			var index = parseInt(($('#product-list a.product').index($(this))) / 2);
			var id = $($('#product-list .product-list-id').get(index)).val();
			$('#hidden-a').attr('href', 'products/' + id + '/detail');
            $('#hidden-a').click();
		}).on('click', 'button.btn-product-list-del', function(){
			var index = $('button.btn-product-list-del').index($(this));
			var id = $($('#product-list .product-list-id').get(index)).val();

			$.ajax({
				type:'delete',
				url:'products/' + id,
				dataType : 'json',
				async:true,
				success: function(result) {
					if (result.success) {
						loadData(temp.search);
					} else {
						alert(result.message);
						if(result.statusCode == 100001){
							location.href = 'admin/login';
						} else if(result.statusCode == 404){
							location.href = '404';
						} else if(result.statusCode == 500){
							location.href = '500';
						}
					}
				}
			});
			return false;
		});
	}).on('click', '#nav-btn-product-advice', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');
		loadProductByCategory(0);
	}).on('click', '#nav-btn-email-list', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');
		var pageInfos = {
			pageInfo : {
				total : 0,
                pageSize : 10,
                pageNum : 1
			},
			search : {
				pageNum : 1,
				pageSize : 10
			}
		};
		var loadEmails = function(options){
			var defaultOptions = {
				pageNum : 1,
				pageSize : 10
			};
			$.extend(defaultOptions, options || {});
			$.ajax({
				type : 'get',
				url : 'emails/states/-1?pageNum=' + defaultOptions.pageNum + '&pageSize=' + defaultOptions.pageSize,
				async : true,
				dataType : 'json',
				success : function (result) {
					if(result.success){
						pageInfos.pageInfo = result.data;
						showEmails();
					} else {
						if(result.statusCode == 100001){
							location.href = 'admin/login';
						} else if(result.statusCode == 404){
							location.href = '404';
						} else if(result.statusCode == 500){
							location.href = '500';
						}
					}
				}
			});
		};
		var showEmails = function () {
			var html = $('#template-email-list').render(pageInfos);
			$('#main-content').html(html);
			$('#main-content #pages center').extendPagination({
				pageNum: pageInfos.pageInfo.pageNum,
	            totalCount: pageInfos.pageInfo.total,
	            showCount: 10,
	            limit: pageInfos.pageInfo.pageSize,
	            callback: function (curr, limit, totalCount) {
	            	pageInfos.search.pageNum = curr;
	            	pageInfos.search.pageSize = limit;
	            	loadEmails(pageInfos.search);
	            }
	        });
		};
		loadEmails();
	}).on('click', '#nav-btn-aboutus', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');

		companyInfo.company.pictures = new Array();
		companyInfo.company.pictureUrls = new Array();
		companyInfo.company.files = new Array();
		$.ajax({
			type : 'get',
			url : 'company/aboutus',
			dataType : 'json',
			async:true,
			success : function (result) {
				if(result.success) {
					companyInfo.company.pictureUrls = result.data.pictures;
					var html = $('#template-company').render(result);
					$('#main-content').html(html);
				}

			}
		});

		$('#main-content').on('click', '#btn-aboutus-submit', function () {
			var formData = new FormData();

			var companyName = $('#company-name').val();
			if(companyName == ''){
				alert('请输入公司名称');
				return false;
			}
			
			var businessType = $('#business-type').val();
			var mainMarket = $('#main-market').val();
			var brand = $('#brand').val();
			var employees = $('#employees').val();
			var established = $('#established').val();
			var exportRate = $('#export').val();
			var introduction = $('#introduction').val();
			var history = $('#history').val();
			var service = $('#service').val();
			var team = $('#team').val();

			formData.append('companyName', companyName);
			formData.append('detail', '');
			formData.append('businessType', businessType);
			formData.append('mainMarket', mainMarket);
			formData.append('brand', brand);
			formData.append('employees', employees);
			formData.append('established', established);
			formData.append('export', exportRate);
			formData.append('introduction', introduction);
			formData.append('history', history);
			formData.append('service', service);
			formData.append('team', team);
			formData.append('pictures', companyInfo.company.pictureUrls);

			$.each(companyInfo.company.files, function (index, file) {
				formData.append('file', file);
			});

			$.ajax({
				async : true,
				type: 'POST',
				url : 'company/aboutus',
				cache: false,
				data: formData,
				processData: false,
				contentType: false,
				dataType : 'json',
				success : function (result) {
					if(result.success) {
						alert('修改成功');
					} else {
						if(result.statusCode == 100001){
							location.href = 'admin/login';
						} else if(result.statusCode == 404){
							location.href = '404';
						} else if(result.statusCode == 500){
							location.href = '500';
						}
					}
				}
			});
			return false;
		});
	}).on('click', '#nav-btn-factory-tour', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');

		companyInfo.factory.productLine.pictures = new Array();
		companyInfo.factory.productLine.pictureUrls = new Array();
		companyInfo.factory.productLine.files = new Array();
		companyInfo.factory.OEM.pictures = new Array();
		companyInfo.factory.OEM.pictureUrls = new Array();
		companyInfo.factory.OEM.files = new Array();
		companyInfo.factory.RD.pictures = new Array();
		companyInfo.factory.RD.pictureUrls = new Array();
		companyInfo.factory.RD.files = new Array();
		companyInfo.factory.factory.pictures = new Array();
		companyInfo.factory.factory.pictureUrls = new Array();
		companyInfo.factory.factory.files = new Array();

		$.ajax({
			type : 'get',
			url : 'company/factoryTour',
			dataType : 'json',
			async:true,
			success : function (result) {
				if(result.success) {
					companyInfo.factory.productLine.pictureUrls = result.data.pictures1;
					companyInfo.factory.OEM.pictureUrls = result.data.pictures2;
					companyInfo.factory.RD.pictureUrls = result.data.pictures3;
					companyInfo.factory.factory.pictureUrls = result.data.pictures4;
					var html = $('#template-factory').render(result);
					$('#main-content').html(html);
				}
			}
		});

		$('#main-content').on('click', '#btn-factoryTour-submit', function () {
			var formData = new FormData();

			formData.append('pictures1', companyInfo.factory.productLine.pictureUrls);
			formData.append('pictures2', companyInfo.factory.OEM.pictureUrls);
			formData.append('pictures3', companyInfo.factory.RD.pictureUrls);
			formData.append('pictures4', companyInfo.factory.factory.pictureUrls);
			$.each(companyInfo.factory.productLine.files, function (index, file) {
				formData.append('file1', file);
			});
			$.each(companyInfo.factory.OEM.files, function (index, file) {
				formData.append('file2', file);
			});
			$.each(companyInfo.factory.RD.files, function (index, file) {
				formData.append('file3', file);
			});
			$.each(companyInfo.factory.factory.files, function (index, file) {
				formData.append('file4', file);
			});

			$.ajax({
				async : false,
				type: 'POST',
				url : 'company/factoryTour',
				cache: false,
				data: formData,
				processData: false,
				contentType: false,
				dataType : 'json',
				success : function (result) {
					if(result.success) {
						alert('修改成功');
					} else {
						if(result.statusCode == 100001){
							location.href = 'admin/login';
						} else if(result.statusCode == 404){
							location.href = '404';
						} else if(result.statusCode == 500){
							location.href = '500';
						}
					}
				}
			});
			return false;
		});
	}).on('click', '#nav-btn-quality', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');

		$.ajax({
			type : 'get',
			url : 'company/qualityControl',
			async : true,
			dataType : 'json',
			success : function (result) {
				if (!result.success){
					return false;
				}
				var html = $('#template-quality').render(result);
				$('#main-content').html(html);

				CKEDITOR.replace('qualityContent', {
					height: 400,
					toolbar: [
						['Source'],
						['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'],
						['NumberedList', 'BulletedList', 'Outdent', 'Indent'],
						['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
						['PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'],
						['Maximize'],
						'/', ['Styles', 'Format', 'Font', 'FontSize'],
						['TextColor', 'BGColor'],
						['Image', 'custimage', 'Table', 'HorizontalRule', 'SpecialChar'],
						['doclink', 'Link', 'Unlink']
					],
					image_previewText: ' ',
					filebrowserImageUploadUrl: 'files/pictures/upload/ckeditor'
				});
			}
		});

		$('#main-content').on('click', '#btn-quality-submit', function () {
			var formData = new FormData();

			var standard = $('#standard').val();
			var number = $('#number').val();
			var issueDate = $('#issueDate').val();
			var expiryDate = $('#expiryDate').val();
			var file = $('.certification-picture')[0].files;

			var content = CKEDITOR.instances.qualityContent.getData();

			formData.append('standard', standard);
			formData.append('number', number);
			formData.append('issueDate', issueDate);
			formData.append('expiryDate', expiryDate);
			formData.append('content', content);
			if(file.length > 0){
				formData.append('file', file[0]);
			}

			$.ajax({
				async : false,
				type: 'POST',
				url : 'company/qualityControl',
				cache: false,
				data: formData,
				processData: false,
				contentType: false,
				dataType : 'json',
				success : function (result) {
					if(result.success) {
						alert('修改成功');
					} else {
						if(result.statusCode == 100001){
							location.href = 'admin/login';
						} else if(result.statusCode == 404){
							location.href = '404';
						} else if(result.statusCode == 500){
							location.href = '500';
						}
					}
				}
			});
		});
	}).on('click', '#nav-btn-contactus', function() {
		$('.secondmenu li.active').removeClass('active');
		$(this).parent().addClass('active');

		$.ajax({
			type: 'get',
			url: 'company/contactus',
			async: true,
			dataType: 'json',
			success: function (result) {
				if (!result.success) {
					return false;
				}
				var html = $('#template-contactus').render(result);
				$('#main-content').html(html);
			}
		});

		$('#main-content').on('click', '#btn-contactus-submit', function () {

			var address = $('#address').val();
			var faddress = $('#faddress').val();
			var workTime = $('#workTime').val();
			var tellPhone = $('#tellPhone').val();
			var fax = $('#fax').val();
			var contactPerson = $('#contactPerson').val();
			var jobTitle = $('#jobTitle').val();
			var phone = $('#mphone').val();
			var email = $('#contactEmail').val();

			$.ajax({
				async : true,
				type: 'POST',
				url : 'company/contactus',
				data: {
					address : address,
					faddress : faddress,
					workTime : workTime,
					tellPhone : tellPhone,
					fax : fax,
					contactPerson : contactPerson,
					jobTitle : jobTitle,
					phone : phone,
					email : email
				},
				dataType : 'json',
				success : function (result) {
					if(result.success) {
						alert('修改成功');
					} else {
						if(result.statusCode == 100001){
							location.href = 'admin/login';
						} else if(result.statusCode == 404){
							location.href = '404';
						} else if(result.statusCode == 500){
							location.href = '500';
						}
					}
				}
			});
			return false;
		});

	});
});