<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${ pageContext.request.contextPath }/resources/review_board.css" rel="stylesheet" type="text/css">

</head>
<body>

<h3 id="title">Review</h3>
<div><a href="">사진리뷰만 보이게 하는 게시판으로 가는 링크</a></div><br>
<div class="top">
	<form method="post" name="search" action="">
		<table class="table_option">
			<tr>
				<td><select class="form-control" name="searchField" style="font-size:16px;">
						<option>전체</option>
						<option>제목</option>
						<option>작성자</option>
				</select></td>
				<td>
				  <input type="text" class="form-control"
					     placeholder="검색어 입력" name="searchText" maxlength="100">
				</td>
				<td>
				  <button type="submit" class="btn-search">검색</button>
				</td>
			</tr>

		</table>
	</form>
  <input class="btn" type="button" value="글쓰기"
		 onclick="location.href=#">
  
</div>
<table  class="table_list">
<colgroup>
<col width="60px">
<col width="*">
<col width="100px">
<col width="150px">
<col width="200px">
</colgroup>
<thead>
<tr >
  <th>번호</th>
  <th>제목</th>
  <th>좋아요</th>
  <th>조회수</th>
  <th>작성자</th>
  <th>작성일</th>
</tr>
</thead>

<tbody>
 <tr>
  <td>1</td>
  <td class="subject"><a href="#">난지 캠핑장 다녀온 썰 푼다</a></td>
  <td>1</td>
  <td>13</td>
  <td>캠핑조아</td>
  <td>2022.06.23</td>
 </tr>
 <tr>
  <td>2</td>
  <td class="subject"><a href="#">시흥 기가막힌 캠핑카 여행!!</a></td>
  <td>7</td>
  <td>13</td>
  <td>캠핑짱</td>
  <td>2022.06.23</td>
 </tr>
 <tr>
  <td>3</td>
  <td class="subject"><a href="#">충주호를 바라보는 최고의 캠핑장!</a></td>
  <td>3</td>
  <td>15</td>
  <td>캠핑</td>
  <td>2022.06.23</td>
 </tr>
 <!-- 게시글없는경우 -->
 <tr>
  <td colspan="6">현재 게시글이 없습니다.</td>
 </tr>
</tbody>
</table>
<div class="page_wrap">
   <div class="page_nation">
      <a class="first" href="#"></a>
      <a class="prev" href="#"></a>
      <a href="#" class="active">1</a>
      <a href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a href="#">6</a>
      <a href="#">7</a>
      <a href="#">8</a>
      <a href="#">9</a>
      <a href="#">10</a>
      <a class="next" href="#"></a>
      <a class="last" href="#"></a>
   </div>
	
</div>
</body>
</html>