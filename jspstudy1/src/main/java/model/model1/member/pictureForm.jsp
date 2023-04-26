<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jspstudy1/src/main/webapp/model1/member/pictureForm.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원사진 등록</title>
<link rel ="stylesheet" href="../../css/main.css">
</head>
<body>
<h3>사진업로드</h3>
<table>
<tr><td><img id="preview" src=""></td></tr>
<tr><td>
<form action="picture.jsp" method="post" enctype="multipart/form-data">
	<input type="file" name="picture" id="imageFile" accept="img/*">
	<input type="submit" value="사진등록">
</form>
</td></tr>
</table>
<script type="text/javascript">
//imagefile : <input type="file" id="imageFile"...태그 객체
let imagefile = document.querySelector('#imageFile');
//preview : <img id="preview" src="">태그 객체
let preview = document.querySelector('#preview');
//imagfile 을 새로운 파일 선택시 발생되는 이벤트 등록
imagefile.addEventListener('change',function(e) { //이벤트핸들러
	let get_file = e.target.files; //선택된 파일
	let reader = new FileReader(); //파일을 읽기 위한 스트림
	reader.onload = (function (Img) { //앞에on이 붙으면 이벤트임 //Img<= preview 저장
		return function(e) {
			Img.src = e.target.result; //선택된 파일이름
		}
	})(preview);
	//get_file : 선택된 파일이 존재하면 
	//get_file[0] : 첫번째 선택된 파일
	//readAsDataURL : 파일 읽기 => onload 이벤트 발생
	if(get_file){	reader.readAsDataURL(get_file[0]);	}
});
</script>
</body>
</html>