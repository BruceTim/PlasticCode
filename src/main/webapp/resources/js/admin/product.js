$(function() {

	var pictureUrls = [], pictureFiles = [];
	var pictures = [], payments = [];
	var id = $('#product-detail-id').val();
	var pictureCount = 0;
	var categories = {};
	
	var product = {};


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
			if (pictureUrls.length == 0 && pictures.length == 0) {
				alert('请上传一下不同角度的产品图片哦！');
				return false;
			}
			return true;
		},
		product_add : function (type) {
			if(product_edit.check()) {

				var formData = new FormData($('#form-product-update')[0]);
                formData.append('id', id);
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
				$.each(pictureUrls, function (index, pictureUrl) {
					formData.append('pictureSet',pictureUrl);
				});
				$.each(pictureFiles, function (index, file) {
					formData.append('file', file);
				});

				$.ajax({
					async : false,
					url: 'products/' + id,
					type: 'post',
					cache: false,
					data: formData,
					processData: false,
					contentType: false,
					dataType : 'json',
					success : function (res) {
						if (res.success) {
							if (type == 1) {
								alert('修改成功！');
							} else if(type == 2){
								alert('修改成功！');
								$('#hidden-a').attr('href', 'products/' + id + '/view');
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

	$.when($.ajax({
			type:"get",
			url:"categories",
			async:true,
            dataType : 'json',
			success :function (result) {
				categories = result;
			}
		}),
		$.ajax({
			type:"get",
			url:"products/" + id,
			async:true,
            dataType : 'json',
			success :function (result) {
				if(result.success){
					product = result;
				}
			}
		})
	).done(function (res) {
		product.data.customProperties = JSON.parse(product.data.customProperties);
		pictureUrls = product.data.pictures;
		var html = $('#template-product-update').render({categories:categories, product: product});

		$('#product-content').html(html);

		$('#category').val(product.data.category.id);

		$.each(pictureUrls, function(index, picture) {
			$('.files').append('<div class="picture-box"><img class="img-thumbnail picture" src="'+ picture +'"/><a href="javascript:void(0)" class="remove url"><i class="glyphicon glyphicon-remove"></i></a></div>');
		});
		pictureCount = pictureUrls.length;
        var basePath = $('base').attr('href');
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
			filebrowserImageUploadUrl:  basePath + 'files/pictures/upload/ckeditor',
		});
//	CKEDITOR.instances.productContent.setData(product.data.content);
		var ele = CKEDITOR.dom.element.createFromHtml(product.data.description);
		CKEDITOR.instances.productContent.insertElement(ele);
	});

	$('#product-content').on('change', '#js-file', function (event) {
		var $js_file = $(this);
        var files = event.target.files;
		
		// 允许上传的图片类型  
	    var allowTypes = ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'];  
	    // 512KB，也就是 0.5MB  
	    var maxSize = 1024 * 512; 
    
		// 如果没有选中文件，直接返回
        if (files.length === 0) {
            return;
        }
        $.each(files, function(index,file) {

        	// 如果类型不在允许的类型范围内
	        if (allowTypes.indexOf(file.type) === -1) {
	            alert('文件类型不对');
	        }
	
	        if (file.size > maxSize) {
	            alert('图片太大，不允许上传');
	        }
			var reader = new FileReader();
	       	reader.readAsDataURL(file);
	       	reader.onload = function(e) {
				if (pictureCount >= 4) {
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
	    	};
        });
        
	}).on('click', '.remove', function(e){
		if ($(this).hasClass('url')) {
			pictureUrls.splice($('.files .remove.url').index($(this)),1);
		} else {
			var i = $('.files .remove').not('.url').index($(this));
			pictures.splice(i,1);
			pictureFiles.splice(i, 1);
		}
		pictureCount --;
		$($('.files .picture-box').get($('.files .remove').index($(this)))).remove();
	}).on('click', '#btn-property-add', function() {
		var html = $('#template-custom-property').html();
		$('.custom-properties').append(html);
	}).on('click', '.btn-property-delete', function () {
		var i = $('.custom-properties .btn-property-delete').index($(this));
		$('.custom-properties .custom-property').get(i).remove();
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
	}).on('click', '#btn-product-update-check', function (){
		if (product_edit.check()){
			alert('还不错，可以点击完成进行提交了');
		}
		return false;
	}).on('click', '#btn-product-update-submit', function () {
		
		var result = product_edit.product_add(1);
		return false;
	}).on('click', '#btn-product-update-submit-view', function () {
		
		var result = product_edit.product_add(2);
		return false;
	});
	
});
