/*========================================
js_rolling.js

#���ܼ���
<div><img /><img /></div>
��� ���� ��� div���� img�� ��,������,�Ʒ�,�������� �Ѹ� ��Ų��.




# ����
<script type="text/javascript" charset='utf-8' src="js_rolling.js"></script> 
//JS��ũ��Ʈ �ε�

<div id='div1'><img /><img /><img /><img /><img /></div>
//ó�� ������ div�� �ʺ�� ���̴� �� �����ֱ� �ٶ��ϴ�.
<div>
	<div>1<img />etc</div>
	<div>2</div>
	<div>3</div>
	<div>4</div>
</div>
�̷��� ������ ��� ������ ��,�Ʒ��θ� �����մϴ�


var roll = new js_rolling('rolling');
or
var roll = new js_rolling(document.getElementById('rolling'));
// id�̸��� ������, ���� ����� �����ؼ� �Ѹ� Ŭ������ ��ü�� ����

roll.set_direction(4); // ������ �ٲ�. 1: top, 2:right, 3:bottom 4:left �׿��� ��� ���۾���
roll.move_gap = 1;	//�����̴� �ȼ�����
roll.time_dealy = 10; //�����̴� Ÿ�ӵ�����
roll.time_dealy_pause = 5000;//�ϳ��� ����� ���� ������ �� ���ߴ� �ð�, 0 �̸� ���� ����
roll.start(); //�Ѹ� ����

roll.move_up(); //���� �ѹ� �Ѹ� (������ top,botton�϶��� ����)
roll.move_right(); //���������� �ѹ� �Ѹ�(������ right,left�϶��� ����)
roll.move_down(); //�Ʒ��� �ѹ� �Ѹ�(������ top,botton�϶��� ����)
roll.move_left(); //�������� �ѹ� �Ѹ�(������ right,left�϶��� ����)

roll.direction = {�������} //���� ���� : �ʱ�ȭ�� ��Ű�� �ʰ� ���⸸ �ٲٴ� ������ left:right , top:bottom ���θ� ¦�� �̷� ����Ѵ�
roll.mouseover_pause = true , false //true�� ���콺���� �� ����(�⺻��), false �� ���콺���������� ��� �Ѹ���

#����
������ top,bottom�� ��� ���� �±״� block���(div)��
������ left,right�� ��� �����±״� inline���(a,span)���� ���ּ���.
FF���� top,bottom�� ��� inline����� ��� offsetHeight�� �߸��˾ƿɴϴ�.
�̹����� �� �κп��� ���ڱ� ��Ÿ���� ������ ���� ��� ���� �̹������� ���� 2��� �÷��ּ���.(1,2,3 �̸� 1,2,3,1,2,3 ó�� ���̵���)


#�������
���� "���뿩�ڴ� ���ڴ�"�� ��Ÿ���ž��մϴ�.

���糯 : 2007-06-07
������ : 2007-08-11
������ : 2008-08-08
������ : mins01,mins,���뿩��
Ȩ������ : http://www.mins01.com 
NateOn&MSN : mins01(at)lycos.co.kr
========================================*/
var js_rolling = function(box){
	// �ð������� ms�� 1000�� 1��
	if(box.nodeType==1){
		this.box = box;
	}else{
		this.box = document.getElementById(box);
	}
	this.is_rolling = false;
	this.mouseover_pause = true;
	this.direction = 1; //1:top, 2:right, 3:bottom, 4:left (�ð����) // 1���� 4���� ��
	this.children =	null;
	this.move_gap = 1;	//�����̴� �ȼ�����
	this.time_dealy = 40; //10; //�����̴� Ÿ�ӵ�����
	this.time_dealy_pause = 3000; //2000;//�ϳ��� ����� ���� ������ �� ���ߴ� �ð�, 0 �̸� ���� ����
	this.time_timer=null;
	this.time_timer_pause=null;
	this.mouseover=false;
	this.init();
	this.set_direction(this.direction);
	this.start();
}
js_rolling.prototype.init = function(){
	this.box.style.position='relative';
	this.box.style.overflow='hidden';
	var children = this.box.childNodes;
	for(var i=(children.length-1);0<=i;i--){
		if(children[i].nodeType==1){
			children[i].style.position='relative';
		}else{
			this.box.removeChild(children[i]);
		}
	}
	var thisC=this;

	this.box.onmouseover=function(){
		if(!thisC.mouseover_pause){	return;	}
		thisC.mouseover=true;
		if(!thisC.time_timer_pause){
			thisC.pause();
		}
	}
	this.box.onmouseout=function(){
		if(!thisC.mouseover_pause){return;}
		thisC.mouseover=false;
		if(!thisC.time_timer_pause){
			thisC.resume();
		}
	}	
}
js_rolling.prototype.set_direction = function(direction){
	this.direction=direction;
	if(this.direction==2 ||this.direction==4){
		this.box.style.whiteSpace='nowrap';
	}else{
		this.box.style.whiteSpace='normal';
	}
	var children = this.box.childNodes;
	for(var i=(children.length-1);0<=i;i--){
			if(this.direction==1){
				children[i].style.display='block';
			}else if(this.direction==2){
				children[i].style.textlign='right';
				children[i].style.display='inline';
			}else if(this.direction==3){
				children[i].style.display='block';
			}else if(this.direction==4){
				children[i].style.display='inline';
			}
	}
	this.init_element_children();	
}
js_rolling.prototype.init_element_children = function(){
	var children = this.box.childNodes;
	this.children = children;
	for(var i=(children.length-1);0<=i;i--){
			if(this.direction==1){
				children[i].style.top='0px';
			}else if(this.direction==2){
				children[i].style.left='-'+this.box.firstChild.offsetWidth+'px';
			}else if(this.direction==3){
				children[i].style.top='-'+this.box.firstChild.offsetHeight+'px';
			}else if(this.direction==4){
				children[i].style.left='0px';
			}
	}
}
js_rolling.prototype.act_move_up = function(){
	for(var i = 0,m=this.children.length;i<m;i++){
		var child = this.children[i];
		child.style.top=(parseInt(child.style.top)-this.move_gap)+'px';
	}
	if((this.children[0].offsetHeight+parseInt(this.children[0].style.top))<=0){
		this.box.appendChild(this.children[0]);
		this.init_element_children();
		this.pause_act();		
	}
}
js_rolling.prototype.move_up = function(){
	if(this.direction!=1&&this.direction!=3){return false;}
	this.box.appendChild(this.children[0]);
	this.init_element_children();
	this.pause_act();	
}
js_rolling.prototype.act_move_down = function(){
	for(var i = 0,m=this.children.length;i<m;i++){
		var child = this.children[i];
		child.style.top=(parseInt(child.style.top)+this.move_gap)+'px';
	}
	if(parseInt(this.children[0].style.top)>=0){
		this.box.insertBefore(this.box.lastChild,this.box.firstChild);
		this.init_element_children();
		this.pause_act();	
	}
}
js_rolling.prototype.move_down = function(){
	if(this.direction!=1&&this.direction!=3){return false;}	
	this.box.insertBefore(this.box.lastChild,this.box.firstChild);
	this.init_element_children();
	this.pause_act();
}
js_rolling.prototype.act_move_left = function(){
	for(var i = 0,m=this.children.length;i<m;i++){
		var child = this.children[i];
		child.style.left=(parseInt(child.style.left)-this.move_gap)+'px';
	}
	if((this.children[0].offsetWidth+parseInt(this.children[0].style.left))<=0){
		this.box.appendChild(this.box.firstChild);
		this.init_element_children();
		this.pause_act();		
	}
}
js_rolling.prototype.move_left = function(){
	if(this.direction!=2&&this.direction!=4){return false;}		
	this.box.appendChild(this.box.firstChild);
	this.init_element_children();
	this.pause_act();		
}
js_rolling.prototype.act_move_right = function(){
	for(var i = 0,m=this.children.length;i<m;i++){
		var child = this.children[i];
		child.style.left=(parseInt(child.style.left)+this.move_gap)+'px';
	}
	
	if(parseInt(this.box.lastChild.style.left)>=0){
		this.box.insertBefore(this.box.lastChild,this.box.firstChild);
		this.init_element_children();
		this.pause_act();		
	}
}
js_rolling.prototype.move_right = function(){
	if(this.direction!=2&&this.direction!=4){return false;}			
	this.box.insertBefore(this.box.lastChild,this.box.firstChild);
	this.init_element_children();
	this.pause_act();
}
js_rolling.prototype.start = function(){ //�Ѹ� ����
	var thisC = this;
	this.stop();
	this.is_rolling = true;
	var act = function(){
		if(thisC.is_rolling){
			if(thisC.direction==1){thisC.act_move_up();}
			else if(thisC.direction==2){thisC.act_move_right();}
			else if(thisC.direction==3){thisC.act_move_down();}
			else if(thisC.direction==4){thisC.act_move_left();}
		}
	}
	this.time_timer = setInterval(act,this.time_dealy);
}
js_rolling.prototype.pause_act = function(){ //�Ͻ� ����
	if(this.time_dealy_pause){
		var thisC = this;
		var act = function(){thisC.resume();thisC.time_timer_pause=null;}
		if(this.time_timer_pause){clearTimeout(this.time_timer_pause);}
		this.time_timer_pause = setTimeout(act,this.time_dealy_pause);
		this.pause();
	}
}
js_rolling.prototype.pause = function(){ //�Ͻ� ����
	this.is_rolling = false;
}
js_rolling.prototype.resume = function(){ //�Ͻ� ���� ����
	if(!this.mouseover){
		this.is_rolling = true;
	}
}
js_rolling.prototype.stop = function(){ //�Ѹ��� ����
	this.is_rolling = false;
	if(!this.time_timer){
		clearInterval(this.time_timer);
	}
	this.time_timer = null
}