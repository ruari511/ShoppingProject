(function($){
       
    $.fn.layerOpen = function(options){
        return this.each(function(){
            var _this = $(this);
            var _layer = $('#'+ _this.attr('data-target') || null);
            var _marLeft = _layer.width()/2;
            _this.click(function(e){
                e.preventDefault();
                
                var _layer_pos;
                
                if(_layer.height() > $(window).height()){
                    _layer_pos = $(window).scrollTop();
                    console.log( $(this).width());
                }else{
                    _layer_pos = $(window).scrollTop() + ($(window).height() - _layer.height())/2;
                    console.log( _layer.width());
                }
                _layer.css('margin-left','-'+ _marLeft +'px');
                _layer.attr('tabindex', 0).addClass('show').css({'top': _layer_pos +'px'}).focus();
                
                if(_layer.find('.prd_option_box').length > 0){          
                    option_reSet(_layer);
                }
                
                $('body').append('<div class="dimm"></div>');
                
                _layer.find('.layer_close').one('click', function(){    
                    $('.dimm').remove();
                    _layer.removeClass('show');
                    _this.focus();
                });
                $('.dimm').one('click', function(){                     
                    $('.dimm').remove();
                    _layer.removeClass('show');
                    _this.focus();
                });
            });
        });
    };
    
    
    $.fn.kioskLayerOpen = function(options){
        return this.each(function(){
            var _this = $(this);
            var _layer = $('#'+ _this.attr('data-target') || null);
            var _marLeft = _layer.width()/2;
            _this.click(function(e){
                e.preventDefault();
                
                var _layer_pos;
                
                $('#kioskBody').addClass('fixing');
                $('body').addClass('fixing');
                
                if(_layer.height() > $(window).height()){
                    _layer_pos = $(window).scrollTop();
                }else{
                    _layer_pos = $(window).scrollTop() + ($(window).height() - _layer.height())/2;
                }
                $('body').addClass('fixing');
                _layer.css('margin-left','-'+ _marLeft +'px');
                _layer.attr('tabindex', 0).addClass('show').css({'top': _layer_pos +'px'}).focus();
                
                if(_layer.find('.prd_option_box').length > 0){         
                    option_reSet(_layer);
                }
                
                $('body').append('<div class="dimm"></div>');
                
                _layer.find('.layer_close').one('click', function(){    
                    $('.dimm').remove();
                    $('#kioskBody').removeClass('fixing');
                    $('body').removeClass('fixing');
                    _layer.removeClass('show');
                    _this.focus();
                });
                $('.dimm').one('click', function(){                     
                    $('.dimm').remove();
                    $('#kioskBody').removeClass('fixing');
                    $('body').removeClass('fixing');
                    _layer.removeClass('show');
                    _this.focus();
                });
            });
        });
    };
    
    
    $.fn.tabToggle = function(options){
        var defaults = {
            cont_nm : '.tabConts',          
            init_no : 0                     
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
        obj.find('.sel_option').html('�긽�뭹�쓣 �꽑�깮�빐二쇱꽭�슂');
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


    
    var header_search = {
        init : function(){
            
            search_input = $('.search_box input');      
            search_tab = $('.search_tab');
            
            this.addEvent();
        }, 
        addEvent : function(){
            
            search_input.focusin(function(e){
                var key_val = e.which;

                $(this).parents('.search_box').addClass('active');
            });            
            search_tab.click(function(e){
               e.preventDefault();
               $(this).addClass('on').siblings('.search_tab').removeClass('on');
            });
        }        
    };
    
    $('.search_box').length && header_search.init();
    
    
   
    $(document).on({        
        'click' : function(e){
            if(!$('.search_box.active').is(e.target) && $('.search_box.active').has(e.target).length === 0){
                $('.search_box').removeClass('active');
            }
            
            if($('.layer_all_menu.active').has(e.target).length === 0 && e.target.id !== 'btnGnbOpen'){
                $('#btnGnbOpen').removeClass('active');
                $('.layer_all_menu').removeClass('active');
            }
            
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
  
    
    var history_loc = {
        init : function(){
            $('.history_cate_box').each(function(){
                $(this).css('width', ($(this).find('ul').length * 120) + 2+ 'px'); 
            });
            
            this.addEvent();
        },
        addEvent : function(){
            
            $('.page_location .loc_history').find('li').on({
                'mouseover' : function(e){
                    if($(this).find('a').hasClass('cate_y')){
                        $(this).addClass('active');
                    }
                },
                'mouseout' : function(e){
                    $(this).removeClass('active');
                }
            });
            
            $('.page_location .loc_history').find('.cate_y').on({
                'focusin' : function(e){
                    $('.page_location .loc_history li').removeClass('active');
                    $(this).parent().addClass('active');
                }
            });           
            
            var last_idx = null;
            var cur_idx = 0;
            $('.page_location .loc_history .history_cate_box').find('a').on({
                'focusin' : function(){
                    if(last_idx == null){
                        last_idx = $(this).parents('.history_cate_box').find('ul > li').length - 1;
                    }
                },
                'focusout' : function(){
                    cur_idx = ($(this).parent().parent().index() * 10) + $(this).parent().index();
                    
                    if(cur_idx == last_idx){
                        $(this).parents('li').removeClass('active');
                        last_idx = null;
                    }
                }
            });
                        
        }
    };
    
    $('.history_cate_box').length && history_loc.init();
    
    var floatBanner = {
        init : function(){
            float_banner_pos = parseInt($('.main_floating_banner').css('top'), 10);
            this.addEvent(float_banner_pos);
        },
        addEvent : function(pos){
            $(window).scroll(function(){
                var scroll_pos = $(window).scrollTop();
                if(scroll_pos > pos){
                    $('.main_floating_banner').stop().animate({'top' : scroll_pos +'px'});
                }else{
                    $('.main_floating_banner').stop().animate({'top' : pos +'px'});
                }
            });
        
        }
    }
    $('.main_floating_banner').length && floatBanner.init();
    
    var fnBtnAction = {
        init : function(){
            var scroll_pos = $(window).scrollTop();
            if(scroll_pos > $(window).height() / 2){
                $('#directTop').fadeIn(500);
            }
            
            this.addEvent();
        },
        addEvent : function(){
            $(window).scroll(function(){
                var scroll_pos = $(window).scrollTop();
                
                if(scroll_pos > $(window).height() / 2){
                    $('#directTop').fadeIn(500);
                }else if(scroll_pos == 0){
                    $('#directTop').fadeOut(500);
                }                
            });
            $('#directTop button').click(function(){
                $(window).scrollTop(0);
            });
        }
    }
    $('#directTop').length && fnBtnAction.init();

    
    
    
    $('.layer_pop_wrap').on('scroll mousewheel touchmove', '.layer_scroll_box2', function(e){
        if(e.originalEvent.wheelDelta >= 120){
            this.scrollTop -= 50;
        }else if(e.originalEvent.wheelDelta <= -120){
            this.scrollTop += 50;
        }
        return false;
    });
    $('.layer_pop_wrap').on('scroll mousewheel touchmove', '.layer_scroll_box', function(e){
        if(e.originalEvent.wheelDelta >= 120){
            this.scrollTop -= 50;
        }else if(e.originalEvent.wheelDelta <= -120){
            this.scrollTop += 50;
        }
        return false;
    });
        
    
    var ordBoxSet = {
        init : function(){
            this.addEvent();
        },
        addEvent : function(){
            
            var oBox = $('.order_payment_box');                               
            var oBox_h = 0, oBox_pos = 0, rBox_h = 0, oBox_e_pos = 0, scl_pos = 0;                                                     
            
            $(window).scroll(function(){
                
                init_val();
                                
                if(oBox_h > rBox_h){                                                
                    scl_pos = $(window).scrollTop();                            
                    if(scl_pos >= oBox_e_pos - rBox_h){
                        oBox.removeClass('fixArea').addClass('relArea');
                    }else if(oBox_pos <= scl_pos && oBox_e_pos > scl_pos){
                        oBox.addClass('fixArea').removeClass('relArea');
                    }else{
                        oBox.removeClass('fixArea').removeClass('relArea').removeClass('areaCless');
                    }
                }
            });
            
          
            $('.btnDetailAgree').click(function(){
                
                var _elem = $('.agree_payment_box');
                
                if(_elem.hasClass('open')){
                    _elem.removeClass('open');
                }else{
                    _elem.addClass('open');
                }             
                init_val();
                
                scl_pos = $(window).scrollTop();
                
                if(rBox_h > oBox_h){    
                    oBox.removeClass('fixArea').removeClass('relArea');
                }else{
                    if(oBox.hasClass('fixArea')){
                        if(oBox_e_pos - scl_pos < rBox_h){
                            oBox.addClass('relArea').removeClass('fixArea');
                        }                        
                    }else if(oBox.hasClass('relArea')){
                        if(oBox_e_pos - scl_pos > rBox_h){
                            oBox.removeClass('relArea').addClass('fixArea');
                        }
                    }
                }
            });
            
            $('.payment_info_form').children('li:first-child').find('input[type="radio"]').click(function(){                
                
                setTimeout(function(){
                    init_val();
               
                    scl_pos = $(window).scrollTop();
                    
                    if(rBox_h > oBox_h){    
                        oBox.removeClass('fixArea').removeClass('relArea');
                    }else{
                        if(oBox.hasClass('fixArea')){
                            if(oBox_e_pos - scl_pos < rBox_h){
                                oBox.addClass('relArea').removeClass('fixArea');
                            }                        
                        }else if(oBox.hasClass('relArea')){
                            if(oBox_e_pos - scl_pos > rBox_h){
                                oBox.removeClass('relArea').addClass('fixArea');
                            }
                        }
                    }
                }, 10);
                
            });
            
            
            var init_val = function(){
                oBox_h = parseInt(oBox.height(), 10);
                oBox_pos = parseInt(oBox.offset().top, 10);
                oBox_e_pos = parseInt(oBox.offset().top, 10) + oBox_h;
                rBox_h = oBox.find('.right_area').height();
                
                return;
            }
        }
    };

    $('.order_payment_box').length && ordBoxSet.init();
    
    
    $('.plan-menu > li').click(function(){
        $(this).addClass('on').siblings().removeClass('on');
    });

    $('#cjonePnt_btn').click(function(){
        $('.order_payment_box').addClass('fixArea').removeClass('fixArea');
    });

    //open event fixed menu
    
    var $win = $(window);
    var top = $(window).scrollTop(); // �뒪�겕濡ㅻ컮�쓽 �쐞移섍컪
 
    /*�궗�슜�옄 �꽕�젙 媛� �떆�옉*/
    var speed          = 500;     // �뵲�씪�떎�땺 �냽�룄 : "slow", "normal", or "fast" or numeric(�떒�쐞:msec)
    var easing         = 'linear'; // �뵲�씪�떎�땲�뒗 諛⑸쾿 湲곕낯 �몢媛�吏� linear, swing
    var $layer         = $('.fix_lnb'); // �젅�씠�뼱 �?�젆�똿
    var layerTopOffset = 100;   // �젅�씠�뼱 �넂�씠 �긽�븳�꽑, �떒�쐞:px
    $layer.css('position', 'fixed').css('z-index', '1');
    /*�궗�슜�옄 �꽕�젙 媛� �걹*/
 
    // �뒪�겕濡� 諛붾? �궡由� �긽�깭�뿉�꽌 由ы봽�젅�떆 �뻽�쓣 寃쎌슦瑜� �쐞�빐
    if (top > 0 )
        $win.scrollTop(layerTopOffset+top);
    else
        $win.scrollTop(0);
 
    //�뒪�겕濡ㅼ씠踰ㅽ듃媛� 諛쒖깮�븯硫�
    $(window).scroll(function(){
        yPosition = 0; //�씠遺�遺꾩쓣 議곗젙�빐�꽌 �솕硫댁뿉 蹂댁씠�룄濡� 留욎텛�꽭�슂
        if (yPosition < 0)
        {
            yPosition = 0;
        }
        $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
    });
});
