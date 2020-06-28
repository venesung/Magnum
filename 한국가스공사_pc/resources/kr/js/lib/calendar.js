/* calendar
 * 2013.12.09 zt 
 */

var Calendar = function(_container, _input){
    var $container = _container;
    var $input = _input;
    var calendarHtml = "";
    var now, year, month, day, currentMonth, currentYear, currentDay, selectYear, selectMonth, selectDay;     
    var prevMonthBtn,nextMonthBtn,closeBtn,openBtn;
    
   init();
   
   function init(){
       now = new Date();
       year = now.getFullYear();  
       month = now.getMonth();
       day = now.getDate();
       
       currentYear = year;
       currentMonth = month+1;       
       currentDay =  day;      
       
       setUi();
       calculation();      
   }
   
   function setUi(){             
       closeBtn = $(".btn_close");
       prevMonthBtn = $(".calendarTop a:first-child");
       nextMonthBtn = $(".calendarTop a:last-child");       
       $input.attr("readonly","readonly");
        
        $input.on("click",function(e){
            e.stopPropagation();
            e.preventDefault();
            $container.show();      
        });
        
       prevMonthBtn.on("click",function(e){
        e.stopPropagation();
        e.preventDefault();
         if (month == 0) {
               year--;
               month = 11;
          }else{
               month--;
          }
          calculation(); 
         
       });
       
       nextMonthBtn.on("click",function(e){
        e.stopPropagation();
        e.preventDefault(); 
         if (month > 10) {
               year++;
               month = 0;
          }else{
              month++;
          }  
          calculation();
       });
              
       closeBtn.on("click",function(e){
            e.stopPropagation();
            e.preventDefault();
            $container.hide();      
            reset();
            closeBtn.focusout(function(e){
              $input.focus();
            });
       });
   }

   
   function calculation() {
      var firstDay = new Date(year, month, 1);
      var yoil = firstDay.getDay(); 
      var nalsu = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
      if ((year % 4 === 0) && (year % 100 !== 0) || (year % 400 === 0)) {
           nalsu[1] = 29; 
      }
      makeData(yoil, nalsu[month], year, month + 1, day);      
    }

     function makeData(yoil, nalsu, year, month, day) {          
          calendarHtml = "";          
          calendarHtml += "<caption>달력보기</caption><colgroup><col width='28px' /><col width='28px' /><col width='28px' /><col width='28px' /><col width='28px' /><col width='28px' /><col width='28px' /></colgroup>";
          calendarHtml += "<thead><tr class='hidden'>";
          var weekTitle = new Array("일", "월", "화", "수", "목", "금", "토");
          for ( var a = 0; a < weekTitle.length; a++) {
            calendarHtml += "<th>" + weekTitle[a] + "</th>";
          }
          
          calendarHtml += "</tr></thead><tbody>";
          var no = 1;
          var currentCell = 0;
          var week = Math.ceil((nalsu + yoil) / 7); 
          for ( var row = 1; row <= week; row++) {
               calendarHtml += "<tr>"; 
               for ( var col = 1; col <= 7; col++) {
                    if (no > nalsu)
                        break; 
                    if (currentCell < yoil) {
                         calendarHtml += "<td>&nbsp</td>";
                         currentCell++;
                    } else {
                         if (no === day && currentMonth === month && currentYear === year ) {
                             calendarHtml += "<td><a href='#' class='on'>" + no + "</a></td>";
                         } else {
                             calendarHtml += "<td><a href='#'>" + no + "</a></td>";
                         }
                    no++;
                    }
                  }
                  calendarHtml += "</tr>";
              }
          calendarHtml += "</tbody>";
                    
          if(year <= currentYear &&  month <= currentMonth){
              prevMonthBtn.hide();
          }else{
              prevMonthBtn.show();
          }
          
          $(".calendarcon .calendarTable").empty().append(calendarHtml);
          $container.find(".day").text( year + "."+ digit(month));
          $container.find("tbody tr td:nth-child(7)").addClass("sat");
          
          $container.find("tbody tr td a").on("click",function(e){
            e.stopPropagation();
            e.preventDefault();
            selectYear = year+"";
            selectMonth = digit(month)+"";
            selectDay = digit($(this).text())+"";
            if(year <= currentYear &&  month <= currentMonth && selectDay <= currentDay){
                alert("오늘 이후 날짜를 선택 해주세요.");
                return;
            }
            
            $input.val(selectYear+"."+selectMonth+"."+selectDay);
            $input.focus();
            closeBtn.trigger("click");
         });
     }
   
   function reset(){
        prevMonthBtn.off();
        nextMonthBtn.off();
        closeBtn.off();     
        $input.off();
        init();
   }
    
    function digit(num){
        if(Number(num) < 10) return "0" + Number(num);
        else return String(num);
    }       
};
