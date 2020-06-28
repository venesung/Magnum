<?php 
include_once $_SERVER['DOCUMENT_ROOT']."/common/include/dbConn.php";

	$pop = @$_POST["pop"];
	
	$phone = $_POST["phone1"]."-".$_POST["phone2"]."-".$_POST["phone3"];
	$mobile = $_POST["mobile1"]."-".$_POST["mobile2"]."-".$_POST["mobile3"]; 
	$email = $_POST['email1']."@".$_POST['email2'];

	
	//파일
	$name=$_FILES['file']['name'];
	$prefix=explode(".",$name);
	
	$new_file ="";
	$filesize = "";
	if($name != ""){
		$new_file=time().".".$prefix[1];
		$uploadfile = $uploaddir.$new_file ;
		$filesize=$_FILES['file']['size'];
		move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
	}
	
	$query = "INSERT INTO counsel(gubun, product, model, name, company, dept, phone, mobile, email, subject, content, regdate, lang, answerYN, filename, orifilename, filesize) VALUES('".$_POST["gubun"]."', '".$_POST["product"]."', '".@$_POST["model"]."','".htmlspecialchars($_POST["name"])."', '".htmlspecialchars($_POST["company"])."', '".htmlspecialchars($_POST["dept"])."', '".$phone."', '".$mobile."', '".$email."', '".htmlspecialchars($_POST["subject"])."' ,'".htmlspecialchars($_POST["content"])."', sysdate(), 'kor', 'N', '".$new_file."','".$name."','".$filesize."')";			
	$result = mysql_query($query);
	$count = mysql_affected_rows();
	

$_from = "sales@huvitz.com";
$_to = $email;
$subject = "[Huvitz] 문의접수완료";
$comment = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="author" content="" />
  <meta name="robots" content="all" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <title>Huvitz</title>
 </head>
<body>
	<table width="640" cellspacing="0" cellpadding="0" border="0">
		<tbody>
			<tr>
				<td><img src="http://mvint.huvitz.com/kor/img/mail/mtitle2.gif" alt="문의접수완료" border="0" usemap="#Map" /></td>
			</tr>
			<tr>
				<td style="border-bottom:1px solid #c8e2e9;padding:30px 24px 28px;font-size:16px;color:#333;font-family:dotum, 돋움;"><strong>고객님께서 문의하신 내용이 정상적으로 접수되었습니다.</strong></td>
			</tr>
			<tr>
				<td style="font-size:12px;font-weight:normal;color:#666;padding:34px 24px 0px;line-height:20px;font-family:dotum, 돋움;">
					문의하신 사항은 최대한 빠르게 답변을 드리도록 하겠습니다.<br />휴비츠를 이용하여 주셔서 감사합니다.
				</td>
			</tr>
			<tr>
				<td style="font-size:11px;color:#a6a6a6;padding:60px 40px 30px;line-height:20px;font-family:dotum, 돋움;">
					본 메일은 발신전용으로 회신하실 경우 답변이 되지 않습니다. 문의사항은 휴비츠 고객센터를 이용해 주십시오.<br /><strong style="font-weight:normal;color:#76b6c8;">휴비츠 고객상담 및 문의전화</strong> : 031-428-9100 / 월~금 : 09:00~18:00 (공휴일제외)
				</td>
			</tr>
			<tr>
				<td><img src="http://mvint.huvitz.com/kor/img/mail/mfooter.gif" alt="Huvitz Copyright 2008 Huvitz Corp. All rights reserved" /></td>
			</tr>
		</tbody>
	</table>
 
 
	<map name="Map" id="Map">
		<area shape="rect" coords="18,30,112,64" href="http://microscope.huvitz.com/" target="_blank" alt="Huvitz" />
	</map>
	
 
</body>
</html>
';


$subject = "=?UTF-8?B?".base64_encode($subject)."?=\n";

$lostid_head = "From: Huvitz <$_from>\n"; 
$lostid_head .= "X-Sender: <$_from>\n"; 
$lostid_head .= "X-Mailer: PHP\n"; 
$lostid_head .= "X-Priority: 1\n"; 
$lostid_head .= "Return-Path: <$_from>\n"; 

$lostid_head .= "MIME-Version:1.0 \n"; 
$lostid_head .= "Content-Type: text/html;\n \t charset=utf-8\n"; 


$result=mail($_to,$subject,$comment,$lostid_head);

	if($count == 1 && $pop == ""){
		header("Location: /oph_kor/support/counsel_end.html");	
	}else if($count == 1 && $pop == "Y"){
		echo "<script>alert('담당자가 확인 후 최대한 신속하게 답변 드리도록 하겠습니다. 감사합니다.');window.close();</script>";
	}


		
?>