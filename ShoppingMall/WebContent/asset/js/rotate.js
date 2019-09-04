/**
 * 
 */

(function($) {
  $.fn.extend({

    roulette: function(options) {

      var defaults = {
        angle: 0,
        angleOffset: -45,
        speed: 5000,
        easing: "easeInOutElastic",
      };

      var opt = $.extend(defaults, options);

      return this.each(function() {
        var o = opt;

        var data = [
					{
            color: '#3f297e',
            text: '꽝',
            data: 'null'
          },
          {
            color: '#1d61ac',
            text: '꽝',
            data: 'null'
            	
          },
          {
            color: '#169ed8',
            text: '10% 쿠폰',
            data: '1'
            	
          },
          {
            color: '#209b6c',
            text: '꽝',
            data: 'null'
          },
          {
            color: '#60b236',
            text: '20% 쿠폰',
            data: '2'
          },
          {
            color: '#efe61f',
            text: '꽝',
            data: 'null'
          },
          {
            color: '#f7a416',
            text: '90% 쿠폰',
            data: '4'
          },
          {
            color: '#e6471d',
            text: '꽝',
            data: 'null'
          },
          {
            color: '#dc0936',
            text: '30% 쿠폰',
            data: '3'
          },
          {
            color: '#e5177b',
            text: '꽝',
            data: 'null'
          }
        ];

        var $wrap = $(this);
        var $btnStart = $wrap.find("#btn-start");
        var $roulette = $wrap.find(".roulette");
        var wrapW = $wrap.width();
        var angle = o.angle;
        var angleOffset = o.angleOffset;
        var speed = o.speed;
        var esing = o.easing;
        var itemSize = data.length;
        var itemSelector = "item";
        var labelSelector = "label";
        var d = 360 / itemSize;
        var borderTopWidth = wrapW;
        var borderRightWidth = tanDeg(d);

        for (i = 1; i <= itemSize; i += 1) {
          var idx = i - 1;
          var rt = i * d + angleOffset;
          var itemHTML = $('<div class="' + itemSelector + '">');
          var labelHTML = '';
              labelHTML += '<p class="' + labelSelector + '">';
              labelHTML += '	<span class="text">' + data[idx].text + '<\/span>';
              labelHTML += '<\/p>';

          $roulette.append(itemHTML);
          $roulette.children("." + itemSelector).eq(idx).append(labelHTML);
          $roulette.children("." + itemSelector).eq(idx).css({
            "left": wrapW / 2,
            "top": -wrapW / 2,
            "border-top-width": borderTopWidth,
            "border-right-width": borderRightWidth,
            "border-top-color": data[idx].color,
            "transform": "rotate(" + rt + "deg)"
          });

          var textH = parseInt(((2 * Math.PI * wrapW) / d) * .5);

          $roulette.children("." + itemSelector).eq(idx).children("." + labelSelector).css({
            "height": textH + 'px',
            "line-height": textH + 'px',
            "transform": 'translateX(' + (textH * 1.3) + 'px) translateY(' + (wrapW * -.3) + 'px) rotateZ(' + (90 + d * .5) + 'deg)'
          });

        }

        function tanDeg(deg) {
          var rad = deg * Math.PI / 180;
          return wrapW / (1 / Math.tan(rad));
        }
        
        var count = 0;

        $btnStart.on("click", function() {
          if(count==0){
        	  rotation();
          }else{
        	  alert("이미 쿠폰 룰렛 1회 참여하셨습니다.");
          }
        });
        
        
        function rotation() {
        	
          var completeA = 360 * 5 + r(0, 360);
          
          count++;
          
          $roulette.rotate({
            angle: angle,
            animateTo: completeA,
            center: ["50%", "50%"],
            easing: $.easing.esing,
            callback: function() {
            	var n = $(this).getRotateAngle();
				endAnimate(n);
            },
            duration: speed
          });
        }
        ///
        function endAnimate($n){
    		var n = $n;
    		var real_angle = n%360+26;
    		var part = Math.floor(real_angle/36);
    		var cpName = data[(10-part)].text;
    		var cpNum = data[(10-part)].data;
    		
    		console.log(count);
    		
    		if(cpNum != 'null'){
   			
    			alert("축하합니다! "+ cpName + " 당첨되셨습니다.");
				location.href="CouponInsertAction.cp?coupon_num=" + cpNum;
    		}else{	
    			alert("꽝입니다 ㅠㅠ"); 
    			location.href='./Coupon.cp';

    		}
    		
    	}
        ///

        function r(min, max) {
          return Math.floor(Math.random() * (max - min + 1)) + min;
        }

      });
    }
  });
})(jQuery);

$(function() {

  $('.box-roulette').roulette();

});