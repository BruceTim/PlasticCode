/**
 * Created by BruceTim on 2017/2/4.
 */
$(function () {
    categories = new Array();
    companyInfo = {
        aboutus : {},
        qualityControl : {},
        factoryTour : {},
        contactus : {}
    };
    loadDatas = {
        loadCategories: function () {
            $.ajax({
                type: "get",
                url: "categories",
                async: true,
                dataType: 'json',
                success: function (result) {
                    if (result.success) {
                        categories = result.data;
                        loadDatas.loadFooter();
                    }
                }
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
                $('.top_rightA').text(companyInfo.aboutus.companyName);
                $('#com-name').text('(' + companyInfo.aboutus.companyName + ')');
                $('#contactPerson').text(companyInfo.contactus.contactPerson);
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
    loadDatas.loadCategories();
    loadDatas.loadCompanyInfo();

});