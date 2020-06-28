function my_put(input_code,code_name) {//종목코드,종목이름 넘겨주기
    var i = 0;   
    var result = "";
    if (my_get(input_code)) {
        var len = myCode.length;
        for (i = 0, size = myCode.length; i < size; i++) {
            if (size >= 20) {
                if (i==0) {
                    continue;
                }
            }
            result = result + myCode[i].stock_code + "," + myCode[i].stock_name + "|";
        }
    }

    //기존에 쿠키에 있는 종목이면 제외.
    result = result + input_code + "," + code_name + "|";
    setCookie("sp_code_history", result, 31);
}
 
function my_get(input_code) {
    var cookie_value = getCookie("sp_code_history");
    var flag = true;
    if (cookie_value == null) {
        return false;
    }
 
    var startIdx =0;
    var endIdx = 0;
    var i = 0;
    myCode = new Array();
    
    while(true) {
        endIdx = cookie_value.indexOf("|",startIdx);
 
        if (endIdx < 0) {
            break;
        }
 
        token = cookie_value.substring(startIdx,endIdx);
        startIdx = endIdx + 1;
        var startTokenIdx = 0;
        var endTokenIdx = 0;
        var code = '';
 
        endTokenIdx = token.indexOf(",",0);
        code = token.substring(0,endTokenIdx);
        code_name = token.substring(endTokenIdx+1);

        if (input_code != code) {
            myCode[i] = new CodeHistory(code,code_name);
            i = i + 1;
        }
    }
    
    return true;
}
	

var JAuto = {
	_config: null,
	
	init: function(config){
		this._config = config;
		if(this._config == null){
			this._config = {
				formid: "txt_jongmok1"	
			};
		}
		
		var oForm = null;
		var jarr = arr;	// 종목로딩
		
		/*
		var font_cho = Array(
				'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ',
				'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ',
				'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' );

		var font_jung = Array(
				'ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ',
				'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ', 'ㅙ',
				'ㅚ', 'ㅛ', 'ㅜ', 'ㅝ', 'ㅞ', 'ㅟ',
				'ㅠ', 'ㅡ', 'ㅢ', 'ㅣ' );

		var font_jong = Array(
				'', 'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ', 'ㄷ', 'ㄹ',
				'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ', 'ㄿ', 'ㅀ', 'ㅁ',
				'ㅂ', 'ㅄ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' );
		*/
		
		var formid_arr = [];
		if(typeof config.formid == "string"){
			formid_arr = new Array(1);
			formid_arr[0] = config.formid;
		}else{
			formid_arr = config.formid;
		}
		
		var auto_tb = $("#AutoList");
		for(var i=0; i<formid_arr.length; i++){
			if(formid_arr[i] != ""){
				oForm = $("#"+formid_arr[i]);
			}else{
				oForm = $("#txt_jongmok1");
			}
			if(oForm.length == 0 ) continue;
			
			var inp_val = "";
			/*
			<!-- 자동완성 Start -->
			<ul class="AutoList" style="display:;">
				<li><span>A066570</span> SK 하이닉스</li>
				<li><span>A066570</span> SK 하이닉스</li>
				<li><span>A066570</span> SK 하이닉스</li>
				<li><span>A066570</span> SK 하이닉스</li>
			</ul>
			<!--// 자동완성 End -->
			*/
			
			auto_tb.hide();
			//$("#AutoList").append("<li><span>"++"</span> SK 하이닉스</li>");
			
			
			oForm.bind("focusin", function(e){
				auto_tb.css({
					left: "533px",
					top	:"45px"
				});
				
				inp_val = $(e.target).val();
				if(inp_val == "검색어를 입력하세요."){
					$(e.target).val("");
				}
			});
			oForm.bind("focusout", function(e){
				inp_val = $(e.target).val();
				if($.trim(inp_val) == ""){
					$(e.target).val("검색어를 입력하세요.");
				}
			});
			
			oForm.bind("keyup", function(e){
				inp_val = $(e.target).val();
				auto_tb.find("li").remove();
				auto_tb.hide();
				if(inp_val == ""){
					// 안들어왔을때는 아무것도 안함.
					
				}else if( isNaN(inp_val) == false){	// 전부 숫자일때
					
					var tot_cnt = 0;	
					
					for(var i=0; i<jarr.length; i++){
						if(jarr[i][0].substr(0, inp_val.length) == inp_val && tot_cnt <= 10){
							auto_tb.append("<li><a href=\"#\" onClick=\"JAuto.setCodeName('"+jarr[i][0]+"','"+jarr[i][1]+"'); return false;\"><span>"+jarr[i][0]+"</span>"+jarr[i][1]+"</a></li>");
							tot_cnt++;
						}
					}
					
					if(tot_cnt > 0){
						auto_tb.show();
					}
				}else{
					var tot_cnt = 0;				
					for(var i=0; i<jarr.length; i++){
						
						if(jarr[i][1].substr(0, inp_val.length) == inp_val && tot_cnt <= 10){
							auto_tb.append("<li><a href=\"#\" onClick=\"JAuto.setCodeName('"+jarr[i][0]+"','"+jarr[i][1]+"'); return false;\"><span>"+jarr[i][0]+"</span>"+jarr[i][1]+"</a></li>");
							tot_cnt++;
						}
						/*
						var inp_val_cho = "";
						var comp_val_cho = "";
						for(var j=0; j<inp_val.length; j++){
							inp_val_cho += font_cho[parseInt (( ( (inp_val.charCodeAt(j) - 0xAC00) - ((inp_val.charCodeAt(j) - 0xAC00)%28) ) / 28 ) / 21)];
						}
						for(var j=0; j<jarr[i][1].length; j++){
							comp_val_cho += font_cho[parseInt (( ( (jarr[i][1].charCodeAt(j) - 0xAC00) - ((jarr[i][1].charCodeAt(j) - 0xAC00)%28) ) / 28 ) / 21)];
						}
						
						if(inp_val_cho.indexOf(comp_val_cho) != -1 && tot_cnt <= 10){
							auto_tb.find("tbody").append("<tr><td>"+jarr[i][0]+ " | " + jarr[i][1] +"</td></tr>");
							tot_cnt++;
						}
						*/

					}
					
					if(tot_cnt > 0){
						auto_tb.show();
					}
				}
			});
			
		}
		
		
		
		
	},
	
	setCodeName: function(code_key, code_name){
		var oForm = null;
		var auto_tb = $("#AutoList");
		
		if(this._config.formid != ""){
			oForm = $("#"+this._config.formid);
		}else{
			oForm = $("#txt_jongmok1");
		}
		
		// 쿠키저장
		my_put(code_key, code_name);
		
		oForm.val(code_name);
		oForm.focus();
		auto_tb.hide();
		
	},
	
	Rpad: function(str, fillstr, len){
		str = str + "";
		while(str.length < len){
			str = str+"0";
		}
		
		return str;
	}
};


// 아래는 scode0000.js의 충돌방지를 위해 임의로 넣음.
var ucode_sel = {};
function selectUpjong(arr){
	
}
