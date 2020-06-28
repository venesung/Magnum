var userAgent = navigator.userAgent.toLowerCase();

function setViewport() {

 var viewportContent = '';
 if (userAgent.indexOf('shv-e120')>-1 && userAgent.indexOf('android 2.3.6')>-1) { //갤럭시s2 hd 모델명 및 버전을 소문자로 기재
	viewportContent = "width=device-width, user-scalable=yes, target-densitydpi=medium-dpi, initial-scale=0.5, maximum-scale=0.5, minimum-scale=0.5"; 

 } else if (userAgent.indexOf('lg-f100s')>-1 && userAgent.indexOf('android 2.3.3')>-1) { //옵티머스뷰 모델명 및 버전을 소문자로 기재
	viewportContent = "width=device-width, user-scalable=yes, target-densitydpi=medium-dpi, initial-scale=0.5, maximum-scale=0.5, minimum-scale=0.5"; 

 } else if (userAgent.indexOf('shw-m110s')>-1 && userAgent.indexOf('android 2.3.3')>-1) { //galS1 모델명 및 버전을 소문자로 기재
  viewportContent = "width=device-width, user-scalable=yes, target-densitydpi=medium-dpi, initial-scale=0.5, maximum-scale=0.5, minimum-scale=0.5"; 

 } else if (window.devicePixelRatio == 1.5 && userAgent.indexOf('android 2.3.3')>-1) { //galS1
  viewportContent = "width=device-width, user-scalable=yes, target-densitydpi=medium-dpi, initial-scale=0.5, maximum-scale=0.5, minimum-scale=0.5"; //galS1

 } else if (window.devicePixelRatio == 1.5 && userAgent.indexOf('android 2.3.6')>-1) { //galS1 
  viewportContent = "width=device-width, user-scalable=yes, target-densitydpi=medium-dpi, initial-scale=0.45, maximum-scale=0.45, minimum-scale=0.45"; //galS1

 } else if (window.devicePixelRatio == 1.5 && userAgent.indexOf('android 4.0.4')>-1) { //galS2 4.0.4
  viewportContent = "width=device-width, user-scalable=yes, target-densitydpi=device-dpi, initial-scale=0.3, width=640, maximum-scale=0.3, minimum-scale=0.3"; //galS2

 } else if (window.devicePixelRatio == 1.5 && userAgent.indexOf('android 4.1.2')>-1) { //galS2 4.1.2 
  viewportContent = "width=device-width, user-scalable=yes, target-densitydpi=device-dpi, initial-scale=0.3, width=640, maximum-scale=0.3, minimum-scale=0.3"; //galS2
/*
} else if (userAgent.indexOf('lg-f240')>-1 && userAgent.indexOf('android 4.1.2')>-1) { //옵티머스 g 프로
  viewportContent = "width=device-width, user-scalable=yes, target-densitydpi=high-dpi, initial-scale=0.5, maximum-scale=0.5, minimum-scale=0.5"; 
 */

 } else if (userAgent.indexOf('shv-e300')>-1 && userAgent.indexOf('android 4.2.2')>-1) { //갤럭시s4
  viewportContent = "width=device-width, user-scalable=yes, target-densitydpi=high-dpi, initial-scale=0.64, maximum-scale=0.64, minimum-scale=0.64"; 


 } else if (userAgent.indexOf('iphone')>-1) {
  viewportContent = 'user-scalable=yes, initial-scale=0.5, maximum-scale=0.5, minimum-scale=0.5, width=640, target-densitydpi=device-dpi';//iphone

 } else {
  viewportContent = 'user-scalable=yes, initial-scale=0.5, maximum-scale=0.5, minimum-scale=0.5, target-densitydpi=device-dpi';
 }  

 document.write('<meta name="viewport" content="' + viewportContent + '">'); 
}
setViewport(); // 뷰포트 세팅