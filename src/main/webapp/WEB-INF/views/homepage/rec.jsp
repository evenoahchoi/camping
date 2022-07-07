<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/rec.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/main.css">
	<%-- <jsp:include page="nav.jsp"></jsp:include>
	<jsp:include page="main.jsp"></jsp:include> --%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="slidebox">
	<input type="radio" name="slide" id="slide1" checked>
	<input type="radio" name="slide" id="slide2" >
	<input type="radio" name="slide" id="slide3">
	<input type="radio" name="slide" id="slide4">
	<ul class="slidelist">
	  <li class="slideitem">
		<div>
			<label for="slide4" class="left"></label>
			<label for="slide2" class="right"></label>
			<a><img src="${ pageContext.request.contextPath }/resources/images/slideimg04.jpg"></a>
		</div>
	  </li>
	  <li class="slideitem">
		<div>
			<label for="slide1" class="left"></label>
			<label for="slide3" class="right"></label>
			<a><img src="${ pageContext.request.contextPath }/resources/images/slideimg02.jpg"></a>
		</div>
	  </li>
	  <li class="slideitem">
		<div>
			<label for="slide2" class="left"></label>
			<label for="slide4" class="right"></label>
			<a><img src="${ pageContext.request.contextPath }/resources/images/slideimg03.jpg"></a>
		</div>
	  </li>
	  <li class="slideitem">
		<div>
			<label for="slide3" class="left"></label>
			<label for="slide1" class="right"></label>
			<a><img src="${ pageContext.request.contextPath }/resources/images/slideimg01.jpg"></a>
		</div>
	  </li>
	</ul>
	
	
</div>


</body>
</html>