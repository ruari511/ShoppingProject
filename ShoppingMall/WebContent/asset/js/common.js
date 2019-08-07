var console = window.console || {
    log : function() {
    },
    info : function() {
    },
    warn : function() {
    },
    error : function() {
    }
};

//諛붾줈援щℓ �λ컮援щ땲�먯꽌 �꾨줈紐⑥뀡 �먯꽭�덈낫湲곕젅�댁뼱�� �λ컮援щ땲 踰꾪듉�� �뚮��꾨븣 �묐떟 移댄듃踰덊샇 ����
var cartNosForDirectCart = "";
var beautyLoginCnt = sessionStorage.getItem("lCnt");

if(beautyLoginCnt == null || beautyLoginCnt == 'NaN' || beautyLoginCnt == "null") beautyLoginCnt = 0;

$.namespace = function() {
    var a = arguments, o = null, i, j, d;
    for (i = 0; i < a.length; i = i + 1) {
        d = a[i].split(".");
        o = window;
        for (j = 0; j < d.length; j = j + 1) {
            o[d[j]] = o[d[j]] || {};
            o = o[d[j]];
        }
    }
    return o;
};

jQuery.fn.serializeObject = function() {
    var obj = null;
    try{
        if ( this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) {
            var arr = this.serializeArray();
            if ( arr ) {
              obj = {};
              jQuery.each(arr, function() {
                obj[this.name] = this.value;
              });
            }
        }
    }
    catch(e) {}
    finally  {}

    return obj;
};

$.namespace("common");
common = {

    scrollPos : 0,

    cannotAccess : function() {
        alert('�묎렐�� �� �놁뒿�덈떎. 沅뚰븳�� 遺�議깊빀�덈떎.');
    },
    validateFieldNotEmpty : function(id, message) {
        var loginId = $(id).val();
        if ($.trim(loginId) == '') {
            alert(message);
            return false;
        }

        return true;
    },
    convertSystemToJtmpl : function(str){
        if(str){
            str = str.replace(/\n/gi, "<br/>");
            str = str.replace(/ /gi, "&nbsp;");
            return str;
        }
    },
    splitToEnterKey : function(str){
        if(str){
            var patt= /\n/g;

            if(patt.test(str)){
                str = str.split(/\r|\n/)[0];
            }
            return str;
        }
    },

    sessionClear:function(){
        var url = _baseUrl +"login/sessionClear.do";
        common.Ajax.getAjaxObj("POST", url, "");
        console.log("sessionClear=======");
    },

    loginChk : function(){
        var url= _baseUrl + "login/loginCheckJson.do";
        var loginResult = false;

        $.ajax({
            type: "POST",
            url: url,
            data: null,
            dataType : 'json',
            async: false,
            cache: false,
            success: function(data) {

                if(!data.result && data.url!=null){
                    window.location.href = _secureUrl + data.url + "?redirectUrl=" + encodeURIComponent(location.href);
                }

                loginResult = data.result;
            },
            error : function(a, b, c) {
                console.log(a);
                console.log(b);
                console.log(c);
            }
        });

        return loginResult;
    },


    isLogin : function(){
        var url= _baseUrl + "login/loginCheckJson.do";
        var loginResult = false;

        $.ajax({
            type: "POST",
            url: url,
            data: null,
            dataType : 'json',
            async: false,
            cache: false,
            success: function(data) {
                loginResult = data.result;
            },
            error : function() {
                loginResult = false;
            }
        });

        return loginResult;
    },
    
    isBeautyLoginCnt : function(){
        var url= _baseUrl + "login/loginCheckJson.do";
        
        $.ajax({
            type: "POST",
            url: url,
            data: null,
            dataType : 'json',
            async: false,
            cache: false,
            success: function(data) {
                beautyLoginCnt++;
            },
            error : function() {
                beautyLoginCnt = 0;
            }
        });

        return beautyLoginCnt;
    },

    fileChk : function(file){
        var maxSize = 500 * 1024 * 1024 ; // 500KB
        // var maxSize = 0 ;
        var fileFilter =/.(jpg|gif|png|jpeg)$/i;
        var fileType = "";
        var fileSize = 0;

        if(file != null && file != undefined){
            for(i = 0; i < file.size(); i++){
                if(file[i].value!=""){
                    fileType = file[i].files[0].name.slice(file[i].files[0].name.lastIndexOf("."));
                    fileSize = file[i].files[0].size;

                    /*
                     * console.log("�뚯씪["+i+"]>>"+file);
                     * console.log("�뚯씪Type["+i+"]>>"+fileType);
                     */

                    if(!fileType.match(fileFilter)){
                        alert("�깅줉�� �� �녿뒗 �뚯씪 �뺤떇�낅땲��.");
                        return false;
                    }

                    if(fileSize > maxSize){
                        alert("�대�吏� �뚯씪�� 500KB瑜� �섏쓣 �� �놁뒿�덈떎.");
                        return false;
                    }
                }else{
                    console.log("泥⑤��� �뚯씪�� �놁뒿�덈떎.["+file[i].name+"]");
                    return false;
                }
            }
            return true;
        }
    },
    getNowScroll : function() {
        var de = document.documentElement;
        var b = document.body;
        var now = {};
        now.X = document.all ? (!de.scrollLeft ? b.scrollLeft : de.scrollLeft) : (window.pageXOffset ? window.pageXOffset : window.scrollX);
        now.Y = document.all ? (!de.scrollTop ? b.scrollTop : de.scrollTop) : (window.pageYOffset ? window.pageYOffset : window.scrollY);
        return now;
    },
    isEmpty : function(str) {
        if (str == undefined || str == null || str === "" || str == "undefined" || str == "null") {
            return true;
        } else {
            return false;
        }
    },
    /**
     * Validation 泥섎━瑜� �꾪븳 Object
     */
    Validator : {
        /**
         * common.Validator.isNumber()
         *
         * �대떦 �꾨뱶 媛믪씠 �レ옄�몄� �щ�瑜� 寃��� ��.
         *
         * �ъ슜 ��)
         * common.Validator.isNumber("#elId", "媛믪쓣 �뺤씤 �섏꽭��.");
         * �쇰븣 �ㅼ쓬�� �숈옉 �ㅽ뻾
         * if($("#elId").val() != �レ옄) {
         *      alert("媛믪쓣 �뺤씤 �섏꽭��.");
         *      $("#elId").focus();
         *    }
         *
         *
         *
         * @param jqPath : Element�� Jquery Path
         * @param message : �낅젰媛� �ㅻ쪟�쇰븣 �쒖떆�� Message 媛�
         *
         * @return true(�뺤긽) or false(�ㅻ쪟)
         *
         *
         */
        isNumber : function(jqPath, message) {
            var obj = $(jqPath);
            var value = obj.val();
            var isNumber = value.isNumber();
            if(!(isNumber)) {
                alert(message);
                obj.focus();
            }
            return isNumber;
        }
    },
    /**
     * timeStamp �곗씠��瑜� �좎쭨 �щ㎎�쇰줈 蹂���
     */
    formatDate  : function (timeStamp, format){
        var newDate = new Date();
        newDate.setTime(timeStamp);
        var formatDate = newDate.format(format);

        return formatDate;
    },

    setLazyLoad : function(type) {

        if (type == undefined  || type == "seq" ) {
            //lazyload - �대�吏��ㅽ겕濡ㅼ씠踰ㅽ듃
            $(document).find("img.seq-lazyload").lazyload({
                effect : "fadeIn",
                event : "sequential"
            });

            //濡쒕뵫 �� �대�吏��� 以묐났�쇰줈 lazyload瑜� 諛붿씤�쒗븯吏� �딅룄濡� �섍린 �꾪빐 �대옒�ㅻ챸 蹂�寃�
            $(document).find("img.seq-lazyload").removeClass("seq-lazyload").addClass("completed-seq-lazyload");

        }

        if (type == undefined  || type == "scr" ) {
            //lazyload - �대�吏��ㅽ겕濡ㅼ씠踰ㅽ듃
//            $(document).find("img.scroll-lazyload").lazyload({
//                effect : "fadeIn",
//                add_bottom_scroll: 500,          //20150529 jwlim �곹뼢 �ㅽ겕濡� �� �뗮똿�� �쎌� 癒쇱� 濡쒕뵫
//                sub_top_scroll  : 500           //20150529 jwlim �섑뼢 �ㅽ겕濡� �� �뗮똿�� �쎌� 癒쇱� 濡쒕뵫
//            });

            $(document).find("img.scroll-lazyload").lazyload({
                effect : "fadeIn",
                event : "sequential"
            });

            //濡쒕뵫 �� �대�吏��� 以묐났�쇰줈 lazyload瑜� 諛붿씤�쒗븯吏� �딅룄濡� �섍린 �꾪빐 �대옒�ㅻ챸 蹂�寃�
            $(document).find("img.scroll-lazyload").removeClass("scroll-lazyload").addClass("completed-scroll-lazyload");
        }

    },

    //  �ъ엯怨� �뚮┝ �앹뾽 �ㅽ뵂
    openStockAlimPop : function(goodsNo, itemNo){
        if ( common.loginChk() ){
            var url = _baseUrl + "goods/getAlertStockAjax.do";
            var data = {goodsNo : goodsNo, itemNo : itemNo};
            common.Ajax.sendRequest("POST",url,data,common._callBackAlearStockForm);
        }
    },

    //  �ъ엯怨� �뚮┝ 肄쒕갚
    _callBackAlearStockForm : function(res){
        $('body').append(res);
        fnLayerSet('reStockAlim', 'open');
    },

    //  �됱궗�덈궡 �앹뾽 �ㅽ뵂
    openEvtInfoPop : function( promNo, promKndCd, promCond, goodsNo, itemNo ){
        
        var quickYn = $(":input:radio[name=qDelive]:checked").val();
        if(typeof(quickYn) == "undefined"){
            quickYn = $("#quickYn").val();
        }
        
        var url = _baseUrl + "goods/getGoodsPromEvtInfoAjax.do";
        var data = {promNo : promNo, promKndCd : promKndCd, promCond : promCond, goodsNo : goodsNo, itemNo : itemNo, quickYn: quickYn};
        common.Ajax.sendRequest("POST",url,data,common._callBackGoodsEvtInfo);
    },

    //  �됱궗�덈궡 肄쒕갚
    _callBackGoodsEvtInfo : function(res){
        $("#layer_pop_wrap").html(res);

        //�덉씠�� �앹뾽 �꾩슦�� �⑥닔
        fnLayerSet("layer_pop_wrap", "open");
    },
    
    isMainHome : function() {
        try {
            if (location.href.endWith("/main/main.do#0")) {
                return true;
            }

            return false;
        } catch(e) {
            return false;
        }
    },

    bindGoodsListLink : function(filterSelectorStr) {
        var classNm = filterSelectorStr == undefined ? "" : filterSelectorStr + " ";

        $(classNm + ".goodsList").unbind("click");

        $(classNm + ".goodsList").bind("click", function(e) {
            e.preventDefault();
            
            if($(this).hasClass("btn_new_pop")){
                //�덉갹蹂닿린
                common.link.moveGoodsDetailNew($(this).parent().parent().find("a").attr("data-ref-goodsNo"), $(this).parent().parent().find("a").attr("data-ref-dispCatNo"));
            }else{
                //�섏씠吏��대룞
                common.link.moveGoodsDetail($(this).attr("data-ref-goodsNo"), $(this).attr("data-ref-dispCatNo"));
            }
        });
        $(classNm + ".goodsList.kiosk").unbind("click");
        $(classNm + ".goodsList.kiosk").bind("click", function(e) {
            e.preventDefault();
            var goodsNo = $(this).attr("data-ref-goodsNo");
            var dispCatNo = $(this).attr("data-ref-dispCatNo");
            common.kiosk.goodDetailLog();
            setTimeout(function(){
                common.link.moveGoodsDetailKiosk(goodsNo, dispCatNo);
            },10);
        });

        $(classNm + ".goodsListLogin").bind("click", function(e) {
            e.preventDefault();
            //濡쒓렇�� �깆씤泥댄겕 濡쒓렇�몄꽦��
            common.link.moveGoodsDetail($(this).attr("data-ref-goodsNo"), $(this).attr("data-ref-dispCatNo"));

        });

        $(classNm + ".goodsListAuth").bind("click", function(e) {
            e.preventDefault();
            // �깆씤泥댄겕 �깆씤
            common.link.moveGoodsDetail($(this).attr("data-ref-goodsNo"), $(this).attr("data-ref-dispCatNo"));
        });
        
        
        $(classNm + ".goodsListAuth.kiosk").unbind("click");
        $(classNm + ".goodsListLogin.kiosk").bind("click", function(e) {
            e.preventDefault();
            //濡쒓렇�� �깆씤泥댄겕 濡쒓렇�몄꽦��
            var goodsNo = $(this).attr("data-ref-goodsNo");
            var dispCatNo = $(this).attr("data-ref-dispCatNo");
            setTimeout(function(){
                common.link.moveGoodsDetailKiosk(goodsNo, dispCatNo);
            },10);
            
        });
        $(classNm + ".goodsListAuth.kiosk").unbind("click");
        $(classNm + ".goodsListAuth.kiosk").bind("click", function(e) {
            e.preventDefault();
            // �깆씤泥댄겕 �깆씤
            var goodsNo = $(this).attr("data-ref-goodsNo");
            var dispCatNo = $(this).attr("data-ref-dispCatNo");
            setTimeout(function(){
                common.link.moveGoodsDetailKiosk(goodsNo, dispCatNo);
            },10);
        });
        
        //�λ컮援щ땲 �대┃
        $(classNm + ".cartBtn").bind('click',function(){
            if (common.loginChk()) {
                //  �듭뀡�좏깮�� �덇굅��, �녾굅�� �쇰떒 �붾㈃ 吏꾩엯
                var url = _baseUrl + "common/getCartOptionSelectAjax.do";
                
                var tmpItemNo = $(this).attr("data-ref-itemNo");
                if (tmpItemNo.length > 3) {
                    tmpItemNo = "001";
                }
                
                var data;
                
                // �ㅻ뒛�쒕┝ �꾨Ц愿� 由ъ뒪�몄씤 寃쎌슦 �λ컮援щ땲 �대┃�� �ㅻ뒛�쒕┝ �λ컮援щ땲�� 異붽��섍쾶�� �섍린�꾪빐 媛� 異붽�
                // quickInfo class�� �ㅻ뒛�쒕┝ �꾨Ц愿��먯꽌留� �ъ슜��
                if($(this).closest("li").hasClass("quickInfo")){
                    data = {goodsNo : $(this).attr("data-ref-goodsNo"), itemNo : tmpItemNo , quickYn : "Y" };
                } else {
                    data = {goodsNo : $(this).attr("data-ref-goodsNo"), itemNo : tmpItemNo };
                }
                
                common.Ajax.sendRequest("POST",url,data,common._callCartOptionSelect);                    
            }
        });
        
        //�곹뭹�� �대┃
        $(classNm + ".prd_info .comment li p").bind("click", function(e) {
            e.preventDefault();
            var goodsListElmt = $(this).closest(".prd_info").find(".goodsList").eq(0);
            var goodsNo = goodsListElmt.attr("data-ref-goodsNo");
            
            if(goodsNo == undefined || goodsNo == null || goodsNo == ""){
                goodsListElmt = $(this).closest(".prd_info").find(".goodsListLogin").eq(0);
                goodsNo = goodsListElmt.attr("data-ref-goodsNo");
            }
            
            if(goodsNo == undefined || goodsNo == null || goodsNo == ""){
                goodsListElmt = $(this).closest(".prd_info").find(".goodsListAuth").eq(0);
                goodsNo = goodsListElmt.attr("data-ref-goodsNo");
            }
            
            common.link.moveGoodsDetailTab(goodsNo, goodsListElmt.attr("data-ref-dispCatNo"), 2);
        }).bind("mouseover", function() {
            $(this).css("cursor", "pointer");
        }).bind("mouseout", function() {
            $(this).css("cursor", "");
        });
        
        //�곹뭹蹂꾩젏 �대┃
        $(classNm + ".prd_info .prd_point_area").bind("click", function(e) {
            e.preventDefault();
            var goodsListElmt = $(this).closest(".prd_info").find(".goodsList").eq(0);
            var goodsNo = goodsListElmt.attr("data-ref-goodsNo");
            
            if(goodsNo == undefined || goodsNo == null || goodsNo == ""){
                goodsListElmt = $(this).closest(".prd_info").find(".goodsListLogin").eq(0);
                goodsNo = goodsListElmt.attr("data-ref-goodsNo");
            }
            
            if(goodsNo == undefined || goodsNo == null || goodsNo == ""){
                goodsListElmt = $(this).closest(".prd_info").find(".goodsListAuth").eq(0);
                goodsNo = goodsListElmt.attr("data-ref-goodsNo");
            }
            
            common.link.moveGoodsDetailTab(goodsNo, goodsListElmt.attr("data-ref-dispCatNo"), 2);
        }).bind("mouseover", function() {
            $(this).css("cursor", "pointer");
        }).bind("mouseout", function() {
            $(this).css("cursor", "");
        });
    },
    
    //  �듭뀡 �좏깮 �� �덉씠�� �ㅽ뵂
    _callCartOptionSelect : function(data){
        var tmpOption = $("<div id=\"tmpOption\">" + data + "</div>");
        
        // �꾨줈紐⑥뀡 �뺣낫 媛��몄삤湲�
        common.cart.promKndCd = tmpOption.find("#promKndCd").val();
        common.cart.promNo = tmpOption.find("#promNo").val();
        common.cart.buyCnt = tmpOption.find("#buyCnt").val();
        common.cart.getItemAutoAddYn = tmpOption.find("#getItemAutoAddYn").val();
        
        if (tmpOption.find("#dupYn").val() != 'Y') {
            //�듭뀡�� �녿뒗 �곹뭹�� 寃쎌슦 諛붾줈 �λ컮援щ땲 �깅줉 
            var cartGoodsNo = tmpOption.find("#paramGoodsNo").val();
            var cartItemNo = tmpOption.find("#paramItemNo").val();
            
            // �ㅻ뒛�쒕┝ �꾨Ц愿��먯꽌 �λ컮援щ땲 �대┃�� val媛믪� Y�대떎
            var cartQuickYn = tmpOption.find("#quickYn").val();
            
            // Y媛� �꾨땶寃쎌슦�� �ㅻ뒛�쒕┝ 愿��� �쒖뼱媛� �꾩슂 �녾린 �뚮Ц�� N�쇰줈 珥덇린��
            if(cartQuickYn != "Y"){
                cartQuickYn = "N";
            }
            
            //  �듭뀡�좏깮�� �녿떎硫�, �뚮씪誘명꽣 諛쏆� 媛믪쑝濡� 諛붾줈 RegCart �ㅽ뻾
            if(cartGoodsNo != undefined && cartGoodsNo != "" && cartItemNo != undefined && cartItemNo != "" ){
                var resultData = new Array();
                
                var param = { 
                      goodsNo : cartGoodsNo,
                      itemNo : cartItemNo,
                      ordQty : 1,
                      quickYn : cartQuickYn,
                      regCartRecoBellGoodsInCartYn : common.cart.regCartRecoBellGoodsInCartYn,
                }
                resultData.push(param);
                
                // �꾨줈紐⑥뀡�� �숈씪(P201), A+B(P203) �닿퀬, N+1 以� N�� 1�� 寃쎌슦, FreeGift 媛� 1醫낅쪟�� 寃쎌슦 Get�곹뭹 異붽�
                var promNo = common.cart.promNo;
                var promKndCd = common.cart.promKndCd;
                
                var buyGoodsNo = cartGoodsNo;
                var buyItemNo = cartItemNo;
                var buyOrdQty = 1;
                var samePrdSumOrdQty = buyOrdQty;
                var buyCondStrtQtyAmt = common.cart.buyCnt;
                
                var getItemAutoAddYn = common.cart.getItemAutoAddYn;
                var getGoodsNo = (promKndCd == "P201") ? cartGoodsNo : tmpOption.find("#getItemGoodsNo").val();
                var getItemNo = (promKndCd == "P201") ? cartItemNo : tmpOption.find("#getItemItemNo").val();
                var getOrdQty = 1;
                
                if(promNo != undefined && promNo != '' && buyCondStrtQtyAmt == 1){
                    if(promKndCd == "P201" || 
                      (promKndCd == "P203" && getItemAutoAddYn == "Y" && 
                       getGoodsNo != undefined && getGoodsNo != '' && 
                       getItemNo != undefined && getItemNo != '')){
                    
                        var getGoodsData = {
                                goodsNo : getGoodsNo,
                                itemNo : getItemNo,
                                ordQty : buyOrdQty,
                                rsvGoodsYn : "N", // �덉빟�곹뭹�щ�
                                dispCatNo : "",  // �꾩떆移댄뀒怨좊━ 踰덊샇
                                drtPurYn : "N",            //諛붾줈援щℓ�щ�
                                promKndCd : promKndCd,     //�꾨줈紐⑥뀡援щ텇
                                crssPrstNo : promNo,        //�꾨줈紐⑥뀡踰덊샇
                                prstGoodsNo : buyGoodsNo,  //��寃웑uy援곗쓽 �곹뭹踰덊샇
                                prstItemNo : buyItemNo,    //��寃웑uy援곗쓽 �꾩씠�쒕쾲��
                                buyCondStrtQtyAmt : buyCondStrtQtyAmt,
                                samePrdSumOrdQty : samePrdSumOrdQty,     //�곹뭹踰덊샇 �꾩씠�쒕쾲�멸� 媛숈��곹뭹�� �섎웾�� �⑺븳媛�
                                getItemAutoAddYn : getItemAutoAddYn
                        };
                                                       
                        resultData.push(getGoodsData);
                    }
                }
                // N+1 �숈씪 �� 寃쎌슦 �λ컮援щ땲�� �먮룞 異붽� (��)
    
                common.cart.regCart(resultData, 'N', '', 'Y');
            } else {
                alert("�곹뭹�뺣낫媛� �щ컮瑜댁� �딆뒿�덈떎.");
            }
        } else {
            //�듭뀡�� �덈뒗寃쎌슦
            $("#basketOption").html(data);
            
            // �듭뀡蹂�寃쎌씪 寃쎌슦 �좏깮�� �듭뀡�� �뚯쁺泥섎━
            var optChgYn = (common.cart.regCartRecoBellGoodsInCartYn == "Y") ? "N" : $("#optChgYn").val();
            var selGoodsNo = $("#paramGoodsNo").val();
            var selPkgGoodsObj = $("table.tbl_prd_list").find("tr[pkgGoodsNo=" + selGoodsNo + "]").attr("goodsNo");
            var selItemNo = $("#paramItemNo").val();
            
            if(selPkgGoodsObj != undefined)
                selGoodsNo = selPkgGoodsObj;
            
            // [START �ㅻ뒛�쒕┝ �듭뀡�곹뭹 媛쒖꽑:jwkim]
            var cartQuickYn = tmpOption.find("#quickYn").val();
            
            // �ㅻ뒛�쒕┝�� 寃쎌슦 �ㅻ뒛�쒕┝�� �꾨땶 �듭뀡�곹뭹�� �덉젅泥섎━
            // (�덉젅 臾멸뎄�� �놁쑝�� �덉젅泥섎읆 �좏깮�� �� �녾쾶 �섍린�꾪빐�� �ъ슜)
            if(cartQuickYn == "Y"){
                $("#basketOption .nonQuick").addClass("soldout");
            }
            // [END �ㅻ뒛�쒕┝ �듭뀡�곹뭹 媛쒖꽑:jwkim]
            
            if(optChgYn == "Y"){
                $("ul.sel_option_list li").each(function(){
                    var curGoodsNo = $(this).find("a").attr("data-ref-goodsNo");
                    var curItemNo = $(this).find("a").attr("data-ref-itemNo");
                    
                    if( selGoodsNo == curGoodsNo && selItemNo == curItemNo ){
                        $(this).addClass("on");
                        $("a#mainCartSelect").text($(this).find("span.option_value").text());
                    }
                });
                
                if($("ul.sel_option_list li").length <= 1)
                    $("a#mainCartSelect").text("�좏깮 媛��ν븳 �곹뭹�� �놁뒿�덈떎.");
            }
            
            fnLayerSet('basketOption', 'open');
            
            //�リ린踰꾪듉 �대┃�대깽��
            $("#basketOption").find(".layer_close").bind('click', function(){
                fnLayerSet('basketOption', 'close');
            });
        }
    },
    
    //  �λ컮援щ땲 �닿린 �� �꾨즺 �덉씠�� �ㅽ뵂
    _callCartComplete : function(data){
        $("#basketOption").html(data);
        fnLayerSet('basketOption', 'open');
    },

    popContLayerClose : function(){
        $(".dimm").remove();
        $("#pop_cont").hide();
    },
    
    preventAction : function(){
        $(document.body).attr("oncontextmenu", "return false");
        document.onkeydown = common.preventKeyAction;
        document.onmousedown = common.preventKeyAction;
    },
    
    preventKeyAction : function(){
        if (event.keyCode == 17){
            alert ("Ctrl 湲덉�");
            return false;
        }
        
//        if (event.keyCode == 18){
//            alert ("Alt 湲덉�");
//            return false;
//        }
//        
        if (event.keyCode ==91){
            event.keyCode == 505;
            alert ("�덈룄�� Fuction Key 湲덉�");
        }
        
        if (event.keyCode > 112 && event.keyCode < 123){
            event.keyCode = 505;
            alert("Function key 湲덉�");
        }
        if (event.keyCode == 505) {
            return false;
        }
    },
    
    //  �됱궗�덈궡 �앹뾽 �リ린
    closePromEvtPop : function(){
        
        fnLayerSet('layer_pop_wrap', 'close');
        $('#layer_pop_wrap').css('top','');
        $('#layer_pop_wrap').css('margin-left','');
        $('#layer_pop_wrap').css('margin-top','');
        
        if ( location.href.indexOf("getCart.do") > 0 && common.cart.regCartCnt > 0 ){
            var linkCartNo = location.href.substring(location.href.indexOf("cartNo=")+7);
            var sumCartNo = "";
            
            if(linkCartNo != ""){
                if(cartNosForDirectCart != ""){
                    sumCartNo = linkCartNo + "," + cartNosForDirectCart;
                }else{
                    sumCartNo = linkCartNo;
                }
            }
            
            cartNosForDirectCart = "";
            common.cart.regCartCnt = 0;
            
            if(location.href.indexOf("cartNo=") > 0){
                location.href = _secureUrl + "cart/getCart.do?cartNo=" + sumCartNo;
            }else{
                window.location.reload();
            }
        }
    },
    
    //  �λ컮援щ땲 �듭뀡 �좏깮 �≪뀡
    setItem : function(goodsNo, itemNo, obj){
        
        //  �좏깮�� �곹뭹踰덊샇, �⑦뭹踰덊샇 �명똿
        $("#cartGoodsNo").val(goodsNo);
        $("#cartItemNo").val(itemNo);
        
        //  �좏깮�� �곹뭹紐� �명똿
        $(obj).parents('.prd_option_box').find('.sel_option').html($(this).find(".option_value").html());
        
        //  �좏깮李� �リ린
        $(obj).parents('.prd_option_box').removeClass('open');
    },
    
    /**
     * �대�吏� 怨듯넻 泥섎━
     */
    errorImg : function(obj) {
        obj.src = _imgUrl + "/comm/noimg_550.gif";
        obj.onerror = '';
    },
    
    errorBrandImg : function(obj) {
        obj.src = _imgUrl + "/comm/noimage_brandshop.png";
        obj.onerror = '';
    },
    
    /** EP 荑좏룿 **/
    epCouponOpen : function(){
        $("#layer_pop_wrap").html($("#pluscouponDownload").html());
        fnLayerSet('layer_pop_wrap', 'open');
    },
    
    /**
     * �밸줈洹� 
     */
    wlog : function(wlKey) {
        try {
            try{
                if(wlKey=="goods_cart"){
                    n_click_logging(_baseUrl+"cart/regCartJson.do", _baseUrl+"goods/getGoodsDetail.do");
                }else if(wlKey=="goods_buy"){
                    n_click_logging(_baseUrl+"order/getOrderForm.do", _baseUrl+"store/goods/getGoodsDetail.do");
                }else if(wlKey=="home_curation_area"){
                    n_click_logging(_baseUrl + "?clickarea=" + wlKey);
                }
            }catch(e){}
            n_click_logging(_baseUrl + "?clickspace=" + wlKey);
        } catch (e) {
        }

//        setTimeout(function() {
//            $.ajax({
//                type: "GET",
//                url: _baseUrl + "common/dummyJson.do?clickspace=" + wlKey,
//                contentType: "application/json;charset=UTF-8",
//                dataType : 'json',
//                async: true,
//                cache: false,
//                success: function(data) {
//                }
//            });
//        }, 10);
    },

};

$.namespace("common.gnb");
common.gnb = {

    init : function() {
      //理쒓렐 蹂� �곹뭹
        try {
            common.recentGoods.init();
        } catch (e) {}
        
        $(".page_location .loc_home").bind("click", function() {
           common.link.moveMainHome();
        });
        $(".page_location .loc_home.kiosk").bind("click", function() {
            common.link.moveMainHomeKiosk();
        });
        
        setTimeout(function() {
            //�밸줈洹� 諛붿씤��
            common.gnb.bindWebLog();
        }, 700);
    },


    initMypageMenu : function() {
        common.gnb.bindMypageMenu();
    },

    bindMypageMenu : function() {
        $(".mypage-lnb .subMenu").bind("click", function(e) {
            e.preventDefault();
            location.href = $(this).find("a").attr("data-ref-linkUrl");
        });
    },

    /**
     * 留덉씠�섏씠吏� 硫붾돱 �좏깮
     */
    setMypageMenu : function(menuId) {
        $(".mypage-lnb .subMenu").removeClass("on");
        $(".mypage-lnb .subMenu").find("a[myMenuId='" + menuId + "']").closest("li").addClass("on");
    },
    
    //�밸줈洹� 諛붿씤��
    bindWebLog : function() {
        //�쇰컲�λ뫁�대같��
        $(".main_moving_banner a").bind("click", function() {
            common.wlog("home_floating_normal");
        });
        //BI
        $(".header_inner h1 a").bind("click", function() {
            common.wlog("home_header_bi");
        });
        //�뚯썝媛���
        $("#Header .menu_list .join").bind("click", function() {
            common.wlog("home_header_join");
        });
        //濡쒓렇��
        $("#Header .menu_list .login").bind("click", function() {
            common.wlog("home_header_login");
        });
        //濡쒓렇�꾩썐
        $("#Header .menu_list .logout").bind("click", function() {
            common.wlog("home_header_logout");
        });
        //留덉씠�섏씠吏�
        $("#Header .menu_list .mypage").bind("click", function() {
            common.wlog("home_header_mypage");
        });
        //移댄듃
        $("#Header .menu_list .cart").bind("click", function() {
            common.wlog("home_header_cart");
        });
        //諛곗넚
        $("#Header .menu_list .order").bind("click", function() {
            common.wlog("home_header_delivery");
        });
        //怨좉컼�쇳꽣
        $("#Header .menu_list .customer").bind("click", function() {
            common.wlog("home_header_customer");
        });
        //留ㅼ옣�덈궡
        $("#Header .menu_list .store").bind("click", function() {
            common.wlog("home_header_store");
        });
        
        //留ㅼ옣�덈궡
        $("#Header .menu_list .store").bind("click", function() {
            common.wlog("home_header_store");
        });
        //移댄뀒怨좊━
        $(".all_menu_wrap a").bind("click", function() {
            common.wlog("home_gnb_" + $(this).attr("data-ref-dispCatNo"));
        });
        //愿��щℓ�κ났吏�
        $(".mymenu_area .store .store_info").bind("click", function() {
            common.wlog("home_header_interest_" + $(this).attr("data-ref-strNo"));
        });
        //gnb 硫붾돱
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getHotdealList.do']").bind("click", function() {
            common.wlog("home_gnb_hotdeal");
        });
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getThemeList.do']").bind("click", function() {
            common.wlog("home_gnb_theme");
        });
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getCouponList.do']").bind("click", function() {
            common.wlog("home_gnb_coupon");
        });
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getEventList.do']").bind("click", function() {
            common.wlog("home_gnb_event");
        });
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getPlanShopList.do']").bind("click", function() {
            common.wlog("home_gnb_planshop");
        });
        $(".gnb_menu_list").find('span:contains("��#")').bind("click", function() {
            common.wlog("home_gnb_petshop");
        });
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getOnlyOneList.do']").bind("click", function() {
            common.wlog("home_gnb_onlyone");
        });
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getNewList.do']").bind("click", function() {
            common.wlog("home_gnb_new");
        });
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getSaleList.do']").bind("click", function() {
            common.wlog("home_gnb_sale");
        });
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getBestList.do']").bind("click", function() {
            common.wlog("home_gnb_best");
        });
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getBrandList.do']").bind("click", function() {
            common.wlog("home_gnb_brand");
        });
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getQuickList.do']").bind("click", function() {
            common.wlog("home_gnb_quick");
        });
        $(".gnb_menu_list").find("a[data-ref-linkUrl='main/getQuickMainList.do']").bind("click", function() {
            common.wlog("home_gnb_quick");
        });
        
        //footer
        $(".oneConts .list-menu li .brandstory").bind("click", function() {
            common.wlog("home_footer_brandstory");
        });
        $(".oneConts .list-menu li .recruit").bind("click", function() {
            common.wlog("home_footer_recruit");
        });
        $(".oneConts .list-menu li .prvsuser").bind("click", function() {
            common.wlog("home_footer_prvsuser");
        });
        $(".oneConts .list-menu li .cjoyp").bind("click", function() {
            common.wlog("home_footer_cjoyp");
        });
        $(".threeConts .sns .facebook").bind("click", function() {
            common.wlog("home_footer_facebook");
        });
        $(".threeConts .sns .twitter").bind("click", function() {
            common.wlog("home_footer_twitter");
        });
        $(".threeConts .sns .kakao").bind("click", function() {
            common.wlog("home_footer_kakaotalk");
        });
        $(".threeConts .sns .cafe").bind("click", function() {
            common.wlog("home_footer_navercafe");
        });
        $(".threeConts .sns .insta").bind("click", function() {
            common.wlog("home_footer_instagram");
        });
    }
};

/*--------------------------------------------------------------------------------*\
* SNS 怨듯넻 script
\*--------------------------------------------------------------------------------*/
$.namespace("common.sns");
common.sns = {

    /**
     * 怨듯넻 SNS 怨듭쑀 諛⑸쾿
     *
     * 1. 怨듭쑀瑜� �먰븯�� �섏씠吏��먯꽌 common.sns.init �⑥닔瑜� �몄텧�쒕떎.
     *
     * 2. init �⑥닔 �몄텧�� �꾩슂�� �몄옄�� �대�吏�URL, 怨듭쑀�쒕ぉ, 怨듭쑀�� URL�� �쒕떎.
     *
     * 3. init�꾩뿉�� 媛� 怨듭쑀 踰꾪듉 留덈떎 common.sns,doShare �⑥닔瑜� �몄텧�쒕떎.
     *
     * 4. doShare�� �꾩슂�� �몄텧�몄옄�� 怨듭쑀�� �쒕퉬�� 紐낆씠��. (kakaotalk, kakaostory, facebook)
     *
     */

    imgUrl : '',        //  �대�吏� URL
    title : '',         //  怨듭쑀 �쒕ぉ
    shareUrl : '',      //  怨듭쑀�� URL

    //  SNS 怨듭쑀 Init �⑥닔
    init : function(imgUrl, title, shareUrl) {

        //  移댁뭅�ㅽ넚 Init
        Kakao.init('24077b12ac18b11a96696382ccaa7138');
//        Kakao.init('0305c586bcd3328a207f11633e65717a');

        common.sns.imgUrl = imgUrl;
        common.sns.title = title;
        common.sns.shareUrl = shareUrl;

        //  硫뷀� �쒓렇 INIT
        common.sns.metaTagInit();

        //  URL INPUT BOX �명똿
        $("#shareUrlTxt").attr("value",shareUrl);
    },

    //  �섏씠�ㅻ턿 怨듭쑀瑜� �꾪븳 硫뷀� �쒓렇 �명똿
    metaTagInit : function(){
        $("meta[property='og:title']").attr("content", common.sns.title);
        $("meta[property='og:url']").attr("content", common.sns.shareUrl);
        $("meta[property='og:image']").attr("content", common.sns.imgUrl);
    },

    //  怨듭쑀 泥섎━
    doShare : function(type) {

        //  移댁뭅�ㅽ넚
        if(type == "kakaotalk") {

            Kakao.Link.sendDefault({
                objectType: 'feed',
                content: {
                    title: common.sns.title,
                    imageUrl:  common.sns.imgUrl,
                    link: {
                        webUrl:common.sns.shareUrl, 
                        mobileWebUrl: common.sns.shareUrl,
                        androidExecParams: common.sns.shareUrl,
                        iosExecParams : common.sns.shareUrl
                    }
                },
                buttons: [
                    {
                      title: '�깆쑝濡� 蹂닿린',
                      link: {
                        mobileWebUrl: common.sns.shareUrl,
                        webUrl:common.sns.shareUrl
                      }
                    }
                  ]
            });

        }else if(type == "kakaostory"){         //  移댁뭅�ㅼ뒪�좊━

            Kakao.Story.share({
                url: common.sns.shareUrl,
                text: common.sns.title
            });

        }else if(type == "facebook") {          //  �섏씠�ㅻ턿

            var facebook_url = "";
            facebook_url += "http://m.facebook.com/sharer.php?";
            facebook_url += "t="+encodeURIComponent(common.sns.title);
            facebook_url += "&u="+encodeURIComponent(common.sns.shareUrl);

            window.open(facebook_url);
        }else if(type == "url"){
//            var IE = (document.all) ? true : false; 
//            var IE11 = navigator.userAgent.search('Trident');
//            
//            if (IE || IE11!=-1) { 
//                window.clipboardData.setData('Text', common.sns.shareUrl); 
//                alert('URL 二쇱냼媛� 蹂듭궗�섏뿀�듬땲��.'); 
//            }else { 
                temp = prompt("Ctrl+C瑜� �뚮윭 �대┰蹂대뱶濡� 蹂듭궗�섏꽭��", common.sns.shareUrl ); 
//            } 
        }
    }
};


/*--------------------------------------------------------------------------------*\
* �λ컮援щ땲 怨듯넻 script
\*--------------------------------------------------------------------------------*/
$.namespace("common.cart");
common.cart = {
        cartNo : '',
        promKndCd : '',
        promNo : '',
        buyCnt : 0,
        getItemAutoAddYn : 'N',     // �꾨줈紐⑥뀡 Get援� �곹뭹 �먮룞利앷� �щ� (Get援곗쓽 �곹뭹 醫낅쪟媛� 1媛�吏��� 寃쎌슦)
        getItemGoodsNo : '',        // Get �곹뭹 醫낅쪟媛� 1媛�吏��� goods_no
        getItemItemNo : '',             // Get �곹뭹 醫낅쪟媛� 1媛�吏��� item_no
        regCartRecoBellGoodsInCartYn : 'N', // �λ컮援щ땲�먯꽌 �덉퐫踰� 異붿쿇�곹뭹 �댁븯�붿� �щ�
        regCartCnt : 0,
        jsonParam : undefined,     
        
        //  �꾩떆�먯꽌 �ъ슜 ( �꾩떆�먯꽌 �λ컮援щ땲 �댁쓣�� �곕뒗 Ajax �붾㈃�먯꽌 Init) 
        init : function(){
            if( $("#dupYn").val() != 'Y'){
                //�듭뀡�� �녿뒗 �곹뭹�� 寃쎌슦 諛붾줈 �λ컮援щ땲 �깅줉 
//                var cartGoodsNo = $("#paramGoodsNo").val();
//                var cartItemNo = $("#paramItemNo").val();
//                
//                //  �듭뀡�좏깮�� �녿떎硫�, �뚮씪誘명꽣 諛쏆� 媛믪쑝濡� 諛붾줈 RegCart �ㅽ뻾
//                if( common.cart.cartSelValid(cartGoodsNo, cartItemNo) ){
//                    var resultData = new Array();
//                    
//                    var param = { 
//                          goodsNo : cartGoodsNo,
//                          itemNo : cartItemNo,
//                          ordQty : 1
//                    }
//                    resultData.push(param);
//        
//                    common.cart.regCart(resultData, 'N', '', 'Y');
//                }
            }else{
                //  �듭뀡�덈뒗 �곹뭹�대씪硫� 踰꾪듉 Bind
                common.cart.bindButtonInit();    
            }
        },
        
        bindButtonInit : function(){
            
            //  �듭뀡 �좏깮 �덉씠�� Open & Close Bind
            $(function(){       
                $('#mainCartSelect').click(function(e){
                   e.preventDefault();
                   if($(this).parent().hasClass('open')){
                       $(this).parent().removeClass('open');
                   }else{
                       $(this).parent().addClass('open');
                   }
                });
            });
            
            //  �듭뀡 �곹뭹 �좏깮 Bind
            $('.selectItem').find('a').click(function(e){
                e.preventDefault();
                
                // �좏깮�� �곹뭹�� �덉젅�대㈃ return
                if($(this).parent().hasClass("soldout")) return;
                
                $(this).parents('.prd_option_box').find('.sel_option').html($(this).find(".option_value").html());
                $(this).parents('.prd_option_box').removeClass('open');
                
                $("#cartGoodsNo").val($(this).attr("data-ref-goodsNo"));
                
                var tmpItemNo = $(this).attr("data-ref-itemNo");
                if (tmpItemNo.length > 3) {
                    tmpItemNo = "001";
                }
                
                $("#cartItemNo").val(tmpItemNo);
                
                // �꾨줈紐⑥뀡 �뺣낫 媛깆떊
                $("#promKndCd").val($(this).attr("promKndCd"));
                $("#promNo").val($(this).attr("promNo"));
                $("#buyCnt").val($(this).attr("buyCnt"));
                $("#getItemAutoAddYn").val($(this).attr("getItemAutoAddYn"));
                $("#getItemGoodsNo").val($(this).attr("getItemGoodsNo"));
                $("#getItemItemNo").val($(this).attr("getItemItemNo"));
                
                // common.cart �꾩뿭蹂��� ����
                common.cart.promKndCd = $(this).attr("promKndCd");
                common.cart.promNo = $(this).attr("promNo");
                common.cart.buyCnt = $(this).attr("buyCnt");
                common.cart.getItemAutoAddYn = $(this).attr("getItemAutoAddYn");
                common.cart.getItemGoodsNo = $(this).attr("getItemGoodsNo");
                common.cart.getItemItemNo = $(this).attr("getItemItemNo");
            });
            
            //  �곹뭹�좏깮 �λ컮援щ땲 踰꾪듉 Bind
            $("#goodsSelCart").click(function(){
                var resultData = new Array();
                
                var goodsSctCd = $("#basketOption #goodsSctCd").val();
                var cartGoodsNo = $("#basketOption #cartGoodsNo").val();
                var cartItemNo = $("#basketOption #cartItemNo").val();
                
                var pkgGoodsYn = $("#basketOption #pkgGoodsYn").val();
                var pkgGoodsNo = (pkgGoodsYn == "Y") ? $("#basketOption #paramGoodsNo").val() : "";
                
                var promKndCd = $("#basketOption #promKndCd").val();
                var buyCondStrtQtyAmt = parseInt( $("#basketOption #buyCnt").val() );
                
                var optChgYn = (common.cart.regCartRecoBellGoodsInCartYn == "Y") ? "N" : $("#optChgYn").val();
                var goodsInfo = (pkgGoodsYn == "Y") ? $("tr[pkggoodsno=" + pkgGoodsNo + "]") : $("tr[goodsno=" + cartGoodsNo + "]");
                var ordQty = parseInt( goodsInfo.find("select[name=s_amount]").val() );
                
                if(isNaN(ordQty))
                    ordQty = parseInt( goodsInfo.find("input[name=s_amount]").val() );
                
                // �ㅻ뒛�쒕┝ �꾨Ц愿��먯꽌 �곹뭹 �듭뀡 �좏깮�� 
                // �ㅻ뒛�쒕┝ �λ컮援щ땲�� 媛�寃뚮걫 泥섎━
                // �듭뀡�곹뭹�� �꾨땶寃쎌슦�� 媛숈� 濡쒖쭅��
                var cartQuickYn = $("#basketOption #quickYn").val();
                
                if(cartQuickYn != "Y"){
                    cartQuickYn = "N";
                }
                
                if( common.cart.cartSelValid(cartGoodsNo, cartItemNo, goodsSctCd) ){
                    var param = { 
                            goodsNo : cartGoodsNo,
                            itemNo : cartItemNo,
                            pkgGoodsNo : pkgGoodsNo,
                            ordQty : (optChgYn == "Y" && ordQty != undefined) ? ordQty : 1,
                            cartNo : common.cart.cartNo,
                            promKndCd : promKndCd,
                            buyCondStrtQtyAmt : buyCondStrtQtyAmt,
                            quickYn : cartQuickYn,
                            regCartRecoBellGoodsInCartYn : common.cart.regCartRecoBellGoodsInCartYn,
                      }
                    
                      resultData.push(param);
                    
                        // �꾨줈紐⑥뀡�� �숈씪(P201), A+B(P203) �닿퀬, FreeGift 媛� 1醫낅쪟�� 寃쎌슦 Get�곹뭹 異붽�
                        var promKndCd = $("#basketOption #promKndCd").val();
                        var promNo = $("#basketOption #promNo").val();
                        var buyCondStrtQtyAmt = parseInt( $("#basketOption #buyCnt").val() );
                        var getItemAutoAddYn = $("#basketOption #getItemAutoAddYn").val();
                        var getGoodsNo = (promKndCd == "P201") ? cartGoodsNo : $("#basketOption #getItemGoodsNo").val();
                        var getItemNo = (promKndCd == "P201") ? cartItemNo : $("#basketOption #getItemItemNo").val();
                    
                        if(promNo != undefined && promNo != '' && buyCondStrtQtyAmt == 1){
                            if(promKndCd == "P201" || 
                              (promKndCd == "P203" && getItemAutoAddYn == "Y" && 
                               getGoodsNo != undefined && getGoodsNo != '' && 
                               getItemNo != undefined && getItemNo != '')){
                                var getGoodsData = {
                                        goodsNo : getGoodsNo,
                                        itemNo : getItemNo,
                                        ordQty : (optChgYn == "Y" && ordQty != undefined) ? ( parseInt(ordQty / buyCondStrtQtyAmt) ) : 1,
                                        rsvGoodsYn : "N", // �덉빟�곹뭹�щ�
                                        dispCatNo : "",  // �꾩떆移댄뀒怨좊━ 踰덊샇
                                        drtPurYn : "N",            //諛붾줈援щℓ�щ�
                                        promKndCd : promKndCd,     //�꾨줈紐⑥뀡援щ텇
                                        crssPrstNo : promNo,        //�꾨줈紐⑥뀡踰덊샇
                                        prstGoodsNo : cartGoodsNo,  //��寃웑uy援곗쓽 �곹뭹踰덊샇
                                        prstItemNo : cartItemNo,    //��寃웑uy援곗쓽 �꾩씠�쒕쾲��
                                        buyCondStrtQtyAmt : buyCondStrtQtyAmt,
                                        samePrdSumOrdQty : 0,     //�곹뭹踰덊샇 �꾩씠�쒕쾲�멸� 媛숈��곹뭹�� �섎웾�� �⑺븳媛�
                                        getItemAutoAddYn : getItemAutoAddYn
                                };
                                                               
                                resultData.push(getGoodsData);
                            }
                        }
                        // �듭뀡�덈뒗 N+1 �숈씪�� 寃쎌슦 Get�곹뭹 異붽� (��)
          
                      common.cart.regCart(resultData, 'N', '', 'Y', optChgYn,'Y');
                }
            });
            
        },
        
        cartSelValid : function(goodsNo, itemNo, goodsSctCd){
            var msg = "�듭뀡�� �좏깮�댁＜�쒓린 諛붾엻�덈떎.";
            
            if( goodsSctCd == "20"){
                msg = "�곹뭹�� �좏깮�댁＜�쒓린 諛붾엻�덈떎.";
            }    
            
            if((goodsNo != undefined && goodsNo != "") || ( itemNo != undefined && itemNo != "" )){
                return true;
            }else{
                alert(msg);
                return false;
            }
        },
        
        // �ㅻ뒛�쒕┝ �듭뀡�곹뭹 媛쒗렪 (cartSelGetInfoList, directYn, saveTp, listYn, optChgYn, cartYn, mbrDlvpSeq) 媛� 異붽� jwikim
        regCart : function(cartSelGetInfoList, directYn, saveTp, listYn, optChgYn, cartYn, mbrDlvpSeq){
            
            if(cartYn == undefined){
                cartYn = "N";
            }
            
            var quickYn = "N";
            var url = _baseUrl + "cart/regCartJson.do";
            
            var callBackResult = "";
            
            var dlvpSeq = "";

            var callback = function(data) {

                var result = data.result;
                callBackResult = data;
                
                if ( result ){
                    //�λ컮援щ땲 �섎웾 �낅뜲�댄듃
                    $.ajax({
                        type: "POST",
                        url: _baseUrl + "common/getCartCntJson.do",
                        contentType: "application/json;charset=UTF-8",
                        dataType : 'json',
                        async: false,
                        cache: false,
                        success: function(data) {
                            if(data != 0){
                                $("#cartToCnt").text("(" + data + ")");
                            }
                        }
                    });
                    
                    //諛붾줈援щℓ�� �ъ슜�� return cartNo
                    if ( directYn == 'Y' ){
                        if( listYn == 'A' || listYn == 'S' )
                            return false;
                        
                        // �ㅻ뒛�쒕┝ 諛곗넚吏� �좏깮�� �좏깮�� 諛곗넚吏� seq jwkim
                        if(mbrDlvpSeq != "" && mbrDlvpSeq != undefined){
                            dlvpSeq = mbrDlvpSeq;
                        }
                        
                        // �λ컮援щ땲濡� �대룞
                        // jwkim �ㅻ뒛�쒕┝諛곗넚�먯꽌 �쇰컲�쇰줈 諛곗넚�섎뒗 濡쒖쭅�먯꽌 �ъ슜�섎뒗 mbrDlvpSeq(諛곗넚吏�seq) 媛믪텛媛�
                        location.href = _secureUrl + "cart/getCart.do?cartNo=" + data.rCartNo + "&quickYn=" + quickYn + "&mbrDlvpSeq=" + dlvpSeq;
                        // location.href = _secureUrl + "cart/getCart.do?cartNo=" + data.rCartNo + "&quickYn=" + quickYn; // as-is 濡쒖쭅
                    }else{
                        // GTM
                        var goodsInfoList = callBackResult.goodsInfoList;
                        
                        if(!!goodsInfoList && goodsInfoList.length > 0) {
                            var goodsNos = [];
                            var goodsNms = "";
                            var salePrc = 0;
                            for(var i = 0 ; i < goodsInfoList.length ; i++) {
                                if(i > 0) {
                                    goodsNms += "|";
                                }
                                goodsNos.push(goodsInfoList[i].goodsNo+goodsInfoList[i].itemNo);
                                goodsNms += goodsInfoList[i].goodsNm;
                                salePrc += (parseInt(goodsInfoList[i].salePrc) - parseInt(goodsInfoList[i].cpnRtAmtVal));
                            }
                            dataLayer.push({
                                'productId' : goodsNos,             //�곹뭹ID
                                'productName' : goodsNms,           //�곹뭹紐�
                                'productAmt' : salePrc.toString()   //�곹뭹媛�寃�
                            });
                        }
                        
                        //  硫붿씤 紐⑸줉�먯꽌 �λ컮援щ땲 �닿린 �덉쓣 ��
                        if ( listYn == 'Y' ){
                            //  湲곗〈 �붾㈃ �リ린
                            fnLayerSet('basketOption', 'close');
                            
                            if( optChgYn == 'Y' ){
                                    location.reload();
                            } else {
                                //  �λ컮援щ땲 �깅줉 �꾨즺 �붾㈃�쇰줈 �대룞
                                var url = _baseUrl + "common/getCartCompleteAjax.do";
                                common.Ajax.sendRequest("POST",url,data,common._callCartComplete);               
                            }
                        } else if( listYn == 'A' || listYn == 'S' ) {
                            common.cart.regCartCnt += 1;
                        } else {
                            common.cart.showBasket();    
                        }
                    }
                    
                }else{
                    if( listYn == 'A' )
                        return false;
                    
                    if(!!data.message && data.message.length < 100){
                        alert(data.message);
                    }else{
                        alert("�λ컮援щ땲 �깅줉�� �ㅽ뙣�섏��듬땲��.");  
                    }
//                    if (data.message == "-9990") {
//                        alert("�먮ℓ以묒��� �곹뭹�� �λ컮援щ땲�� �댁쓣 �� �놁뒿�덈떎.");
//                    } else if (data.message == "0") {
//                        alert("�ш퀬媛� 遺�議깊븯�� �곹뭹�� �λ컮援щ땲�� �댁쓣 �� �놁뒿�덈떎.");
//                    } else if (data.message == "99") {
//                        alert("�λ컮援щ땲�� 99媛쒓퉴吏�留� �댁쑝�� �� �덉뒿�덈떎");    
//                    } else {
//                        alert("�λ컮援щ땲 �깅줉�� �ㅽ뙣�섏��듬땲��.");
//                    }
                }
            };
            
            // �듬같�〓��� quickYn SET
            try{
                quickYn = cartSelGetInfoList[0].quickYn;
                if(quickYn != "Y" && quickYn != "N"){
                    quickYn = "N";
                }
            }catch(e){
                quickYn = "N";
            }
            
            // �ㅻ뒛�쒕┝ �꾨Ц愿��� �ㅻ뒛�쒕┝ �щ� 異붽�
            var isValid = this.validation(cartSelGetInfoList, directYn, saveTp, optChgYn, cartYn, quickYn);
            
            if (isValid) {
                $.ajax({
                    type: "POST",
                    url: url,
                    data: JSON.stringify(this.jsonParam),
                    contentType: "application/json;charset=UTF-8",
                    dataType : 'json',
                    async: false,
                    cache: false,
                    success: callback,
                    error : function(e) {
                        console.log(e);
                        alert("�λ컮援щ땲 �깅줉�� �ㅽ뙣�섏��듬땲��.");
                    }
                });
            }
            
            return callBackResult;
        },
        
        validation : function(cartSelGetInfoList, directYn, saveTp, optChgYn, cartYn, quickYn) {
            // �뚮씪硫뷀꽣�� validation 泥섎━
            var isValid = true;
            if(cartSelGetInfoList == null) {
                var msg = "二꾩넚�⑸땲��. 怨좉컼�쇳꽣�� 臾몄쓽�� 二쇱꽭��.";

                this.jsonParam = false;
                isValid = false;
            }
            
            //�됱궗�덈궡�덉씠�� �λ컮援щ땲踰꾪듉 吏꾩엯�쒖궗��
            if(location.href.indexOf("getCart.do?cartNo=") > 0){
                directYn = "Y";
            }
            
            if(isValid) {
                
                var qDeliveVal = "N";
                if(quickYn == "Y" && quickYn == "N"){
                    qDeliveVal = $(":input:radio[name=qDelive]:checked").val();
                    
                    if(qDeliveVal==undefined || qDeliveVal == null || qDeliveVal == ""){
                        qDeliveVal = "N";
                    }
                }
                
                // �ㅻ뒛�쒕┝ �꾨Ц愿� 由ъ뒪�몄뿉�� �λ컮援щ땲 �대┃�� quickYn媛믪씠 Y��
                // qDeliveVal 媛믪쓣 Y濡� �댁빞留� �ㅻ뒛�쒕┝ 愿��� 鍮꾩��덉뒪 濡쒖쭅�� ��湲� �뚮Ц�� Y濡쒗븿
                if(quickYn == "Y"){
                    qDeliveVal = "Y";
                }
                
                if(quickYn == "N"){
                    qDeliveVal = "N";
                }
                
                this.jsonParam =   {
                        drtPurYn : directYn
                        ,saveTp : saveTp
                        ,optChgYn : optChgYn
                        ,cartYn : cartYn
                        ,quickYn : qDeliveVal
                        ,regCartRecoBellGoodsInCartYn : common.cart.regCartRecoBellGoodsInCartYn
                        ,opCartBaseList : cartSelGetInfoList
                    };
            }
            
            return isValid;
        }, 
        
        showBasket : function(){
            alert("�λ컮援щ땲�� ���λ릺�덉뒿�덈떎.");
            
            common.cart.regCartCnt += 1;
        },
        
        updHeaderCartCnt : function(){
            if (common.isLogin()) {
                //�λ컮援щ땲 �섎웾 �낅뜲�댄듃
                $.ajax({
                    type: "POST",
                    url: _baseUrl + "common/getCartCntJson.do",
                    contentType: "application/json;charset=UTF-8",
                    dataType : 'json',
                    async: false,
                    cache: false,
                    success: function(data) {                        
                        if(typeof data != 'undefined' && data != null && data != 0){
                            $("#cartToCnt").text("("+data+")");
                        }
                    }
                });
            }
        },

        completeMsg : function(){
           var addMsg = "";
           
           if(common.cart.buyCnt == 1){     // �꾨줈紐⑥뀡 N+1 議곌굔 以� N�� 1�� 寃쎌슦
               if(common.cart.promKndCd == "P201"){
                   addMsg = "<br>" + common.cart.buyCnt + "+1�곹뭹�� �④퍡 異붽��섏뿀�듬땲��!";
               } if(common.cart.promKndCd == "P202"){
                       addMsg = "<br>" + common.cart.buyCnt + "+1�됱궗�곹뭹�대�濡�, �λ컮援щ땲�먯꽌<br>異붽��곹뭹�� �좏깮�댁＜�몄슂!";
               } if(common.cart.promKndCd == "P203"){
                   if(common.cart.getItemAutoAddYn == "Y")
                       addMsg = "<br>Gift�곹뭹�� �④퍡 異붽��섏뿀�듬땲��!";
                   else
                       addMsg = "<br>Gift�됱궗�곹뭹�대�濡�, �λ컮援щ땲�먯꽌<br>異붽��곹뭹�� �좏깮�댁＜�몄슂!";
               }
           }
           
           if(common.cart.promNo != undefined && common.cart.promNo != "")
               $("div.basket_add_txt").html($("div.basket_add_txt").text() + addMsg);
       }
};

/*--------------------------------------------------------------------------------*\
* 理쒓렐 蹂� �곹뭹 怨듯넻
\*--------------------------------------------------------------------------------*/
$.namespace("common.recentGoods");
common.recentGoods = {

        param : "",
        totCnt : 0,

        init : function(){
            common.recentGoods.getList();
        },

        bindEvent : function(){
            // �섏씠吏뺣쾭�� �대┃�대깽�� - �섏젙以�
            $('.recent_prd_box .pageing').find('a').bind('click', function(){
                var pageIdx = $(this).data('pageNo');

                if(typeof pageIdx == 'undefined' || pageIdx == '') return;
                common.recentGoods.getList(pageIdx);
            });
            
            //理쒓렐 蹂� �곹뭹 媛쒕퀎��젣 �대┃�대깽��
            $(".recent_prd_box .cate_prd_list li .btnDelete").bind('click', function(){
                common.recentGoods.delRecentGoods(this);
            });
            
            //理쒓렐 蹂� �곹뭹 �꾩껜��젣 �대┃�대깽��
            $(".recent_prd_box .mymenu_btn").bind('click', function(){
                common.recentGoods.delAllRecentGoods();
            });
        },

        getGoodsList : function(pageIdx){
            var goodsNo = "";

            cookie = new Cookie('local', 1, 'M');

            if ( cookie.get('productHistory') != undefined && cookie.get('productHistory') != "" ){

                var jsonStr = JSON.parse(cookie.get('productHistory'));
                var cnt = jsonStr.length;

                for(var i=0; i <jsonStr.length; i++){
                    if(i < cnt && jsonStr[i].goodsNo != null && jsonStr[i].goodsNo != ""){
                        if ( i == jsonStr.length-1 ){
                            goodsNo += jsonStr[i].goodsNo;
                        }else{
                            goodsNo += jsonStr[i].goodsNo + ",";
                        }
                    }
                }
            }
            return goodsNo;
        },
        
        getList : function(pageIdx){
            if(pageIdx == undefined){
                pageIdx = 1;
            }
            
            var goodsNo = common.recentGoods.getGoodsList(pageIdx);

            if(goodsNo != null && goodsNo != ""){
                $(".recent_prd_box").empty();

                param = {
                        goodsInfo : goodsNo ,
                        pageIdx : pageIdx,
                        pagingFlag : 'Y'
                };
                
                common.Ajax.sendRequest("get"
                        , _baseUrl + "mypage/getRecentListPagingAjax.do"
                        , param
                        , common.recentGoods.getRecentListAjaxCallback
                        , false
                );
            } else {
                $(".no_data").show();
                $(".recent_prd_box .recent_tit span").text(0);
                $(".recent_prd_box .recent_tit .mymenu_btn").hide();
                $(".recent_prd_box .pageing").hide();
                $(".recent_prd_box .cate_prd_list").remove();
            }
        },
        
        /**
         * 理쒓렐 蹂� �곹뭹 �뺣낫議고쉶
         */
        getRecentListAjaxCallback : function(res, type, callback){
            if (res.trim() == "") {
                $(".no_data").show();

            } else {
                $(".recent .recent_prd_box").append(res);

                common.recentGoods.bindEvent();

                //泥댄겕 泥섎━.
                common.wish.checkWishList();
                
                var jsonStr =  JSON.parse(cookie.get('productHistory'));
                
                // 荑좏궎 32媛� �섏뼱媛��� �곹뭹踰덊샇 ��젣泥섎━
                for( var j=0; j<jsonStr.length; j++){
                    if (j >= 32) {
                        delete jsonStr.splice(j, 1);
                    }
                }
                //荑좏궎�� 媛� �뗮똿
                cookie.set('productHistory', JSON.stringify(jsonStr));
                
                setTimeout(function() {
                    //留곹겕 泥섎━
                    common.bindGoodsListLink(".recent_prd_box .cate_prd_list li .prd_info");
                    
                    common.recentGoods.bindWeblog();
                }, 500);
            }

            if (callback != undefined) {
                callback();
            }
        },
        
        //理쒓렐蹂몄긽�� ��젣 �대┃ �대깽��
        delRecentGoods : function(obj) {
            //荑좏궎 �곗씠�� 吏��곌린
            var jsonStr =  JSON.parse(cookie.get('productHistory'));
            
            for( var j=0; j<jsonStr.length; j++){

                if ($(obj).parent().find("a").attr("data-ref-goodsNo") == jsonStr[j].goodsNo ){
                    delete jsonStr.splice(j, 1);

                    $(obj).closest("li").remove();
                    break;
                }
            }
            
            //荑좏궎�� 媛� �뗮똿
            cookie.set('productHistory', JSON.stringify(jsonStr));

            //Reload
            var pageIdx = 0;
            if($(".recent_prd_box .cate_prd_list li").size() == 0){
                pageIdx = $(".recent_prd_box .pageing strong").index();
            }else{
                pageIdx = $(".recent_prd_box .pageing strong").index() + 1;
            }

            common.recentGoods.getList(pageIdx);
        },
        
        //理쒓렐蹂몄긽�� ��젣 �대┃ �대깽��
        delAllRecentGoods : function() {
            if(confirm("�꾩껜 �곹뭹�� ��젣�섏떆寃좎뒿�덇퉴?")){
                today = new Date();
                today.setDate(today.getDate() - 1);
                cookie.set('productHistory', '');
                
                $(".recent_prd_box .recent_tit .mymenu_btn").hide();                
                $(".recent_prd_box .cate_prd_list").remove();
                $(".recent_prd_box .pageing").remove();
                $(".recent_tit span").text(0);
                $(".no_data").show();
            }
        },
        
        bindWeblog : function() {
            //理쒓렐蹂몄긽��
            $(".recent_prd_box .cate_prd_list li").each(function(idx) {
                var goodsIdx = $(this).attr("data-ref-recentGoodsIdx");
                $(this).find(".prd_info .goodsList").bind("click", function() {
                    common.wlog("home_header_recent_" + goodsIdx);
                });
            });
        },
};

/*--------------------------------------------------------------------------------*\
* 李� �대┃ 怨듯넻
\*--------------------------------------------------------------------------------*/
$.namespace("common.wish");
common.wish = {

        init : function(){
            //泥댄겕 泥섎━.
            common.wish.checkWishList();
        },

        bindEvent : function() {

            $('.btn_zzim').unbind("click");

            //李� �대┃ �대깽��
            $('.btn_zzim').bind('click', function(){
                //濡쒓렇�� 泥댄겕
//                if(common.loginChk()){
                    var param = {
                            goodsNo : $(this).attr("data-ref-goodsNo")
                    };

                    if($(this).hasClass("on")){
                        //off
                        common.wish.delWishLst(param, $(this));
                    }else{
                        //on
                        common.wish.regWishLst(param, $(this));
                    }
//                }
            });

        },

        loadData : function() {
            var cookie = new Cookie('local', 1, 'd');
            
            //濡쒓렇�� �щ��� �곕씪 李쒕ぉ濡� ����.
            if(common.isLogin()){
                var wishListJson = cookie.get("wishList");
                

                //�놁쑝硫� 議고쉶
                if (wishListJson == null || wishListJson.trim() == "") {

                    common.wish.isLoading = false;

                    //���λ맂 �붾㈃�� �놁쓣 寃쎌슦 html 議고쉶
                    $.ajax({
                        type: "POST",
                        url: _baseUrl + "mypage/getWishListJson.do",
                        data: null,
                        dataType : 'text',
                        async: false,
                        cache: false,
                        success: function(data) {

                            try {
                                var jsonObject = $.parseJSON(data);
                                cookie.set("wishList", data);

                            } catch (e) {}

                            common.wish.isLoading = true;
                        },
                        error: function() {
                            common.wish.isLoading = true;
                        }
                    });
                }

            } else {
                //�쒓굅
                cookie.remove("wishList");
            }
        },

        checkWishList : function() {

            common.wish.bindEvent();

            setTimeout(function() {
                //�뺣낫 議고쉶
                common.wish.loadData();
                var cookie = new Cookie('local', 1, 'd');
                var wishListJson = cookie.get("wishList");

                $('.btn_zzim').removeClass("on");
                if (wishListJson != null && wishListJson.trim() != "") {
                    try {
                        var jsonObject = $.parseJSON(wishListJson);

                        var goodsList = jsonObject.goodsList;

                        for (var i = 0; i < goodsList.length; i++) {
                            $(".btn_zzim[data-ref-goodsNo='" + goodsList[i] + "']").addClass("on");
                        }
                    } catch (e) {}
                }

            }, 100);
        },

        regWishLst : function(param, obj){
            if (param.goodsNo == undefined || param.goodsNo == "" ) {
                alert("�깅줉�� �ㅽ뙣�섏��듬땲��.\n�곹뭹�뺣낫媛� �놁뒿�덈떎.");
                return;
            }
            
            var callBackResult = "";

            common.Ajax.sendRequest(
                      "POST"
                    , _baseUrl + "mypage/regWishLstAjax.do"
                    , param
                    , function(res) {
                        callBackResult = res;
                        common.wish.regWishLstAjaxCallback(res, obj);
                    }
                    , false
            );
            
            return callBackResult;
        },

        regWishLstAjaxCallback : function(res, obj){

            var cookie = new Cookie('local', 1, 'd');
            
            setTimeout(function() {
                //紐⑸줉 媛깆떊�� �꾪빐 �쒓굅
                cookie.remove("wishList");
                common.wish.checkWishList();
            }, 100);

            var result = res.trim();
            if (result != '000') {
                if (result == '100') {
                    //濡쒓렇�� �ㅽ뙣
                    if (!common.loginChk()) {
                        return;
                    }
                } else if (result == '200') {
                    if(common.isLogin()){
                        //  �깆씤�곹뭹�몃뜲 濡쒓렇�몄� �섏뼱 �덉쑝�� �깆씤�몄쬆�� �덈릺�덉쓣 寃쎌슦
                        common.link.moveRegCertPage("Y",location.href);
                    }else{
                        //�깆씤�몄쬆�꾩슂
                        //濡쒓렇�� �깆씤泥댄겕
                        common.link.moveLoginPage("Y", location.href);
                    }
                    return;
                } else if (result == '500') {
                    //媛쒖닔 珥덇낵
                    alert("�쇳븨 李쒖� 99媛� 源뚯�留� �댁쑝�� �� �덉뒿�덈떎.");
                    return;
                } else if (result == '600') {
                    //�대� 李�
                    //alert("�대� 李쒗븳 �곹뭹�낅땲��.");
                    alert("�쇳븨李쒕━�ㅽ듃�� ���λ맂 �곹뭹�낅땲��."); 
                    return;
                }
            }

            if (obj != undefined) {
                obj.addClass("on");
            }

            //李� �뚮┝�덉씠�� On
            alert("李�! �섏뿀�듬땲��.");
        },

        delWishLst : function(param, obj){
            if (param.goodsNo == undefined || param.goodsNo == "" ) {
                alert("��젣媛� �ㅽ뙣�섏��듬땲��.\n�곹뭹�뺣낫媛� �놁뒿�덈떎.");
                return;
            }
            
            var callBackResult = "";

            common.Ajax.sendRequest(
                    "POST"
                  , _baseUrl + "mypage/delWishLstAjax.do"
                  , param
                  , function(res) {
                      callBackResult = res;
                      common.wish.delWishLstAjaxCallback(res, obj);
                  }
                  , false
            );
            
            return callBackResult;
            
        },

        delWishLstAjaxCallback : function(res, obj){
            //紐⑸줉 媛깆떊�� �꾪빐 �쒓굅
            var cookie = new Cookie('local', 1, 'd');
            cookie.remove("wishList");
            common.wish.checkWishList();

            var result = res.trim();
            if (result != '000') {
                if (result == '100') {
                    //濡쒓렇�� �ㅽ뙣
                    if (!common.loginChk()) {
                        return ;
                    }
                }
            }

            if (obj != undefined) {
                obj.removeClass("on");
            }

            //李� �뚮┝�덉씠�� Off
            alert("李쒖씠 痍⑥냼 �섏뿀�듬땲��.");
        },

        delAllWishLst : function(param){
            common.Ajax.sendRequest(
                    "POST"
                  , _baseUrl + "mypage/delWishLstAjax.do"
                  , param
                  , common.wish.delWishLstAjaxCallback
            );
        }
};

$.namespace("common.coupon");
common.coupon = {
        /**
         ***** 荑좏룿 �깅줉 �덉씠�� �앹뾽 *****
         *
         * �앹뾽 �몄텧 諛� 荑좏룿 �깅줉
         *
         * getRegCouponForm : arg = true �대㈃ �붾㈃ 媛깆떊
         *                    arg     �놁쑝硫� �붾㈃ 媛깆떊�섏� �딆쓬
         **/
        reload : false
        ,
        getRegCouponForm : function(reload){
            if(typeof reload != "undefined"){
                if(reload){
                    common.coupon.reload = true;
                }
            }else{
                common.coupon.reload = false;
            }
            common.Ajax.sendRequest("POST"
                , _baseUrl + "common/popup/getRegCouponFormPop.do"
                , null
                , function(res) {
                    $("#layer_pop_wrap").html(res);
                    fnLayerSet('layer_pop_wrap', 'open');
                    // 荑좏룿 �덈궡 �덉씠�� �앹뾽 close
                    $(".layer_close").on("click", function(e){
                        fnLayerSet('layer_pop_wrap', 'close');
                    });
                }
            );
        },
        regCouponAjax : function(){
            if(!common.isLogin() && confirm("濡쒓렇�� �� �좎껌�섏떎 �� �덉뒿�덈떎.\r\n濡쒓렇�� �섏씠吏�濡� �대룞�섏떆寃좎뒿�덇퉴?")){
                common.link.moveLoginPage(null, location.href);
            }else{
                var rndmVal = $("#rndmVal").val();
    
                if(rndmVal.length <= 0){
                    alert("荑좏룿踰덊샇瑜� �낅젰�댁＜�몄슂.");
                    return false;
                }
                common.Ajax.sendRequest("POST"
                    , _baseUrl + "common/regCouponJson.do"
                    , { rndmVal : rndmVal}
                    , common.coupon.regCouponAjaxCallback
                );
            }
        },
        regCouponAjaxCallback : function(res){
            if(typeof res != "undefined"){
                if(res == '000'){
                    if(common.coupon.reload){
                        alert("荑좏룿�� �깅줉�섏뿀�듬땲��. �깅줉�� 荑좏룿�� 'MY>荑좏룿'�먯꽌 �뺤씤 媛��ν빀�덈떎.");
                        document.location.reload();
                    }else{
                        alert("荑좏룿�� �깅줉�섏뿀�듬땲��. �깅줉�� 荑좏룿�� 'MY>荑좏룿'�먯꽌 �뺤씤 媛��ν빀�덈떎.");
                        //�앹뾽 �リ린
                        fnLayerSet('layer_pop_wrap', 'close');
                    }
                }else{
                    alert(res);
                }
            }
        }
};

/*--------------------------------------------------------------------------------*\
* Q&A �깅줉 �덉씠�� �앹뾽
\*--------------------------------------------------------------------------------*/
$.namespace("common.qna");
common.qna = {
        /**
         ***** QNA �깅줉 �덉씠�� �앹뾽 *****
         **/

        openQnaRegPop : function(goodsNo, gdasSeq, retUrl){

            var param = {
                    goodsNo : goodsNo,
                    gdasSeq : gdasSeq,
                    retUrl : retUrl
            }

            common.Ajax.sendRequest("POST"
                    , _baseUrl + "mypage/getGoodsQnaFormAjax.do"
                    , param
                    , common.qna._callBackRegQnaForm
            );

        },

        _callBackRegQnaForm : function(res){
            fnLayerSet('pop_cont', 'open');
            $("#pop_cont").css("top", common.getNowScroll().Y + 400);
            $("#pop_cont").html(res);
        }
}

/*--------------------------------------------------------------------------------*\
* �곹뭹�� �깅줉 �덉씠�� �앹뾽
\*--------------------------------------------------------------------------------*/
$.namespace("common.gdas");
common.gdas = {
        /**
         ***** �곹뭹�� �깅줉 �덉씠�� �앹뾽 *****
         **/
        refNm : "",

        openGdasRegPop : function(refNm, goodsNo, gdasSeq, ordNo, itemNo, itemNm, lgcGoodsNo, ordGoodsSeq, evtNo, gdasTpCd, gdasSctCd, thnlPathNm, writeYn, retUrl){
            common.gdas.refNm = refNm;
            
            var param ={
                    goodsNo : goodsNo,
                    gdasSeq : gdasSeq,
                    ordNo : ordNo,
                    itemNo : itemNo,
                    itemNm : itemNm,
                    lgcGoodsNo: lgcGoodsNo,
                    ordGoodsSeq: ordGoodsSeq,
                    evtNo : evtNo,
                    gdasTpCd : gdasTpCd,
                    gdasSctCd : gdasSctCd,
                    thnlPathNm : thnlPathNm,
                    writeYn : writeYn,
                    retUrl : retUrl
            }

            common.Ajax.sendRequest("POST"
                    , _baseUrl + "mypage/getGdasFormAjax.do"
                    , param
                    , common.gdas._callBackGdasRegForm
            );

        },
       /* openGdasRegPop : function(refNm, goodsNo, gdasSeq, ordNo, evtNo, gdasTpCd, gdasSctCd, writeYn, retUrl){
            common.gdas.refNm = refNm;

            var param ={
                    goodsNo : goodsNo,
                    gdasSeq : gdasSeq,
                    ordNo : ordNo,
                    evtNo : evtNo,
                    gdasTpCd : gdasTpCd,
                    gdasSctCd : gdasSctCd,
                    writeYn : writeYn,
                    retUrl : retUrl
            }

            common.Ajax.sendRequest("POST"
                    , _baseUrl + "mypage/getGdasFormAjax.do"
                    , param
                    , common.gdas._callBackGdasRegForm
            );

        },*/

        _callBackGdasRegForm : function(res){
            fnLayerSet('pop_cont', 'open');
            
            // Mantis 0001199: �꾨━誘몄뾼 �곹뭹�� �대�吏� �⑸웾 珥덇낵 �쇰읉 �レ� �� �대�吏� 李얠븘蹂닿린 踰꾪듉 �몄텧 �ㅻ쪟
            // IE�먯꽌 common.getNowScroll().Y瑜� undefined濡� �몄떇�섏뿬 �덉씠�� Top Margin 怨꾩궛 �ㅻ쪟 諛쒖깮�쇰줈 �명븯�� 遺꾧린
            if(common.getNowScroll().Y == undefined) {
                $("#pop_cont").css("top", 0 + 300);
            } else {
                $("#pop_cont").css("top", common.getNowScroll().Y + 300);
            }
            
            $("#pop_cont").html(res);
        },

        /** �곹뭹�� ��젣 �� 泥섎━ **/
        moveGoodsGdasDel : function(gdasSeq, goodsNo, pntPayYn, retUrl){

            var loginCheck = common.loginChk();
            
            var deleteMessage = '�묒꽦�섏떊 �곹뭹�됱쓣 ��젣�섏떆寃좎뒿�덇퉴?';

            if(!loginCheck) return;

            if(!confirm(deleteMessage)) return;

            common.gdas.delGdasProceess(gdasSeq, goodsNo, retUrl);
        },

        /** �곹뭹�� ��젣 泥섎━ **/
        delGdasProceess : function(gdasSeq, goodsNo, retUrl){

            var data = {gdasSeq : gdasSeq, goodsNo : goodsNo, retUrl: retUrl};
            
            //jsTemplet
            common.Ajax.sendJSONRequest("POST"
                , _baseUrl + "mypage/delGdasJson.do?gdasSeq="+gdasSeq
                , data
                , common.gdas.afterDelGoodsGdasSuccess
            );
        },

        /** �곹뭹�� ��젣 �� 泥섎━ **/
        afterDelGoodsGdasSuccess : function(data){

            if(data.resultCd == "000"){
                alert("�깃났�곸쑝濡� ��젣�섏��듬땲��.");

                if ( data.retUrl == ""){
                    location.href = _baseUrl + '/index.do';
                }else{
                    location.href = data.retUrl;
                }
            }else{
                alert("��젣媛� �ㅽ뙣�섏��듬땲��.");
            }
        }
}

$.namespace("common.zipcode.pop");
common.zipcode.pop = {
        fnCallback : '',

        defaultId : "search-zipcode-pop",
        
        init : function(popCallback, id){
            common.zipcode.pop.fnCallback = popCallback;

            if(arguments.length == 1 || !id){
                id = common.zipcode.pop.defaultId;
            }
            
            $('#'+id).click(function(){
                
                $('#layer_pop_wrap').html('');
                
                $('#layer_pop_wrap').load(_baseUrl + 'common/popup/searchZipcodePop.do', function(){
                    
                    fnLayerSet('layer_pop_wrap','open');
                    
                    common.popup.zipcode.init(common.zipcode.pop.fnCallback);
                });
            });
        }
};

/*--------------------------------------------------------------------------------*\
* �뱀씪諛곗넚�� �고렪踰덊샇 議고쉶
\*--------------------------------------------------------------------------------*/
$.namespace("common.zipcodequick.pop");
common.zipcodequick.pop = {
        fnCallback : '',

        excute : false,
        
        defaultId : "search-zipcode-pop",
        
        init : function(popCallback, id){
            common.zipcodequick.pop.fnCallback = popCallback;
            common.zipcodequick.pop.quickYn = 'Y'; //�뱀씤諛곗넚�먯꽌 �몄텧�섎뒗 寃쎌슦 異붽�

            if(arguments.length == 1 || !id){
                id = common.zipcodequick.pop.defaultId;
            }
            
            $('#'+id).click(function(){
                
                $('#layer_pop_wrap').html('');
                
                $('#layer_pop_wrap').load(_baseUrl + 'common/popup/searchZipcodePop.do', function(){
                    
                    $('.dimm').css({"zIndex":992});
                    fnLayerSet('layer_pop_wrap','open');
                    
                    common.popup.zipcode.init(common.zipcodequick.pop.fnCallback);
                });
            });
            
            
        },
        
        /** 諛곗넚吏� �깅줉 �� **/
        deliveryRegistForm : function(){
            var url = _baseUrl + "goods/getDeliveryRegistFormAjax.do";
            var data ={};
            common.Ajax.sendRequest("POST",url,data,common.zipcodequick.pop._callBackDeliveryRegistForm);
        },
        
        /** 諛곗넚吏� �깅줉 �� **/
        deliveryRegistCartForm : function(){
            var url = _baseUrl + "cart/getDeliveryRegistFormCartAjax.do";
            var data ={};
            common.Ajax.sendRequest("POST",url,data,common.zipcodequick.pop._callBackDeliveryRegistForm);
        },        
        
        /** 諛곗넚吏� �깅줉  **/
        deliveryRegistCart : function(){
            if(!common.loginChk()) return;
            
            if(common.zipcodequick.pop.excute){
                alert('泥섎━以묒엯�덈떎. �좎떆留� 湲곕떎�ㅼ＜�몄슂.');
                return;
            }
            common.zipcodequick.pop.excute = true;
            
            if(!mypage.deliveryForm.validator()){
                common.zipcodequick.pop.excute = false;
                return;
            } 
            common.zipcodequick.pop.checkDlvpTotalCount();
            
        },
        
        doRegistDelivery : function(){
            common.zipcodequick.pop.setBaseDlvpYn();
            
            var values = $('#delivery-form').serializeObject();
            
            _ajax.sendJSONRequest('POST'
                    , _baseUrl + 'mypage/registDelivery.do'
                    , values
                    , common.zipcodequick.pop.registDeliveryCartJSONCallback
                    , false
            );
        },
        
        checkDlvpTotalCount : function(){
            _ajax.sendJSONRequest('GET'
                    ,_baseUrl + 'mypage/getDlvpTotalCountJSON.do'
                    ,{}
                    ,common.zipcodequick.pop.checkDlvpTotalCountCallBack
                    ,false
            );  
        },
        
        checkDlvpTotalCountCallBack : function(res){
            var data = (typeof res !== 'object') ? $.parseJSON(res) : res;
            
            if(Number(data) >= 20){
                alert(MESSAGE.DLVP_COUNT_MAX);
                mypage.deliveryForm.excute = false;
                return;
            }
            
            common.zipcodequick.pop.doRegistDelivery();
        },
        
        setBaseDlvpYn : function(){
            var baseDlvpYn = $('#base-dlvp-yn-check').is(':checked') ? 'Y' : 'N';
            
            $('#base-dlvp-yn').val(baseDlvpYn);
        },
        
        /** 諛곗넚吏� �깅줉  �リ린 **/
        deliveryRegistFormClose : function(){
            fnLayerSet("todayRegDelivery", "close");
            $('.dimm').remove();
            common.zipcodequick.pop.quickYn = ''; 
            
            goods.detail.todayDelivery.todayDeliveryList();
        },
        
        /** 諛곗넚吏� �깅줉  �� �リ린 **/
        deliveryRegistFormAfterClose : function(){
            fnLayerSet("todayRegDelivery", "close");
            $('.dimm').remove();
            common.zipcodequick.pop.quickYn = ''; 
            
            goods.detail.todayDelivery.registTodayDeliverySelect();
        },
        
        /** 諛곗넚吏� �깅줉  �リ린 **/
        deliveryRegistFormCartSaveClose : function(){
            fnLayerSet("todayRegDelivery", "close");
            $('.dimm').remove();
            common.zipcodequick.pop.quickYn = ''; 
            
            window.location.reload();
        },
        
        /** 諛곗넚吏� �깅줉  �リ린 **/
        deliveryRegistFormCartClose : function(){
            fnLayerSet("todayRegDelivery", "close");
            $('.dimm').remove();
            common.zipcodequick.pop.quickYn = ''; 
        },
        
        registDeliveryJSONCallback : function(res){
            var data = (typeof res !== 'object') ? $.parseJSON(res) : res;
            
            data.succeeded && alert(data.message);
            
            common.zipcodequick.pop.deliveryRegistFormClose();
            
        },
        
        registDeliveryCartJSONCallback : function(res){
            var data = (typeof res !== 'object') ? $.parseJSON(res) : res;
            data.succeeded && alert(data.message);
            
            common.zipcodequick.pop.deliveryRegistFormCartSaveClose();
            
        },
        
        /** 諛곗넚吏� �깅줉 �� 肄쒕갚 **/
        _callBackDeliveryRegistForm : function(res){
            var cDiv = $(res.trim());
            $("#todayRegDelivery").html(cDiv);
            $('#rmitCellSctNo').css({'width':'90px'});
            $('#rmitTelRgnNo').css({'width':'90px'});
            fnLayerSet("todayRegDelivery", "open");
            common.zipcodequick.pop.init(mypage.deliveryForm.selectedZipcodeCallback);
        }
};

$.namespace("common.bann");
common.bann = {
        
        init : function(){
            
            if (common.bann.isOpenCommFloatBann()) {
                $(".main_moving_banner").show();
                $('.main_moving_banner').css("z-index", "99");
            }
            
            banner_pos = parseInt($('.main_moving_banner').css('top'), 10);
            cur_pos = banner_pos;
            
            this.addEvent();
        },
        
        addEvent : function(){
            setInterval(function(){
                if(cur_pos >= banner_pos) cur_pos = banner_pos - 5;
                else cur_pos = banner_pos + 5;
        
                $('.main_moving_banner').animate({'top': cur_pos +'px'}, 500);
            }, 500);
            
            $('.moving_banner_close').click(function(e){
                common.bann.setPopInfo("commonFloatBann", $(".main_moving_banner a img").attr("data-ref-compareKey"));
                $('.main_moving_banner').remove();
                
            });
        },
        
        isOpenCommFloatBann : function() {
            var bannInfo = common.bann.getPopInfo("commonFloatBann");
            if (bannInfo == null) {
                return true;
            }
            //�대�吏� �뺣낫媛� �ㅻ� 寃쎌슦
            if (bannInfo.compareKey != $(".main_moving_banner a img").attr("data-ref-compareKey")) {
                return true;
            }
            //1�� 寃쎄낵 ��
            if (new Date() - bannInfo.regDtime >= (1000 * 60 * 60 * 24)) {
                return true;
            }
            
            return false;
        },
        
        getPopInfo : function(popType) {
            var cookie = new Cookie('local', 1, 'D');

            if ( cookie.get('popBannHistory') != undefined && cookie.get('popBannHistory') != "" ) {
                var popBannHistoryStr = cookie.get('popBannHistory');
                var jsonStr =  JSON.parse(popBannHistoryStr);
                
                for(var i=0; i <jsonStr.length; i++) {
                    if (jsonStr[i].popType == popType) {
                        return jsonStr[i];
                    }
                }
            }
            return null;
        },
        
        setPopInfo : function(popType, compareKey) {
            var cookie = new Cookie('local', 1, 'D');

            var bannArr = new Array();

            if ( cookie.get('popBannHistory') != undefined && cookie.get('popBannHistory') != "" ) {
                var popBannHistoryStr = cookie.get('popBannHistory');
                
                //�좉퇋
                if (popBannHistoryStr == "") {
                    var bannInfo = new Object();
                    
                    bannInfo.popType = popType;
                    bannInfo.compareKey = compareKey;
                    bannInfo.regDtime = new Date();
                       
                    bannArr.push(bannInfo);
                    
                } else {
                    var jsonStr =  JSON.parse(popBannHistoryStr);
                    
                    var hasInfo = false;
                    
                    for(var i=0; i <jsonStr.length; i++) {
                        if (jsonStr[i].popType == popType) {
                            jsonStr[i].compareKey = compareKey;
                            jsonStr[i].regDtime = new Date();
                            hasInfo = true;
                        }
                        
                        bannArr.push(jsonStr[i]);
                    }
                    
                    if (!hasInfo) {
                        var bannInfo = new Object();
                        
                        bannInfo.popType = popType;
                        bannInfo.compareKey = compareKey;
                        bannInfo.regDtime = new Date();
                           
                        bannArr.push(bannInfo);
                        
                    }
                }

            } else {
                var bannInfo = new Object();
                
                bannInfo.popType = popType;
                bannInfo.compareKey = compareKey;
                bannInfo.regDtime = new Date();
                   
                bannArr.push(bannInfo);
            }
            cookie.set('popBannHistory', JSON.stringify(bannArr)); 
        }      
};


$.namespace("common.header");
common.header = {
        
    init : function(){
      //�λ컮援щ땲 媛�닔 媛깆떊
        common.cart.updHeaderCartCnt();
        
        //SCP
        //�쒕뜡 �レ옄 媛��몄삤�� �⑥닔
        var fnRandomNum = function(max){            //�쒕뜡 �レ옄 媛��몄삤�� �⑥닔(0~max�ъ씠�� 媛�)
            return Math.floor(Math.random() * max);
        }
        
        //�대깽�� �섏씠�쒗슚怨� True & �먮룞�뚮젅�� False & �쒕뜡 False & �꾪듃 True
        var eventSlider_len = $('.FadeDot').children('div').length;      //諛곕꼫 slide 媛�닔
        $('.FadeDot').on('init', function(){
            if(eventSlider_len == 1){
                //$(this).append('<button class="slick-arrow slick-prev">�댁쟾諛곕꼫</button><button class="slick-arrow slick-next">�ㅼ쓬諛곕꼫</button>');
                $(this).append('<ul class="slick-dots"><li class="slick-active"></li></ul>');
            }
        }).slick({
            dots: true,
            arrows: true,
            infinite: false,
            fade: true,
            autoplay: false,
            autoplaySpeed: 4000
        }).on('beforeChange', function(event, slick, currentSlide, nextSlide){
            //$(this).find('.slick-paging > .cur_no').text(nextSlide + 1);
        });
        
        $("#query").bind("keyup", function(){
            if($("#query").val().length>0){
               $(".scp_cont").css("display", 'none');
            }else{
               $(".scp_cont").css("display", 'block');
            }
        });
 
    },
    moveGoodsdetail: function(goodsNo, idxNo){
        //var goodsNo = $(this).find("input[name*='goodsNo']").val();
        //var idxNo = $(this).find("input[name*='idxNo']").val();
        common.wlog("search_scp_idx_"+idxNo);
        common.link.moveGoodsDetail(goodsNo);
    }
        
};


/*
 * �됱궗�ъ��덉꽑�앺뙘�낅쓣�곌린
 */
$.namespace('common.popLayer.promGift');
common.popLayer.promGift = {
        jsonParam : false,
        
        openPromGiftPop : function(vGoodsNo,vItemNo,vPromNo) {
            var url = _baseUrl + "cart/promGiftPopAjax.do";
            
            var callback = function(res) {
                fnLayerSet('cart_layer_pop_wrap','open');
                $("#cart_layer_pop_wrap").html(res);
                common.setLazyLoad('seq');
                $('#cart_layer_pop_wrap').css('top','15%');
                $('#cart_layer_pop_wrap').css('margin-left','-275px');
                $('#cart_layer_pop_wrap').css('margin-top',$(document).scrollTop());
                
                //GET�덉씠�댁쓽 �곹뭹 �섍�  1�멸꼍�� �먮룞�ㅽ뻾
                if($('li[name=selPopInfo]').length == 1){
                    var stockQty = parseInt( $('li[name=selPopInfo]').eq(0).attr('stockQty') );
                    
                    if(stockQty > 0){
                        var setItemCnt = 0;
                        if(stockQty > getItemCnt) 
                            setItemCnt = getItemCnt;
                        else
                            setItemCnt = stockQty;
                        
                        $('li[name=selPopInfo]').eq(0).find('input[name=promGiftAmount]').val(setItemCnt);
                        $('li[name=selPopInfo]').eq(0).attr("class","on");
                        
                        // 湲� �좏깮�� 異붽��곹뭹 �섎웾
                        $("p.layer_desc2 span.tx:eq(1) i").text(setItemCnt);
                    }
                } else {
                    //buy�곹뭹援곗쓽 �섎웾�뺣낫瑜� 媛��몄� �덉젅泥댄겕異붽�
                    //�덉씠�댁갹�� �곹뭹援�
                    var totalCnt = 0;
                    $('li[name=selPopInfo]').each(function(){
                        var layerPopObj = $(this);
                        
                        $("div.prd_cnt_box").each(function(){
                            var buyObj = $(this);
                            var buyGoodsNo = buyObj.find("input[name=sGoodsNo]").val();
                            var buyItemNo = buyObj.find("input[name=itemNo]").val();
                            
                            buyGoodsNo = (buyGoodsNo == undefined) ? $("#goodsNo").val() : buyGoodsNo;
                            buyItemNo = (buyItemNo == undefined) ? $("#itemNo").val() : buyItemNo;
                            
                            //buy�곹뭹援곗쓽 �곹뭹�뺣낫�� �덉씠�댁갹�� �곹뭹�뺣낫媛� 媛숈쑝硫�
                            if(layerPopObj.attr('goodsNo') == buyGoodsNo && layerPopObj.attr('itemNo') == buyItemNo){
                                var buyGoodsCnt = parseInt(buyObj.find('input[type=text].tx_num').val());
                                var getGoodsCnt = parseInt(layerPopObj.attr('stockQty'));
                                
                                // �곹뭹�곸꽭�먯꽌 �ㅻ뒛�쒕┝ �щ�媛� �좏깮�� 寃쎌슦 �ㅻ뒛�쒕┝ �ш퀬瑜� 蹂닿퀬 �먮떒�댁빞�� jwkim
                                if($("#deliveDay").prop("checked")==true){
                                    getGoodsCnt = $("#quickItemInv_"+(buyGoodsNo+buyItemNo)).val();
                                }
                                
                                //buy�곹뭹援곗쓽 �섎웾�� �ㅼ옱怨� �섎웾蹂대떎 �ш굅�� 媛숈쑝硫�
                                if(buyGoodsCnt >= getGoodsCnt){
                                    //議곌굔留뚯”�� �섎웾0�쇰줈 �뗮똿�섍퀬 �덉젅泥섎━
                                    layerPopObj.find('input[name=promGiftAmount]').val(0);
                                    layerPopObj.find('p.img').append("<span class='soldout'>�쇱떆�덉젅</span>");
                                    layerPopObj.find('input[name=promGiftAmount]').attr('disabled','disabled');
                                    layerPopObj.find('input[name=promGiftAmount]').siblings().attr('disabled','disabled');
                                    layerPopObj.removeClass("on");
                                } else {
                                    layerPopObj.attr('stockQty', getGoodsCnt - buyGoodsCnt);
                                }
                            }
                        });
                        
                        totalCnt += parseInt( layerPopObj.find("input[name=promGiftAmount]").val() );
                    });
                    
                    // �꾩옱 �좏깮�� �섎웾 媛깆떊
                    $("p.layer_desc2 span.tx:eq(1) i").text(totalCnt);      // 湲� �좏깮�� 異붽��곹뭹 �섎웾
                    
                    // �쇱떆�덉젅 �곹뭹 �섎떒 �뺣젹 �쒖옉
                    var getItemList = [];
                    var getItemSoldOutList = [];

                    $("ul.evt_prd_list li[name=selPopInfo]").each(function(){
                        if($(this).find("p.img span").hasClass("soldout")){
                            getItemSoldOutList.push($(this));
                        } else {
                            getItemList.push($(this));
                        }
                    });

                    $("ul.evt_prd_list").html();

                    $(getItemList).each(function(){
                        $("ul.evt_prd_list").append($(this));
                    });

                    $(getItemSoldOutList).each(function(){
                        $("ul.evt_prd_list").append($(this));
                    });
                    // �쇱떆�덉젅 �곹뭹 �섎떒 �뺣젹 ��
                }
            };
            
            var isValid = this.validation(vGoodsNo,vItemNo,vPromNo);
            
            if (isValid) {
                _ajax.sendRequest("GET", url, this.jsonParam, callback);
            }
        },
        /**
         *   �뚮씪硫뷀꽣�� validation 泥섎━
         */
        validation : function(vGoodsNo,vItemNo,vPromNo) {
            var isValid = true;
            if(vGoodsNo == null || vGoodsNo == '' || vItemNo == null || vItemNo == '' || vPromNo == null || vPromNo == '') {
                var msg = "二꾩넚�⑸땲��. 怨좉컼�쇳꽣(1522-0882)濡� 臾몄쓽�� 二쇱꽭��.";

                this.jsonParam = false;
                isValid = false;
                return isValid;
            }
            
            var buyItemCnt = 0;
            $("div.prd_cnt_box[promNo=" + vPromNo + "]").each(function(){
                buyItemCnt += parseInt( $(this).find("input.tx_num").val() );
            });
            
            var buyCondStrtQtyAmt = parseInt( $("div.prd_gift_box.item_" + vGoodsNo + vItemNo).attr("buyCondStrtQtyAmt") );
            var getItemCnt = parseInt( buyItemCnt / buyCondStrtQtyAmt );
            
            var quickYn = $(":input:radio[name=qDelive]:checked").val();
            if(typeof(quickYn) == "undefined"){
                quickYn = $("#quickYn").val();
            }
            
            if(isValid) {
                this.jsonParam =   {
                        "goodsNo" : vGoodsNo,
                        "itemNo" : vItemNo,
                        "promNo" : vPromNo,
                        "buyItemCnt" : buyItemCnt,
                        "getItemCnt" : getItemCnt,
                        "quickYn" : quickYn
                    };
            }
            return isValid;
        },
        /**
         * 異붽��곹뭹�� �섎웾 議곗젅
         */
        calcQty : function(optionKey, operator) {
            var oldVal = parseInt( $("input[name=promGiftAmount]#cartCnt_" + optionKey).val() );
            $("input[name=promGiftAmount]#cartCnt_" + optionKey).data('old', oldVal);
            
            if(operator == "plus"){
                if(oldVal >= getItemCnt){
                    alert('�좏깮�섏떎 �� �덈뒗 異붽� �곹뭹�� 理쒕� '+getItemCnt+'媛� �낅땲��.');
                    return false;
                }
                
                $("input[name=promGiftAmount]#cartCnt_" + optionKey).val(++oldVal).trigger("focusout");
            } else if(operator == "minus"){
                if(oldVal <= 0)
                    return false;
                
                $("input[name=promGiftAmount]#cartCnt_" + optionKey).val(--oldVal).trigger("focusout");
            } else {
                return false;
            }
        }
};

/*--------------------------------------------------------------------------------*\
* String Object Prototype
\*--------------------------------------------------------------------------------*/
String.prototype.isEmpty = function() {
    return (this == null || this == '' || this == 'undefined' || this == 'null');
};
// alert("isEmpty="+"".isEmpty());


/**
 *
 * �レ옄�щ� 泥댄겕 ��.
 * �ъ슜 ��)
 *
 * "100".isNumber()
 * "-100,000".isNumber(1)
 *
 * @param opt
 *            1 : (Default)紐⑤뱺 10吏꾩닔
 *            2 : 遺��� �놁쓬
 *            3 : 遺���/�먮┸�섍뎄遺�(",") �놁쓬
 *            4 : 遺���/�먮┸�섍뎄遺�(",")/�뚯닽��
 *
 * @return true(�뺤긽) or false(�ㅻ쪟-�レ옄�꾨떂)
 *
 */
String.prototype.isNumber = function(opt) {
    // 醫뚯슦 trim(怨듬갚�쒓굅)�� �댁���.
    value = String(this).replace(/^\s+|\s+$/g, "");

    if (typeof opt == "undefined" || opt == "1") {
        // 紐⑤뱺 10吏꾩닔 (遺��� �좏깮, �먮┸�섍뎄遺꾧린�� �좏깮, �뚯닔�� �좏깮)
        var regex = /^[+\-]?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
    } else if (opt == "2") {
        // 遺��� 誘몄궗��, �먮┸�섍뎄遺꾧린�� �좏깮, �뚯닔�� �좏깮
        var regex = /^(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
    } else if (opt == "3") {
        // 遺��� 誘몄궗��, �먮┸�섍뎄遺꾧린�� 誘몄궗��, �뚯닔�� �좏깮
        var regex = /^[0-9]+(\.[0-9]+)?$/g;
    } else {
        // only �レ옄留�(遺��� 誘몄궗��, �먮┸�섍뎄遺꾧린�� 誘몄궗��, �뚯닔�� 誘몄궗��)
        var regex = /^[0-9]$/g;
    }

    if (regex.test(value)) {
        value = value.replace(/,/g, "");
        return isNaN(value) ? false : true;
    } else {
        return false;
    }
};
//alert("isNumber="+("1-00".isNumber()));


String.prototype.nvl = function(s) {
    return this.isEmpty() ? (s ? s : '') : this+'';
};
String.prototype.startWith = function(str) {
    if (this === str)    return true;

    if (str.length > 0)
        return str === this.substr(0, str.length);
    else
        return false;
};
String.prototype.endWith = function(str) {
    if (this == str)    return true;

    if (String(str).length > 0)
        return str === this.substr(this.length - str.length, str.length);
    else
        return false;
};
String.prototype.bytes = function()
{    // 諛붿씠�� 怨꾩궛.
    var b = 0;
    for (var i=0; i<this.length; i++) b += (this.charCodeAt(i) > 128) ? 2 : 1;
    return b;
};
String.prototype.nl2br = function() {
    return this.replace(/\n/g, "<br />");
};
String.prototype.toMoney = function() {
    var s = (this.nvl('0')).trim();
    if (isFinite(s)) {
        while((/(-?[0-9]+)([0-9]{3})/).test(s)) {
            s = s.replace((/(-?[0-9]+)([0-9]{3})/), "$1,$2");
        }
        return s;
    }
    else {
        return this;
    }
};
String.prototype.toNegative = function() {
    return this == '0' ? this : "- " + this;
};


/**
 * val 臾몄옄�댁쓣 len 湲몄씠留뚰겮 �쇱そ�� char 臾몄옄瑜� 遺숈뿬�� 諛섑솚 �쒕떎.
 *
 * �ъ슜 ��) "A".lpad(5, "0") => "0000A"
 *
 * @param val
 *            臾몄옄��
 * @param len
 *            �앹꽦�� 臾몄옄�� 湲몄씠
 * @param char
 *            �대떦 湲몄씠留뚰겮 �쇱そ�� 異붽��� 臾몄옄
 */
String.prototype.lpad = function(len, char) {
    var val = String(this);
    if (typeof(char)!="string" && typeof(len)!="number") {
        return val;
    }
    char = String(char);
    while(val.length + char.length<=len) {
        val = char + val;
    }

    return val;
};
// alert("A".lpad(5, "0"));

/**
 * val 臾몄옄�댁쓣 len 湲몄씠留뚰겮 �ㅻⅨ履쎌뿉 char 臾몄옄瑜� 遺숈뿬�� 諛섑솚 �쒕떎.
 *
 * �ъ슜 ��) "A".rpad(5, "0") => "A0000"
 *
 * @param val
 *            臾몄옄��
 * @param len
 *            �앹꽦�� 臾몄옄�� 湲몄씠
 * @param char
 *            �대떦 湲몄씠留뚰겮 �ㅻⅨ履쎌뿉 異붽��� 臾몄옄
 */
String.prototype.rpad = function(len, char) {
    var val = String(this);
    if (typeof(char)!="string" && typeof(len)!="number") {
        return val;
    }
    char = String(char);
    while(val.length + char.length<=len) {
        val = val + char;
    }

    return val;
};
//alert("A".rpad(5, "0"))

String.prototype.numberFormat = function() {
// return this;
// return $.number(this);
    return this.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};


String.prototype.getBytesLength = function() {
    var s = this;
    for(b = i = 0;c = s.charCodeAt(i++);b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
    return b;
};

String.prototype.getTransSpace = function() {
    return this.split(" ").join("&nbsp;");
};


/*--------------------------------------------------------------------------------*\
* Number Object Prototype
\*--------------------------------------------------------------------------------*/
Number.prototype.toMoney = function() {
    return String(this).toMoney();
};


Number.prototype.numberFormat = function() {
// return this
// return $.number(this);
    return this.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};


/**
 * val 臾몄옄�댁쓣 len 湲몄씠留뚰겮 �쇱そ�� char 臾몄옄瑜� 遺숈뿬�� 諛섑솚 �쒕떎.
 *
 * �ъ슜 ��) (123).lpad(5,"0") => "00123"
 *
 * @param val
 *            臾몄옄��
 * @param len
 *            �앹꽦�� 臾몄옄�� 湲몄씠
 * @param char
 *            �대떦 湲몄씠留뚰겮 �쇱そ�� 異붽��� 臾몄옄
 */
Number.prototype.lpad = function(len, char) {
    return String(this).lpad(len,char);
};
//alert((123).lpad(5,"0"));

/**
 * val 臾몄옄�댁쓣 len 湲몄씠留뚰겮 �ㅻⅨ履쎌뿉 char 臾몄옄瑜� 遺숈뿬�� 諛섑솚 �쒕떎.
 *
 * �ъ슜 ��) (123).rpad(5,"0") => "12300"
 *
 * @param val
 *            臾몄옄��
 * @param len
 *            �앹꽦�� 臾몄옄�� 湲몄씠
 * @param char
 *            �대떦 湲몄씠留뚰겮 �ㅻⅨ履쎌뿉 異붽��� 臾몄옄
 */
Number.prototype.rpad = function(len, char) {
    return String(this).rpad(len,char);
}
//alert((123).rpad(5,"0"));

/*--------------------------------------------------------------------------------*\
* Date Object Prototype
\*--------------------------------------------------------------------------------*/
/**
 *
 * �щĸ�� 留욌뒗 �좎쭨 臾몄옄�댁쓣 爰쇰궦��.
 *
 * �ъ슜 ��)
 * > new Date().format("yyyy-MM-dd hh:mm:ss E a/p")
 * > => 2016-11-24 11:00:31 紐⑹슂�� �ㅼ쟾
 *
 *
 *
 */
Date.prototype.format = function(format) {
    var weekName = ["�쇱슂��", "�붿슂��", "�붿슂��", "�섏슂��", "紐⑹슂��", "湲덉슂��", "�좎슂��"];
    var d = this;

    if (!d.valueOf()) return " ";
    if(format == undefined) return " ";
    format = String(format);

    return format.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy":   return (d.getFullYear() % 1000).lpad(2, "0");
            case "MM":   return (d.getMonth() + 1).lpad(2, "0");
            case "dd":   return d.getDate().lpad(2, "0");
            case "E":    return weekName[d.getDay()];
            case "HH":   return d.getHours().lpad(2, "0");
            case "hh":   return ((h = d.getHours() % 12) ? h : 12).lpad(2, "0");
            case "mm":   return d.getMinutes().lpad(2, "0");
            case "ss":   return d.getSeconds().lpad(2, "0");
            case "a/p":  return d.getHours() < 12 ? "�ㅼ쟾" : "�ㅽ썑";
            default:     return $1;
        }
    });
};
//alert(new Date().format("yyyy-MM-dd hh:mm:ss E a/p"));


/**
 * �쇱닔瑜� 怨꾩궛�� �좎쭨瑜� 諛섑솚 �쒕떎.
 *
 * �ъ슜 ��)
 * new Date().addDate(1);  : �댁씪�좎쭨 諛섑솚
 * new Date().addDate(0);  : �ㅻ뒛�좎쭨 諛섑솚
 * new Date().addDate(-1); : �댁젣�좎쭨 諛섑솚
 *
 * @param dateCount
 *            �뷀븷 �쇱닔
 *
 * @return 怨꾩궛�섏뼱 �앹꽦�� Date Object
 *
 */
Date.prototype.addDate = function(dateCount) {
    return new Date(this.valueOf() + (dateCount * (24*60*60*1000)) );
};
//alert(new Date().addDate(1).addDate(1));




/*--------------------------------------------------------------------------------*\
* Cookie object
\*--------------------------------------------------------------------------------*/
var Cookie = function(expiresDay) {
    var expdate = (typeof expiresDay == 'number') ? expiresDay : 1;
    return {
        get : function(cName) {
            cName = cName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cName);
            var cValue = '';
            if(start != -1){
                 start += cName.length;
                 var end = cookieData.indexOf(';', start);
                 if(end == -1)end = cookieData.length;
                 cValue = cookieData.substring(start, end);
            }
            return unescape(cValue);
        },
        set : function(cName, cValue, expireDays) {
            this.setOwner(cName, cValue, ((typeof expireDays == 'number' ? expireDays : expdate) * 24 * 60 * 60 * 1000))
            return this;
        },
        setOwner : function(cName, cValue, expire) {
            var expdate = new Date();
            expdate.setTime(expdate.getTime() + (typeof expire == 'number' ? expire : (expdate * 24 * 60 * 60 * 1000)));
            document.cookie = cName+"=" + cValue + "; path=/; domain="+document.domain+"; expires=" + expdate.toGMTString();
        },
        remove : function(name) {
            return this.set(name, '', -1);
        },
        getItem : function(name) {
            return this.get(name);
        },
        setItem : function(name, value) {
            this.set(name, value);
        },
        removeItem : function(name) {
            this.remove(name);
        },
        clear : function() {
            return;
        }
    };
};





/*--------------------------------------------------------------------------------*\
* Cache object
\*--------------------------------------------------------------------------------*/
var Cache = function(type, span/* integer */, format/* s, m, h, d, M, y, w */) {
    var _cacheType  = (typeof type != 'string' || type == '') ? 'cache' : type; // cache
                                                                                // ||
                                                                                // local
                                                                                // ||
                                                                                // session
    var _span       = (typeof span == 'number') ? span : 0;
    var _format     = (typeof format == 'string') ? format : '';
    var _storage    = null;
    var _expires    = getCacheExpires(_span, _format);
    var _default    = {
            set : function() { return;},
            get : function() { return '';},
            isStatus : function() { return false;},
            remove : function() { return; },
            clear : function() { return; }
        };


    if (_cacheType == 'session') {
        if (!window.sessionStorage) return _default;
        _storage= window.sessionStorage;
        _expires= (_span != 0) ? _expires : getCacheExpires(12, 'h'); // 12
                                                                        // hours
    }
    else if (_cacheType == 'cache') {
        if (!window.localStorage) return _default;
        _storage= window.sessionStorage;
        _expires= (_span != 0) ? _expires : getCacheExpires(5, 'm'); // 5
                                                                        // minutes
    }
    else if (_cacheType == 'local') {
        if (!window.localStorage) return _default;
        _storage = window.localStorage;
        _expires= (_span != 0) ? _expires : getCacheExpires(7, 'd'); // 7
                                                                        // days
    }
    else if (_cacheType == 'cookie') {
        _storage = com.lotte.smp.Cookie(1);
        _expires= (_span != 0) ? _expires : getCacheExpires(1, 'd'); // 1
                                                                        // days
    }
    else {
        return _default;
    }

    function getCacheExpires(s, f) {
        var exp = 0;
        switch(f) {
            case 's' : exp = 1;         break;
            case 'm' : exp = 60;        break;
            case 'h' : exp = 3600;      break;  // 60 * 60
            case 'd' : exp = 86400;     break;  // 60 * 60 * 24
            case 'w' : exp = 604800;    break;  // 60 * 60 * 24 * 7
            case 'M' : exp = 2592000;   break;  // 60 * 60 * 24 * 30
            case 'y' : exp = 31536000;  break;  // 60 * 60 * 24 * 365
        }
        return s * exp;
    }

    return {
        type    : _cacheType,
        storage : _storage,
        expires : _expires,
        set : function(name, value, expires) {
            if (typeof name != 'string' || name == '') return;
            if (value == 'undefined') return;
            if (expires=='undefined' || typeof expires != 'number') { expires = this.expires; }

            var date = new Date();
            var schedule= Math.round((date.setSeconds(date.getSeconds()+expires))/1000);

            this.storage.setItem(this.type +'@'+ name, value);
            this.storage.setItem(this.type +'@time_' + name, schedule);

            return this;
        },
        get : function(name) {
            if (this.isStatus(name)) {
                return this.storage.getItem(this.type +'@'+ name);
            }
            else {
                return '';
            }
        },
        isStatus : function(name) {
            if (this.storage.getItem(this.type +'@'+ name) == null || this.storage.getItem(this.type +'@'+ name) == '')
                return false;

            var date = new Date();
            var current = Math.round(+date/1000);

            // Get Schedule
            var stored_time = this.storage.getItem(this.type +'@time_' + name);
            if (stored_time=='undefined' || stored_time=='null') { stored_time = 0; }

            // Expired
            if (stored_time < current) {
                this.remove(name);
                return false;
            } else {
                return true;
            }
        },
        remove : function(name) {
            this.storage.removeItem(this.type +'@'+ name);
            this.storage.removeItem(this.type +'@time_' + name);
        },
        clear : function() {
            for (var item in this.storage) {
                if (String(item).startWith(this.type)) {
                    this.storage.removeItem(item);
                }
            }
            // this.storage.clear();
        }
    };
};

jQuery.fn.serializeObject = function() {
    var obj = null;
    try{
        if ( this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) {
            var arr = this.serializeArray();
            if ( arr ) {
              obj = {};
              jQuery.each(arr, function() {
                obj[this.name] = this.value;
              });
            }
        }
    }
    catch(e) {}
    finally  {}

    return obj;
};

//�덉씠�� �앹뾽 怨듯넻(�닿린, �リ린) �쇰툝由ъ떛
var fnLayerSet = function(layer, status){ //layer : �덉씠�� �꾩씠�� , status : open/close
    var _obj = $('#'+ layer);
    if(status == 'open'){
           
        _obj.show();
        
        var popPos = 0;
        var popWid = parseInt(_obj.width(), 10)/2;
        var popHgt = parseInt(_obj.height(), 10);
        
        
        if(popHgt == 0 && _obj.find('.popup-contents').length > 0){
            popHgt = _obj.find('.popup-contents').height();
        }
                
        popPos = parseInt($(window).scrollTop(), 10) + ((parseInt($(window).height(), 10) - popHgt)/2) ;
        
        if(popHgt > $(window).height()){
            popPos = parseInt($(window).scrollTop(), 10);
        }
       
        if(layer=='passwdLayer'||layer=='lockLayer'){
            popPos2 = _obj.height()/2;
            //_obj.css({'left':'50%' , 'margin-left':-(popWid) , 'top':'50%' , 'margin-top':-(popPos)}).show()
            _obj.css({'left':'50%' , 'margin-left':-(popWid) +'px' , 'top':'50%', 'margin-top':-(popPos2) +'px'});
            $('body').append('<div id="dim"></div>');
        }else{
            var popHgt = _obj.height();
            //_obj.removeClass('hide').css({'margin-top': -_obj.height()/2 +'px'});
            _obj.removeClass('hide');
            popHgt = parseInt(_obj.height(), 10);
            popWid = parseInt(_obj.width(), 10)/2;
            popPos = parseInt($(window).scrollTop(), 10) + ((parseInt($(window).height(), 10) - popHgt)/2) ;
            
            _obj.css({'left':'50%' , 'margin-left':-(popWid) +'px' , 'top': popPos +'px'});
            $('body').append('<div class="dimm" style="\z-index:990;\"></div>');
            console.log(popPos, popHgt);
        }
        
    }else if(status == 'close'){
        if(common.zipcodequick.pop.quickYn == 'Y'){
            _obj.hide();
            _obj.addClass('hide');
            _obj.html("");
            if(layer=='passwdLayer'||layer=='lockLayer'){
                $('#dim').remove();
                $('#layer_pop_wrap').css('top','');
                $('#layer_pop_wrap').css('margin-left','');
                $('#layer_pop_wrap').css('margin-top','');
                $('body').append('<div class="dimm" style="\z-index:990;\"></div>');
            }else{
                $('.dimm').remove();
                $('#layer_pop_wrap').css('top','');
                $('#layer_pop_wrap').css('margin-left','');
                $('#layer_pop_wrap').css('margin-top','');
                $('body').append('<div class="dimm" style="\z-index:990;\"></div>');
            }
        } else {
            _obj.hide();
            _obj.addClass('hide');
            _obj.html("");
            if(layer=='passwdLayer'||layer=='lockLayer'){ 
                $('#dim').remove();
                $('#layer_pop_wrap').css('top','');
                $('#layer_pop_wrap').css('margin-left','');
                $('#layer_pop_wrap').css('margin-top','');
            }else{
                $('.dimm').remove();
                $('#layer_pop_wrap').css('top','');
                $('#layer_pop_wrap').css('margin-left','');
                $('#layer_pop_wrap').css('margin-top','');
            }
        }
        // �덉퐫踰� 異붿쿇�곹뭹�� �λ컮援щ땲�먯꽌 �대뱺 �덈떞�� �덉씠�� �レ쓣�� N 媛믪쑝濡� 珥덇린��
        common.cart.regCartRecoBellGoodsInCartYn = 'N';
    }else if(status == 'closeRecoBellGoodsInCart'){
        location.reload();
    }
};


//�ㅼ삤�ㅽ겕�� 
$.namespace("common.kiosk");
common.kiosk = {
    //�ㅼ삤�ㅽ겕�먯꽌 吏��먰븯�� �붾㈃ URI 泥댄겕
    //Req留ㅽ븨 媛믩벑濡앺븿
    checkKioskURL : function(thisURL,callBack){
        var returnURL ="#";
        var checkURI = {
                "getQuickMainList":true,
                "getPlanShopList":true,
                "getPlanShopDetail":true,
                "getNewList":true,
                "getMCategoryList":true,
                "getGoodsDetailNonDisplay":true,
                "getGoodsDetail":true,
                "getFOQuickList":true,
                "getBrandShopDetail":true,
                "getBestList":true,
                "getSearchMain":true,
        };
        //媛믪씠 �녿뒗寃쎌슦
        if(!thisURL){
            //Callback �⑥닔媛� �덈뒗寃쎌슦
            if($.isFunction(callBack)){
                callBack(returnURL);
            }
            return returnURL;   
        }
        var word = "store";
        var wordIdx = thisURL.indexOf(word);
        var paramIdx = thisURL.lastIndexOf(".do");
        
        // URL Root      ex) http://www.lopc.com/store/
        var url1 = thisURL.substring(0,thisURL.indexOf("/",wordIdx+1)+1);
        // URL �낅Т援щ텇         ex) planshop 
        var url2 = thisURL.substring(thisURL.indexOf("/",wordIdx+1)+1,thisURL.lastIndexOf("/"));
        // URL Mapping   ex)getPlanShopDetail
        var url3 = thisURL.substring(thisURL.lastIndexOf("/")+1,paramIdx);
        // URL Param     ex).do?dispCatNo=500000100210026
        var url4 = thisURL.substring(paramIdx);
        
        var url5 = "";
        if(thisURL.indexOf("javascript") >= 0){
            if(thisURL.indexOf("http") < 0){
                url1 = thisURL.substring(0,thisURL.indexOf("'")+1);
                // URL �낅Т援щ텇         ex) planshop 
                url2 = thisURL.substring(thisURL.indexOf("'")+1,thisURL.lastIndexOf("/"));
            }
            url4 = thisURL.substring(paramIdx,thisURL.lastIndexOf("'"));
            url5 = thisURL.substring(thisURL.lastIndexOf("'"));;
        }
        //KIOSK�� �붾㈃�� 吏��먰븯�붽꼍��
        if(checkURI[url3]){
            
            var kioskMenuId = $("#kioskMenuId").val();
            var paramIdx = url4.indexOf("\?");
            var menuIdx = url4.indexOf("kioskMenuId");
            
            //kioskMenuId媛믪씠 �덇퀬 URL�� �녿뒗寃쎌슦 異붽� �쒕떎
            if(kioskMenuId){
                if(paramIdx == -1 ){
                    url4+="?kioskMenuId="+kioskMenuId;
                }else if(menuIdx == -1 ){
                    url4+="&kioskMenuId="+kioskMenuId;
                } 
            }
            var returnURL =  url1+"kiosk/"+url3+url4+url5;
            //Callback �⑥닔媛� �덈뒗寃쎌슦
            if($.isFunction(callBack)){
                callBack(returnURL);
            }
            return returnURL;   
        //KIOSK�� �붾㈃�� �놁쓬X
        }else{
            //Callback �⑥닔媛� �덈뒗寃쎌슦
            if($.isFunction(callBack)){
                callBack(returnURL);
            }
            return returnURL;   
        }
        
    },
    goodDetailLog : function(){
        var kioskMenuId = $("#kioskMenuId").val();
        switch (kioskMenuId) {
            case "00": common.wlog("kiosk_search_detail"); break;
            case "01": common.wlog("kiosk_best_detail"); break;
            case "02": common.wlog("kiosk_new_detail"); break;
            case "03": common.wlog("kiosk_quick_detail"); break;
            case "04": common.wlog("kiosk_planshop_detail"); break;
        } 
    }
};