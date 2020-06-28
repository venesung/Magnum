/* 롤링배너  스크립트 
 * param : {container:전체배너컨테이너, imgcontainer:배너ul컨테이너, item:배너아이템, prevBtn:이전버튼, nextBtn:다음버튼, stopBtn:멈춤버튼, dotBtn:리스트버튼, isOpacity:투명트윈여부, delay:딜레이, speed:스피드, isPlay:자동플레이}
 * */
var RollingBanner = function(data){
    var $bannerContainer = $(data.container);
    if($bannerContainer.length < 1){ return;}
    var $bannerImgContainer = $(data.imgcontainer);
    var $bannerItem = $(data.item);
    var bannerWidth = $(data.item).width();
    var bannerLen =  $(data.item).length;
    var $prevBtn = $(data.prevBtn);
    var $nextBtn = $(data.nextBtn);
    var $stopBtn = $(data.stopBtn);
    var $dotBtn = $(data.dotBtn);          
    var isOpacity = (data.isOpacity !== undefined) ? data.isOpacity : false;
    var isPlay = (data.isPlay !== undefined) ? data.isPlay : true;    
    var bdelay = data.delay || 5000, bspeed = data.speed || 700;
    var isTweening = false , isMouseEnter=false, bannerIdx = 0, bannerInterval;
    
    bannerInit();
    
    function bannerInit(){
        if(bannerLen < 2){
            $prevBtn.hide();
            $nextBtn.hide();
            $stopBtn.hide();
            $dotBtn.hide();
            return;
        }
        
        $bannerImgContainer.find("a").attr("tabIndex",-1);
        $bannerImgContainer.find("a:eq(0)").removeAttr("tabIndex");
        $bannerImgContainer.css({"width":bannerWidth *bannerLen,"position":"relative","left":0});      
          
        $prevBtn.on("click", function(e){
            e.stopPropagation();
            e.preventDefault();
            if(isTweening)return false;
            var idx = ++bannerIdx;        
            bannerMove(idx);         
        });
        
        $nextBtn.on("click", function(e){
            e.stopPropagation();
            e.preventDefault();          
            if(isTweening)return false;  
            var idx = --bannerIdx;        
            bannerMove(idx);         
        });
        
        $stopBtn.on("click", function(e){
            e.stopPropagation();
            e.preventDefault();           
            bannerStopPlay();            
        });
        
        $dotBtn.on("click focusin", function(e){
            e.stopPropagation();
            e.preventDefault();          
            if(isTweening)return false;  
            var idx = $(this).parent().index();        
            bannerMove(idx);         
        });
        
        $bannerContainer.on("mouseenter", function(e){      
            isMouseEnter  = true;
            if(bannerInterval)clearInterval(bannerInterval);
            bannerInterval = null;                 
        });
        
        $bannerContainer.on("mouseleave", function(e){        
            isMouseEnter =false;   
            if(isPlay){
                if(bannerInterval)clearInterval(bannerInterval);
                bannerInterval = setInterval(bannerInter,bdelay);   
            }
        });
        
         if(isPlay){
            if(bannerInterval)clearInterval(bannerInterval);
            bannerInterval = setInterval(bannerInter,bdelay);    
        }            
    }
    
    function bannerInter(){
        --bannerIdx;
        bannerMove(bannerIdx);
    }
    
    function bannerMove(_idx){
        isTweening = true;
        if(_idx > 0){
            $bannerImgContainer.prepend($bannerImgContainer.find("li:last-child"));
            $bannerImgContainer.css({"left":-bannerWidth});
            _idx = 0;
        }else if(_idx <= -bannerLen){
            $bannerImgContainer.append($bannerImgContainer.find("li:first-child"));
            $bannerImgContainer.css({"left":(bannerLen-2)*-bannerWidth});      
            _idx = -bannerLen+1;      
        }       
        
        $bannerImgContainer.find("a").attr("tabIndex",-1);
        if(isOpacity){
                $bannerImgContainer.css({"left":_idx*bannerWidth,"opacity":0});
                $bannerImgContainer.stop().animate({"opacity":1},bspeed , function(){
                    motionComplete(_idx); 
                });                
            
        }else{
            $bannerImgContainer.stop().animate({"left":_idx*bannerWidth},bspeed, 'easeInOutQuart',function(){
               motionComplete(_idx);
            });    
        }        
        bannerIdx = _idx;               
    }
    
   function motionComplete(_idx){
        isTweening =false;
        $bannerImgContainer.find("a:eq("+Math.abs(_idx)+")").removeAttr("tabIndex");
        if(!isMouseEnter){
            if(isPlay){
                if(bannerInterval)clearInterval(bannerInterval);
                bannerInterval = setInterval(bannerInter,bdelay);   
            }    
        }
        
   }
    
    function bannerStopPlay(){
        if(isPlay){
            isPlay = false;
            if(bannerInterval)clearInterval(bannerInterval);
            //$stopBtn.removeClass("play");
            //$stopBtn.addClass("stop");
        }else{
            isPlay = true;            
            if(bannerInterval)clearInterval(bannerInterval);
            bannerInterval = setInterval(bannerInter,bdelay);
            //$stopBtn.removeClass("stop");
            //$stopBtn.addClass("play");   
        }
    }
};