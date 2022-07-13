<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">

#main_box{
	width	:	100%;
	background-color: #14870c;

}


#signup{
	width:  500px;
	height: 720px;
	margin: auto;
	/* margin-top: 50px; */
 	border-radius: 10px 10px 10px 10px;
 	/* border:  solid red ; */
 	background-color: white;
	
}
#imgbok{
	width: 100%;
	height: 150px;
	/* border: solid green; */
	display: inline-block;
	margin-right: 19px;
	
} 

#imgbok>img{
 width: 100%;
 border-radius: 10px 10px 0px 0px;



}

h1{
	 margin-left: 80px;
	/*  border: 1px solid blue; */
}


#login_form{
	
   display: inline-block;
   text-align: center;
}



.table_login{
	display: inline-block;
}

#mem_email{
	
	width: 350px;
	border: none;
	border-bottom: 1px solid gray;
	margin-left: 80px; 
	margin-top: 20px;
}
.mem_signup_form{

	width: 350px;
	border: none;
	border-bottom: 1px solid gray;
	margin-left: 80px;
 	margin-top: 45px; 
 	
}




#btn_signup{

	display: inline-block;
	margin-top: 60px;
	margin-left: 90px;

}
#btn_cancel{


	display: inline-block;
	margin-top: 60px;
}






</style>
<script type="text/javascript">

var regular_email =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;


$(function(){
	
	
	$("#mem_email").keyup(function(event){
		
		var mem_email =$(this).val();
		
		if(regular_email.test(mem_email)==false){
			
			$("#mem_email").html("영문자, 숫자 3~15자리까지 입력 가능합니다.")
		    .css("color","#ffcccc");

			//가입하기 버튼 비활성화
			$("#btn_register").attr("disabled",true);
			
			
			return;
						
			
		}
		
		
	})
	
	
});

/* 체크  */
function send(f) {
		
		//입력값 체크(이름/비번/우편번호/주소)
		var mem_email 	  	= f.mem_name.value.trim();
		var mem_pwd	  		= f.m_pwd.value.trim();
		var mem_nickname 	= f.mem_nickname.value.trim();
		var mem_birth	  	= f.mem_birth.value.trim();
		var mem_pic      	= f.mem_pic.value;
		var mem_profile 	= f.mem_profile.value.trim();
		if(m_name == ''){
			alert('이름을 입력하세요');
			f.m_name.value='';
			f.m_name.focus();
			return;
		}
		
		
		if(m_pwd == ''){
			alert('비밀번호를 입력하세요');
			f.m_pwd.value='';
			f.m_pwd.focus();
			return;
		}
		
		
		if(m_zipcode == ''){
			alert('우편번호를 입력하세요');
			f.m_zipcode.value='';
			f.m_zipcode.focus();
			return;
		}
		
		
		if(m_addr == ''){
			alert('주소를 입력하세요');
			f.m_addr.value='';
			f.m_addr.focus();
			return;
		}
		
		
		f.action = "insert.do"; // MemberInsertAction
		f.submit(); 
	}
	






</script>



</head>
<body>
<div id="main_box">
	<!-- <form enctype="multipart/form-data" id="ajaxForm" method="post">
    <input type="file" id="ajaxFile" style="display:none;"  onChange="ajaxFileChange();" >파일이 체인지 되었을시 
	</form> -->
	
	<div id="signup" >
		<div  id="imgbok" >
			<img alt="이미지없음" src="${ pageContext.request.contextPath }/resources/img/camp.png">
		</div>
		
		<form>
			<h1>signup</h1>
		<div id="signup_form" >
			<table class="table_login">
				<tr>
					
					<td><input type="text" id="mem_email" name="mem_email" 
						 required="required" placeholder="  @를 포함한 email주소를 입력하세요."/></td>
					
				</tr>
				
				<tr>
				
					<td><input type="text" class="mem_signup_form"    id="mem_pwd" name="mem_pwd" 
						required="required" placeholder=" password "/></td>
					
				</tr>
				
				<tr>
				
					<td><input type="text" class="mem_signup_form"   id="mem_nickname" name="mem_nickname" 
							required="required" placeholder=" nickname "/></td>
					
				</tr>
				
				<tr>
				
					<td><input type="text" class="mem_signup_form"    id="mem_birth" name="mem_birth" 
							required="required" placeholder="Social Security Number"/></td>
					
				</tr>
				
				<tr>
					
					<td><input type="file"  class="mem_signup_form"  id="mem_pic" name="mem_pic" value="pic"></td>
					
				</tr>
				
				
				
				<tr>
					
					<td><input type="text"  class="mem_signup_form"   id="mem_profile" name="mem_profile" 
							required="required" placeholder="myprofile"/></td>
					
				</tr>
				
				
				
				
			    <tr>
			    	<td ><input  class="btn btn-success "  type="button" id="btn_signup" value="signup" 
			    				disabled="disabled"	onclick="send(this.form);">
			    	<input  class="btn btn-primary "  type="button" id="btn_cancel" value="cancel"></td>
			    </tr>
			
			</table>
		</div>
	  </form>
	</div>
</div>
</body>
</html>