(function($){
    $.fn.tabToggle = function(options){
        var defaults = {
            cont_nm : '.tabConts',          //湲곕낯 ?? 而⑦뀗痢? ?대옒??
            init_no : 0                     //?? ?ㅽ뵂 idx
        }
        options = $.extend(defaults, options);

        return this.each(function(){
            var _idx = options.init_no;
            var _this = $(this);
            
            _this.children('li:eq('+ _idx +')').addClass('on').siblings('li').removeClass();
            $(options.cont_nm).eq(_idx).addClass('show').siblings(options.cont_nm).removeClass('show');

            _this.find('a').click(function(e){
                e.preventDefault();
                _idx = $(this).parent().index();
                
                _this.children('li:eq('+ _idx +')').addClass('on').siblings('li').removeClass();
                $(options.cont_nm).eq(_idx).addClass('show').siblings(options.cont_nm).removeClass('show');
            });
            
        });       
    }
    
    
    $.fn.mainMenu = function(){
        
    }
    
    
    function option_reSet(obj){
        obj.find('.sel_option').html('?곹뭹?? ?좏깮?댁＜?몄슂');
    }
    
})(jQuery);

var setTimeLayer;

jQuery(function($){
    var oyoGnb = {
        init : function(){
            gnbMenu = $('#gnbWrap');
            myMenu = $('.mymenu_area');
            myMenu_li = myMenu.children('li');
           
            this.addEvent();
        },
        addEvent : function(){
            
            myMenu_li.on('mouseenter', function(){
                var _this = $(this);
                if(_this.hasClass('open')){
                    return;
                }else{                   
                    setTimeLayer = setTimeout(function(){
                        _this.addClass('open');
                    }, 200);
                }
            })
            .on('mouseleave', function(){
                clearTimeout(setTimeLayer);
                $(this).removeClass('open');
            })
            .on('focusin', function(e){
                e.preventDefault();
                $(this).addClass('open').siblings().removeClass('open');
                
            });
 
            
            //GNB 移댄뀒怨좊━ ?덉씠?? ?닿린/?リ린 
            $('#btnGnbOpen').click(function(e){
                e.preventDefault();
                if($(this).hasClass('active')){
                    $(this).removeClass('active');
                    $('.layer_all_menu').removeClass('active');
                }else{
                    $(this).addClass('active');
                    $('.layer_all_menu').addClass('active');
                }
            });
            $('#btnGnbClose').click(function(e){
                e.preventDefault();
                $(this).removeClass('active');
                $('.layer_all_menu').removeClass('active');
            });
        }
    };
    oyoGnb.init();
    
    
    
    //placeholder 泥섎━(IE9 ?댄븯 吏???)
    $('.inp_placeholder').each(function(){
        var tx_placeholder = $(this).attr('data-placeholder');
        var tx_placeholder_id = $(this).attr('id');
        if(tx_placeholder != null && tx_placeholder != '' && tx_placeholder_id != null && tx_placeholder_id != ''){
            if($(this).hasClass('inp_mid')){
                $(this).wrap('<div class="placeholder_area middle"></div>');
            }else if($(this).hasClass('inp_small')){
                $(this).wrap('<div class="placeholder_area small"></div>');
            }else{
                $(this).wrap('<div class="placeholder_area"></div>');
            }            
            $(this).before('<label for="'+ $(this).attr('id') +'">'+ tx_placeholder +'</label>');
        }
        if($(this).val() != ''&& $(this).val() != null){
            $(this).parent().find('label').addClass('hide');
        }
    });
    
    $('.inp_placeholder').on({
       'focus' : function(){
           $(this).parent().find('label').addClass('hide');
       },
       'blur' : function(){
           if($(this).val() !='' && $(this).val() != null){
               $(this).parent().find('label').addClass('hide');
           }else{
               $(this).parent().find('label').removeClass('hide');
           }
       }
    });   

    $(document).on({        
        'click' : function(e){
            //?ㅻ뜑 寃??? ?덉씠??
            if(!$('.search_box.active').is(e.target) && $('.search_box.active').has(e.target).length === 0){
                $('.search_box').removeClass('active');
            }
            
            //?꾩껜 移댄뀒怨좊━ ?덉씠??
            if($('.layer_all_menu.active').has(e.target).length === 0 && e.target.id !== 'btnGnbOpen'){
                $('#btnGnbOpen').removeClass('active');
                $('.layer_all_menu').removeClass('active');
            }
            
            //?명꽣 怨꾩뿴?? 諛붾줈媛?湲?
            if($('.sel_family_group').has(e.target).length === 0){
                $('.sel_family_group .sel_option_list').addClass('hide');
            }
        },
        'focusin' : function(e){
            if($('.search_box.active').has(e.target).length === 0){
                $('.search_box').removeClass('active');
            }
            if($('.layer_all_menu.active').has(e.target).length === 0){
                $('#btnGnbOpen').removeClass('active');
                $('.layer_all_menu').removeClass('active');
            }
            if($('.main_cate_wrap.active').has(e.target).length === 0){
                $('.main_cate_wrap').removeClass('active');
            }
            if($('.mymenu_area .store.open').has(e.target).length === 0){
                $('.mymenu_area .store.open').removeClass('open');
            }
            if($('.mymenu_area .recent.open').has(e.target).length === 0){
                $('.mymenu_area .recent.open').removeClass('open');
            }
        }
    });
});

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