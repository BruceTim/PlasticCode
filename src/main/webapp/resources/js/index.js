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

var dealZoneHour = function (){
	//时区处理
	var zoneInfo = new Date().getTimezoneOffset()/60;
	hour = zoneInfo+8;

	//客户设定时间
	var minute_start = 00;
	var hour_start = 8;
	var minute_end = 00;
	var hour_end = 17;

	//客户端时间
	var current_time = new Date().getTime();

	//转换到北京时间戳
	var beijing_time = current_time + hour*3600*1000;

	var beijing_hour = new Date(beijing_time).getHours();
	var beijing_minute = new Date(beijing_time).getMinutes();
	var beijing_sum = beijing_hour*60 + beijing_minute;
	var start_sum = hour_start*60 + minute_start;
	var end_sum = hour_end*60 + minute_end;

	if(beijing_sum >= start_sum && beijing_sum <= end_sum){
		document.getElementById("hourZone").innerHTML = "86-0755-29977990";
	}else{
		document.getElementById("hourZone").innerHTML = "86-0755-29977990";
	}
};

$(document).ready(function() {

	var name = $('#maoytID');
	function showAd(time){
		setTimeout(function(){
			$(name).show();
		},time);
	}
	showAd(1);
	function scrollAd(){
		var offset = 73 + $(document).scrollTop();
		$(name).animate({top:offset},{duration:1000,queue:false});
	}
	scrollAd();
	$(window).scroll(scrollAd);

	categories = new Array();
	companyInfo = {
		aboutus : {},
		qualityControl : {},
		factoryTour : {},
		contactus : {}
	};

	product = {};

	hasKey = function (json) {
        var lenght = 0;
        for(var key in json){
            lenght++;
        }
        return lenght > 0;
    };

	loadDatas = {
		loadCategories : function(){
			$.ajax({
				type:"get",
				url:"categories",
				async:true,
				dataType : 'json',
				success : function(result){
					if(result.success){
						categories = result.data;
						$('#category-search').empty();
						$('#category-search').append('<option value="0">All Categories</option>');
						$.each(categories, function(i, category) {
							$('#category-search').append('<option value="'+ category.id +'">'+ category.categoryName +'</option>');
						});
                        loadDatas.loadFooter();
						loadDatas.loadAmounts();                        nowpage = $('.menu ul li.cur a').text();
                        if(nowpage == 'Home'){
                            loadDatas.loadProductAdvice();
                        } else if (nowpage == 'Products') {
                            queryType = $('#queryType').text();
                            if(queryType == 'all') {
                                loadDatas.loadProductsForAllCate();
                            } else if (queryType == 'search') {
								var cateid = $('#cateid').text();
								$('#category-search').val(cateid);
                                loadDatas.loadProductsBySearch();
							} else if (queryType == 'tag') {
                                var tag = $('#tag').text();
                                loadDatas.loadProductsByTags({tag : tag});
                            } else if (queryType == 'detail') {
                                var pid = $('#productId').text();
                                loadDatas.loadProductDetail(pid);
                            } else if (! isNaN(queryType)) {
                                loadDatas.loadProductAdvice({cateid : queryType});
                            }
                        }

                        loadDatas.loadCompanyInfo();
					}
				}
			});
		},
		loadAmounts : function() {
			$('#nav-categories').empty();
			$('#nav-categories').append('<li class="tit" >Browse Categories</li>');
			$.each(categories, function(i, category) {
				$.ajax({
					type:"get",
					url:"products/categories/" + category.id + "/amount",
					async:false,
					dataType : 'json',
					success : function(result){
						if(result.success){
						    category['amount'] = result.data;
                            categories[i] = category;
							$('#nav-categories').append('<li class="cate"><strong>'
        						+ '<a href="products/categories/'+ category.id +'/view" '
        						+ 'title="'+ category.categoryName +'" cid="' + category.id + '">'+ category.categoryName + '</a>'
        						+'</strong><font color="#4E4E4E" style="display: inline-block">('+ result.data +')</font></li>'
    						);
						}
					}
				});
			});
		},
		loadCompanyInfo : function () {
			$.when(
				$.ajax({
					type:"get",
					url:"company/aboutus",
					async:true,
					dataType : 'json',
					success : function(result){
						if(result.success){
							companyInfo.aboutus = result.data;
						}
					}
				}),
				$.ajax({
					type:"get",
					url:"company/factoryTour",
					async:true,
					dataType : 'json',
					success : function(result){
						if(result.success){
							companyInfo.factoryTour = result.data;
						}
					}
				}),
				$.ajax({
					type:"get",
					url:"company/qualityControl",
					async:true,
					dataType : 'json',
					success : function(result){
						if(result.success){
							companyInfo.qualityControl = result.data;
						}
					}
				}),
				$.ajax({
					type:"get",
					url:"company/contactus",
					async:true,
					dataType : 'json',
					success : function(result){
						if(result.success){
							companyInfo.contactus = result.data;
						}
					}
				})
			).done(function(e){
				
				$('#company-name').text(companyInfo.aboutus.companyName);
				
				var certifications = $('#template-Certifications').render(companyInfo);
				$('#Certifications').html(certifications);
				nowpage = $('.menu ul li.cur a').text();
				if( nowpage == "Home") {
                    
                } else if (nowpage == 'About Us') {
                    companyInfo.aboutus.businessType = companyInfo.aboutus.businessType.replace(/,/g,'<br/>');
                    companyInfo.aboutus.mainMarket = companyInfo.aboutus.mainMarket.replace(/,/g,'<br/>');
                    var aboutus = $('#template-aboutus').render(companyInfo);
                    $('.right.fright').html(aboutus);

                    $($('.photo .carousel-control').get(0)).addClass('active');
                    $($('.photo .carousel-pictures img').get(0)).removeClass('hidden');
                    $($('.isho .com-desc').get(0)).removeClass('hidden');

                    var cur = 0;
                    carousel = function() {
                        var length = $('.photo .carousel-control').length;
                        cur++;
                        if(cur == length) cur = 0;
                        $('.photo .carousel-control.active').removeClass('active');
                        $($('.photo .carousel-control').get(cur)).addClass('active')

                        $('.photo .carousel-pictures img').not('.hidden').addClass('hidden');
                        $($('.photo .carousel-pictures img').get(cur)).removeClass('hidden');

                        setTimeout('carousel();', 4000);
                    };
                    setTimeout('carousel();', 4000);

                    $('.photo').on('mouseover', '.carousel-control',function(){
                        $('.photo .carousel-control.active').removeClass('active');
                        $(this).addClass('active');

                        var index = $('.photo .carousel-control').index($(this));
                        cur = index;
                        $('.photo .carousel-pictures img').not('.hidden').addClass('hidden');
                        $($('.photo .carousel-pictures img').get(index)).removeClass('hidden');
                    });
                    $('.isho').on('click', '.but span a', function () {
                        var index = $('.isho .but span a').index($(this));
                        $('.isho .but span.cur').removeClass('cur');
                        $(this).parent().addClass('cur');
                        $('.isho .com-desc').not('.hidden').addClass('hidden');
                        $($('.isho .com-desc').get(index)).removeClass('hidden');
                    });
                    var contactDetail = $('#template-contact-detail').render(companyInfo);
                    $('.right.fright .r_pro').append(contactDetail);
                }else if (nowpage == 'Factory Tour') {
                    var factoryTour = $('#template-factory-tour').render(companyInfo);
                    $('.right.fright').html(factoryTour);

                    change = function () {
                        $dom = $('.right.fright .isho .con').not('.hidden');
                        var length = $dom.find('.carousel-control').length;
                        if(length > 0){
                            var i = $dom.find('.carousel-control').index($dom.find('.carousel-control.active'))
                            i++;
                            if (i >= length) i=0;
                            $dom.find('.carousel-control.active').removeClass('active');
                            $($dom.find('.carousel-control').get(i)).addClass('active');
                            $dom.find('.carousel-pictures img').not('.hidden').addClass('hidden');
                            $($dom.find('.carousel-pictures img').get(i)).removeClass('hidden');
                            timeout = setTimeout('change();', 5000);
                        }
                    };
                    timeout = setTimeout('change()', 5000);

                    $('.right.fright').on('mouseover', '.isho .but .factory a', function () {
                        clearTimeout(timeout);
                        var index = $('.right.fright .isho .but .factory a').index($(this));
                        $('.right.fright .isho .but .factory.cur').removeClass('cur');
                        $(this).parent().addClass('cur');

                        $('.right.fright .isho .con').not('.hidden').addClass('hidden');
                        var $active = $($('.right.fright .isho .con').get(index));
                        $active.removeClass('hidden');
                        $active.find('.carousel-control.active').removeClass('active');
                        $($active.find('.carousel-control').get(0)).addClass('active');

                        $active.find('.carousel-pictures img').not('.hidden').addClass('hidden');
                        $($active.find('.carousel-pictures img').get(0)).removeClass('hidden');
                        timeout = setTimeout('change()', 5000);
                    });

                    $('.right.fright').on('mouseover', '.isho .con .carousel-control', function () {
                        $dom = $('.right.fright .isho .con').not('.hidden');
                        $dom.find('.carousel-control.active').removeClass('active');
                        $(this).addClass('active');
                        var k = $dom.find('.carousel-control').index($(this));
                        $dom.find('.carousel-pictures img').not('.hidden').addClass('hidden');
                        $($dom.find('.carousel-pictures img').get(k)).removeClass('hidden');
                    });

                    var contactDetail = $('#template-contact-detail').render(companyInfo);
                    $('.right.fright .r_pro').append(contactDetail);
                }else if (nowpage == 'Quality Control') {
                    var quality = $('#template-quality-control').render(companyInfo);
                    $('.right.fright').html(quality);

                    var contactDetail = $('#template-contact-detail').render(companyInfo);
                    $('.right.fright .r_pro').append(contactDetail);
                }else if (nowpage == 'Contact Us') {
                    var contactUs = $('#template-contact-us').render(companyInfo);
                    $('.right.fright').html(contactUs);
                }
			});
		},
		loadProductAdvice : function(options) {
            var defaultOptions = {
                cateid : 0,
                pageNum : 1,
                pageSize : 10
            };
            $.extend(defaultOptions, options || {});
			$.ajax({
				type:'get',
				url:'products/categories/' + defaultOptions.cateid + '/advices',
				async:true,
				dataType : 'json',
				success : function(result){
					if(result.success){
						var html = $('#template-carousel').render(result);
						$('.right').html(html);
						
						var html2 = $('#template-product-advice').render(result);
						$('.right').append(html2);
						
						$($('#carousel .carousel-control').get(0)).addClass('active');
						$($('#carousel .carousel-pictures td').get(0)).removeClass('hidden');
						$($('#carousel .carousel-caption a').get(0)).removeClass('hidden');
						
						curr = 0;
						changePicture = function() {
							var length = $('#carousel .carousel-control').length;
							curr++;
							if(curr == length) curr = 0;
							$('#carousel .carousel-control.active').removeClass('active');
							$($('#carousel .carousel-control').get(curr)).addClass('active')
							
							$('#carousel .carousel-pictures td').not('.hidden').addClass('hidden');
							$($('#carousel .carousel-pictures td').get(curr)).removeClass('hidden');
							
							$('#carousel .carousel-caption a').not('.hidden').addClass('hidden');
							$($('#carousel .carousel-caption a').get(curr)).removeClass('hidden');
							setTimeout('changePicture();', 4000);
						};
						setTimeout('changePicture();', 4000);

                        $('.right').on('mouseover', '.carousel-control',function(){
                            $('#carousel .carousel-control.active').removeClass('active');
                            $(this).addClass('active');

                            var index = $('#carousel .carousel-control').index($(this));
                            curr = index;
                            $('#carousel .carousel-pictures td').not('.hidden').addClass('hidden');
                            $($('#carousel .carousel-pictures td').get(index)).removeClass('hidden');

                            $('#carousel .carousel-caption a').not('.hidden').addClass('hidden');
                            $($('#carousel .carousel-caption a').get(index)).removeClass('hidden');
                        });

                        nowpage = $('.menu ul li.cur a').text();
                        if(nowpage == 'Home'){
                            loadDatas.loadTopProduct();
                        } else if (nowpage == 'Products'){
                            queryType = $('#queryType').text();
                            if(!isNaN(queryType)){
                                loadDatas.loadProductsByCategory(options);
                                $.each($('#nav-categories .cate'), function(index, li){
                                	if($(li).find('a').attr('cid') == options.cateid){
                                		$('#nav-categories .cate.active').removeClass('active');
                                		$(li).addClass('active');
                                		return false;
                                	}
                                });
                            }
                        }
					}
				}
			});
		},
		loadTopProduct : function() {
			$.ajax({
				type:"get",
				url:"products/categories/0?pageNum=1&pageSize=16",
				async:true,
				dataType : 'json',
				success : function(result){
					if(result.success){
                        var html = $('#template-topProduct').render(result);
                        $('.right #product-advice').after(html);
						
						
                        var factory = $('#template-factory').render(companyInfo);
                        $('#topProduct').after(factory);
                        $($('#factory .compic').get(0)).removeClass('hidden');
                        $($('#factory .picid').get(0)).css({"background": "white"});
						var comDesc = $('#factory .con span').text();
						comDesc = comDesc.substring(0, 180);
						$('#factory .con span').text(comDesc);
                        $('#factory').on('mouseover', '.picid', function () {
                            $('#factory .picid').css({
                                "background": "#999999"
                            });
                            $(this).css({
                                "background": "white"
                            });
                            var index = $('#factory .picid').index($(this));
                            $('#factory .compic').not('.hidden').addClass('hidden');
                            $($('#factory .compic').get(index)).removeClass('hidden');
                        });
					}
				}
			});
		},
        loadProductsByCategory : function(options) {
            var defaultOptions = {
                cateid : 1,
                pageNum : 1,
                pageSize : 10
            };
            $.extend(defaultOptions, options || {});
			$.ajax({
				type:"get",
				url:'products/categories/' + defaultOptions.cateid + '?pageNum='+ defaultOptions.pageNum +'&pageSize=' + defaultOptions.pageSize,
				async:true,
				dataType : 'json',
				success : function(result){
					if(result.success){
                        var products = {
                            category : {},
                            pageInfo : result.data
                        };
                        $.each(categories, function(i, category){
                            if(category.id == defaultOptions.cateid) {
                                $('.index-bread').text('  ' + category.categoryName);
                                products.category = category;
                                return false;
                            }
                        });
                        var html = $('#template-product-list').render(products);
                        $('.right #product-advice').after(html);
                        showPages(result.data);
					}
				}
			});
        },
        loadProductsForAllCate : function() {
            $.each(categories, function (i, category) {
                $.ajax({
                    type: "get",
                    url: 'products/categories/' + category.id + '?pageNum=1&pageSize=4',
                    async: false,
                    dataType: 'json',
                    success: function (result) {
                        if (result.success) {
                            $('.index-bread').text('  Products');
                            category['amount'] = result.data.total;
                            category['products'] = result.data.list;
                        } else {
                            category['amount'] = 0;
                            category['products'] = new Array();
                        }
                        categories[i] = category;
                    }
                });
            });
            var html = $('#template-products-all').render({categories : categories});
            $('.right').html(html);
        },
		loadProductsBySearch : function (options) {
            var defaultOptions = {
                cateid : $('#category-search').val(),
                keyword : $('#keyword').val(),
                pageNum : 1,
                pageSize : 10
            };
            $.extend(defaultOptions, options || {});
			$.ajax({
				type:"get",
				url:'products/categories/' + defaultOptions.cateid + '/search?pageNum='+ defaultOptions.pageNum +'&pageSize='+ defaultOptions.pageSize +'&keyword=' + defaultOptions.keyword,
				async:true,
				dataType : 'json',
				success : function(result){
					if(result.success){
                        $('#queryType').text('search');
					    if(defaultOptions.keyword == ''){
					        if(defaultOptions.cateid == 0) {
                                defaultOptions.keyword = 'All Products';
                            } else {
                                defaultOptions.keyword = $('#category-search option[value='+ defaultOptions.cateid +']').text();
                            }
                        }
                        $('.index-bread').text('  ' +defaultOptions.keyword);

						var products = {
							category : {
								categoryName : defaultOptions.keyword,
								amount : result.data.total
							},
							pageInfo : result.data
						};
						var html = $('#template-product-list').render(products);
						$('.right').html(html);
                        showPages(result.data);
					}
				}
			});
		},
		loadProductsByTags : function (options) {
		    var defaultOptions = {
		        tag : 'Caps',
                pageNum : 1,
                pageSize : 10
            };
            $.extend(defaultOptions, options || {});
            $.ajax({
                type:"get",
                url:'products/tags/' + defaultOptions.tag + '?pageNum=' + defaultOptions.pageNum + '&pageSize=' + defaultOptions.pageSize,
                async:true,
                dataType : 'json',
                success : function(result){
                    if(result.success){
                        $('.index-bread').text('  ' + defaultOptions.tag);
                        var products = {
                            category : {
                                categoryName : defaultOptions.tag,
                                amount : result.data.total
                            },
                            pageInfo : result.data
                        };
                        var html = $('#template-product-list').render(products);
                        $('.right').html(html);
                        showPages(result.data);
                    }
                }
            });
		},
        loadProductDetail : function (pid) {
            $.ajax({
                type:"get",
                url:'products/' + pid,
                async:true,
                dataType : 'json',
                success : function(result){
                    if(result.success){
                        product = result;
                        $('.index-bread').text('  ' + result.data.productName);
                        
                        $.each($('#nav-categories .cate'), function(index, li){
                        	if($(li).find('a').attr('cid') == product.data.category.id){
                        		$('#nav-categories .cate.active').removeClass('active');
                        		$(li).addClass('active');
                        		return false;
                        	}
                        });
                        
                        result.data.customProperties = JSON.parse(result.data.customProperties);
                        var html = $('#template-product-detail').render(result);
                        $('.right.fright').html(html);
						
						$.each($('.text8.key a'), function(index, a){
							var href = $(a).attr('href');
							href = href.replace(/\s+/g, '_');
							$(a).attr('href' , href);
						});
						
                        var i = 0, j = 0;
                        $('.detail table.customProperties tbody').empty();
                        for(var key in result.data.customProperties){
                            if(i % 2 == 0){
                                $('.detail table.customProperties tbody')
                                    .append('<tr><td style="color: #666; width: 110px;text-indent: 5px;padding: 8px 2px 8px 2px;">'+ key + ':</td>'
                                    +'<td style="padding: 8px 2px 8px 2px;">' + result.data.customProperties[key] + '</td></tr>');
                            } else {
                                $('.detail table.customProperties tbody tr').last().append('<td style="color: #666; width: 110px;text-indent: 5px;padding: 8px 2px 8px 2px;">'+ key + ':</td>')
                                    .append('<td style="padding: 8px 2px 8px 2px;">' + result.data.customProperties[key] + '</td>');
                            }
                            i++;
                        }
                        $.each($('.detail table.customProperties tbody tr'), function (j, tr) {
                            if(j % 2 > 0) $(tr).attr('bgcolor', '#f1f1f1');
                        });
                        change_img = function(count, img) {
                            var w = 329;
                            var h = 211;
                            var hbak = h;
                            var fixwidth = 312;
                            var fixheight = 222;
                            $("#productImg").attr('width', w);
                            $("#productImg").attr('height', h);
                            //压缩
                            if (w > fixwidth) {
                                $("#productImg").attr('width', fixwidth);
                                $("#productImg").attr('height', h / (w / fixwidth));
                                hbak = h;
                            }
                            if (hbak > fixheight) {
                                $("#productImg").attr('height', fixheight);
                                $("#productImg").attr('width', w / (h / fixheight));
                            }
                            img.src = product.data.pictures[count];
                            document.getElementById("large").href = product.data.pictures[count];
                            document.getElementById("largeimg").href = product.data.pictures[count];
                        }
                    }
                }
            });
	    },
        loadFooter : function () {
	        var datas =
	            [
                    {
                        category : categories[0],
                        products : new Array()
                    },
                    {
                        category : categories[1],
                        products : new Array()
                    },
                    {
                        category : categories[2],
                        products : new Array()
                    }
                ];

            $.when(
                $.ajax({
                    url: 'products/categories/' + datas[0].category.id + '?pageNum=0&pageSize=3',
                    type: "get",
                    async: true,
                    dataType: 'json',
                    success: function (result) {
                        if(result.success){
                            datas[0].products = result.data.list;
                        }
                    }
                }),
                $.ajax({
                    url: 'products/categories/' + datas[1].category.id + '?pageNum=0&pageSize=3',
                    type: "get",
                    async: true,
                    dataType: 'json',
                    success: function (result) {
                        if(result.success){
                            datas[1].products = result.data.list;
                        }
                    }
                }),
                $.ajax({
                    url: 'products/categories/' + datas[2].category.id + '?pageNum=0&pageSize=3',
                    type: "get",
                    async: true,
                    dataType: 'json',
                    success: function (result) {
                        if(result.success){
                            datas[2].products = result.data.list;
                        }
                    }
                })
            ).done(function () {
                var html = $('#template-footer').render({data: datas});
                $('.footer').html(html);
            });
        }
	};

	showPages = function(pageInfo){
        var html = [];
        var showPage = 10, totalPage = pageInfo.pages, pageNum = pageInfo.pageNum;
        var middle = parseInt(showPage / 2) + 1;
        html.push('Page <span class="curPage">' + pageInfo.pageNum + '</span> of <span class="lastPage">' + pageInfo.pages + '</span><span class="prevPage hidden">'+ pageInfo.prePage + '</span><span class="nextPage hidden">'+ pageInfo.nextPage +'</span>');
        if(pageInfo.isFirstPage){
            html.push('<a href="javascript:void(0);" class="first disabled" title="First">|&lt;</a>');
        } else {
            html.push('<a href="javascript:void(0);" class="first" title="First">|&lt;</a>');
        }
        if(pageInfo.hasPreviousPage){
            html.push('<a href="javascript:void(0);" class="prev" title="Previous">&lt;&lt;</a>');
        } else {
            html.push('<a href="javascript:void(0);" class="prev" style="display: none;" title="Previous">&lt;&lt;</a>');
        }
        html.push('<span class="more-prev hidden">...</span>');
        if (totalPage <= showPage) {
            for (var i = 1; i <= totalPage; i++) {
                if (i == pageNum) html.push('<a href="javascript:void(0)" class="cur">' + i + '</a>');
                else html.push('<a href="javascript:void(0)">' + i + '</a>');
            }
        } else {
            if (pageNum <= middle) {
                for (var j = 1; j <= showPage; j++) {
                    if (j == pageNum) html.push('<a href="javascript:void(0)" class="cur">' + j + '</a>');
                    else html.push('<a href="javascript:void(0)">' + j + '</a>');
                }
            } else if (pageNum >= totalPage-(showPage - middle)) {
                for (var k = totalPage - showPage + 1; k <= totalPage; k++) {
                    if (k == pageNum) html.push('<a href="javascript:void(0)" class="cur">' + k + '</a>');
                    else html.push('<a href="javascript:void(0)">' + k + '</a>');
                }
            } else if (pageNum > middle && pageNum < totalPage-(showPage - middle)) {
                for (var n = pageNum - middle + 1; n < pageNum; n++) {
                    html.push('<a href="javascript:void(0)">' + n + '</a>');
                }
                for (var p = pageNum; p <= pageNum + (showPage - middle); p++) {
                    if (p == pageNum) html.push('<a href="javascript:void(0)" class="cur">' + p + '</a>');
                    else html.push('<a href="javascript:void(0)">' + p + '</a>');
                }
            }
        }
        html.push('<span class="more-next hidden">...</span>');
        if(pageInfo.hasNextPage){
            html.push('<a href="javascript:void(0);" class="next" title="Next">&gt;&gt;</a>');
        } else {
            html.push('<a href="javascript:void(0);" class="next" style="display: none;" title="Next">&gt;&gt;</a>');
        }
        if(pageInfo.isLastPage){
            html.push('<a href="javascript:void(0);" class="last disabled" title="Last">&gt;|</a>');
        } else {
            html.push('<a href="javascript:void(0);" class="last" title="Last">&gt;|</a>');
        }
        if (totalPage > showPage && pageNum > middle) {
            $('.more-prev').css('display', 'inline-block');
        }
        if (totalPage > showPage && pageNum < totalPage - (showPage - middle)) {
            $('.more-next').css('display', 'inline-block');
        }
        $('.pages .page-block').html(html.join(''));
    };

	$(document).on('click', '#btn-search', function () {
		var cateid = $('#category-search').val();
		var keyword = $('#keyword').val();
	    location.href = 'products/categories/' + cateid + '/search/view?keyword=' + keyword ;
	});
	$('#keyword').keydown(function(e){
		if(e.keyCode==13){
			var cateid = $('#category-search').val();
			var keyword = $('#keyword').val();
			location.href = 'products/categories/' + cateid + '/search/view?keyword=' + keyword ;
		}
	});

    $('.right').on('click', '.pages .page-block a', function () {
        var options = {
            pageNum : 1,
            pageSize : 10
        };
        if($(this).hasClass('first')){
            options.pageNum = 1;
        } else if ($(this).hasClass('last')){
            options.pageNum = $('.lastPage').text();
        } else if ($(this).hasClass('prev')){
            options.pageNum = $('.prevPage').text();
        } else if ($(this).hasClass('next')){
            options.pageNum = $('.nextPage').text();
        } else {
            options.pageNum = $(this).text();
        }
        nowpage = $('.menu ul li.cur a').text();
        if (nowpage == 'Products') {
            queryType = $('#queryType').text();
            if (queryType == 'tag') {
                var tag = $('#tag').text();
                options.tag = tag;
                loadDatas.loadProductsByTags(options);
            } else if (queryType == 'search') {
				var cateid = $('#cateid').text();
				$('#category-search').val(cateid);
                loadDatas.loadProductsBySearch(options);
            } else if (! isNaN(queryType)) {
                options.cateid = queryType;
                loadDatas.loadProductAdvice(options);
            }
        }
    });

    loadDatas.loadCategories();
    loadDatas.loadCompanyInfo();

});
