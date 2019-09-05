/**
 * FAQ 由ъ뒪��
 */
$.namespace("faq.list");
faq.list = {
    _ajax : common.Ajax,
    
    init : function(option){
        // 硫��� ���됲듃諛뺤뒪 �ㅼ젙
        faq.list.eventSet();
        // 由ъ뒪�� 寃��됱뼱 蹂쇰뱶 泥섎━
        faq.list.setFaqListTxtBold();
        
        setTimeout(function() {
            faq.list.bindWebLog();
        }, 700);
    },
    eventSet : function(){
        
        $('#TabsOpenArea').find('.comm2sTabs > li ').on('click', function(){
            var idx = $(this).index();
            $('#TabsOpenArea').find('.comm2sTabs > li').removeClass('on').eq(idx).addClass('on');
            
            var param = { faqLrclCd : $(this).data('cd')
                        }
            faq.list.getFaqList(param);
            // top10�� 寃쎌슦留� 議고쉶
            if(faqLrclCd != '99'){
                
                $(".phone-banner").remove();
                
                if($(".common1s-text").length == 0){
                    var addHtml  = "<p class='common1s-text'>李얠쑝�쒕뒗 吏덈Ц�� �녿떎硫�?</p>";
                        addHtml += "    <div class='area1sButton'>";
                        addHtml += "        <a href='"+_secureUrl+"counsel/getQnaForm.do' class='btnGreen'>1:1臾몄쓽�섍린</a>";
                        addHtml += "    </div>";
                        addHtml += "</p>";
                    $(addHtml).insertAfter(".pageing");
                }
            }
        });

        $('#TabsOpenArea').find('.twoTabs > li').on('click', function(){
            $('#TabsOpenArea').find('.comm2sTabs > li ').off('click');
            
            var idx = $(this).index();
            $('#TabsOpenArea').find('.twoTabs > li').removeClass('on').eq(idx).addClass('on');
            
            var faqMdclCd = $(this).data('cd');
            var faqLrclCd = $(this).parents('li').data('cd');

            var param = { faqLrclCd : faqLrclCd,
                        faqMdclCd : faqMdclCd,
            }
            faq.list.getFaqList(param);
        });
        
        $('#TabsOpenArea').find('.comm2sTabs > li ').on('click', function(){
            var idx = $(this).index();
            $('#TabsOpenArea').find('.comm2sTabs > li').removeClass('on').eq(idx).addClass('on');
        });
        
        $('.list-customer .tit').click(function(e){
            e.preventDefault();
            if($(this).parents('li').hasClass('open')){
                $(this).parents('li').removeClass('open');
            }else{
                $(this).parents('li').addClass('open').siblings().removeClass('open');
            }
        });
        // 寃���
        $('#searchFaq').on("click", function(e){
            e.preventDefault();
            
            if($("#inqTitNm").val().length == 0){
                alert('寃��됱뼱瑜� �낅젰�댁＜�몄슂.');
                return false;
            }
            if($("#inqTitNm").val().length > 10){
                alert('理쒕� 10�먭퉴吏� �낅젰 媛��ν빀�덈떎.');
                return false;
            }
            //紐⑸줉 議고쉶
            faq.list.searchFaqList();
        });
        // �섏씠吏� �좏깮
        $('.pageing').find('a').click(function(){
            var pageIdx = $(this).data('pageNo');
            
            if(typeof pageIdx == 'undefined' || pageIdx == '') return;
            
            faq.list.goPage($(this).data('pageNo'));
        });
        
        //寃��됱뼱 湲��먯닔�쒗븳
        $("[name='inqTitNm']").bind("input", function(){
            if($("[name='inqTitNm']").val().length > 10){
                alert('理쒕� 10�먭퉴吏� �낅젰 媛��ν빀�덈떎.');
                $("[name='inqTitNm']").val($("[name='inqTitNm']").val().substr(0,10));

                $("[name='inqTitNm']").focus();
                return false;
            }
        });
    },
    /**
     * 紐⑸줉 議고쉶
     */
    getFaqList : function (obj) {
        var param = $.param(obj);
        
        location.href = _baseUrl + "counsel/getFaqList.do?"+param;
    },
    /**
     * 寃��� 紐⑸줉 議고쉶
     */
    searchFaqList : function (obj) {
        var sForm = $("#sForm");
        
        if($("#inqTitNm").val().length == 0){
            alert('寃��됱뼱瑜� �낅젰�댁＜�몄슂.');
            return false;
        }
        if($("#inqTitNm").val().length > 10){
            alert('理쒕� 10�먭퉴吏� �낅젰 媛��ν빀�덈떎.');
            return false;
        }
        
        sForm.attr('action', _baseUrl + "counsel/getFaqList.do");
        sForm.attr('method', "POST");
        
        sForm.submit();
    },
    /**
     * �섏씠吏�
     */
    goPage : function(pageIdx){
        var param = { faqLrclCd : $("#faqLrclCd").val(),
                faqMdclCd : $("#faqMdclCd").val(),
                inqTitNm : $("#inqTitNm").val()
        }
        
        var paramUrl = $.param( param );
                
        location.href = _baseUrl + "counsel/getFaqList.do?pageIdx=" + pageIdx + '&'+paramUrl;
    },
    /**
     * 紐⑸줉 �� 寃��� 臾멸뎄 蹂쇳듃 泥섎━
     */
    setFaqListTxtBold : function() {
        var inqTitNm = $("#inqTitNm").val();
        if(inqTitNm.length > 0){
            $(".list-customer").find('p').each(function(){
                var html = $(this).html();
                
                if(html.indexOf("span") < 0){
                    var reHtml = html.replace(new RegExp("("+inqTitNm+")","gi"),"<span class='tx_same'>$1</span>");
                    $(this).html(reHtml);
                }
            })
        }
    },
    
    bindWebLog : function() {
        //�곷떒��
        $("#tabFaq").bind("click", function() {
            common.wlog("customer_faq"); 
        });
        $("#tab1on1").bind("click", function() {
            common.wlog("customer_1to1"); 
        });
        $("#tabNotice").bind("click", function() {
            common.wlog("customer_notice"); 
        });
        //寃��됰쾭��
        $("#searchFaq").bind("click", function() {
            common.wlog("customer_faq_search");
        });
        //��쾭��
        $("#TabsOpenArea .comm2sTabs").children("li").each(function(idx) {
            if ($(this).attr("data-cd") == "99") {
                $(this).bind("click", function() {
                    common.wlog("customer_faq_top10");
                });
            
            } else if ($(this).attr("data-cd") == "40") {
                $(this).bind("click", function() {
                    common.wlog("customer_faq_membership");
                });
                
            } else if ($(this).attr("data-cd") == "10") {
                $(this).bind("click", function() {
                    common.wlog("customer_faq_order");
                });
                
            } else if ($(this).attr("data-cd") == "20") {
                $(this).bind("click", function() {
                    common.wlog("customer_faq_delivery");
                });
                
            } else if ($(this).attr("data-cd") == "30") {
                $(this).bind("click", function() {
                    common.wlog("customer_faq_refund");
                });
                
            } else if ($(this).attr("data-cd") == "60") {
                $(this).bind("click", function() {
                    common.wlog("customer_faq_event");
                });
                
            } else if ($(this).attr("data-cd") == "90") {
                $(this).bind("click", function() {
                    common.wlog("customer_faq_etc");
                });
                
            }

        });
    }
    
};