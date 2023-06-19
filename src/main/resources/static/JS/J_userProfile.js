	
	const regExpAddress = /^[가-힣0-9]*$/
	const regExpName = /^[가-힣]*$/		
	const regExpTel = /^\d{3}-\d{3,4}-\d{4}$/
	const regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
	const regExpPw	= asswdCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);		

 function checkjoin(event) {
	 event.preventDefault();
	
  const form = document.join;
  const name = form.name.value;
  const tel = form.tel.value;
  const email = form.email.value;
  const pw = form.pfUserpw.value;
  const pw2 = form.pfUserpw1.value;
  const postcode = form.postcode.value;
  const address = form.address.value;
  const detailaddress = form.detailaddress.value;



  // regExpPw 유효성 검사

  if (!pw2) {
    alert("비밀번호를 확인해 주세요.");
    form.passwd2.select();
    return;
  }

  if (pw !== pw2) {
    alert("동일한 비밀번호를 입력해 주세요.");
    form.passwd2.select();
    return;
  }

 

  // regExpName 유효성 검사



  // regExpTel 유효성 검사


  // regExpEmail 유효성 검사

  if (!address) {
    alert("주소를 입력해 주세요.");
    form.address.select();
    return;
  }

  if (!detailaddress) {
    alert("상세주소를 입력해 주세요.");
    form.detailaddress.select();
    return;
  }

alert("회원가입이 완료 되었습니다.")
	form.submit()

}





	// 텍스트박스 클릭 이벤트
	$(document).ready(function() {
    	$(".back").focus(function() {
     	 $(this).css("background-color", "#E3EEFD");
     	 $(this).css("font-size", "10px");
    });
    	$("#id").focus(function() {
        	 $("#idwrite").text("ID");
       });
    	$("#pw1").focus(function() {
       		 $("#pwwrite").text("비밀번호");
       		  $("#pwCheck")
    .text("영문,숫자,특수문자를 포함한 8글자 이상")
    .css({
      "font-size": "14px",
      "line-height": "1.2",
      "margin-top": "5px"
    });
      });
    	$("#pw2").focus(function() {
          	 $("#pw2write").text("비밀번호 확인");
         });
    	$("#name").focus(function() {
          	 $("#namewrite").text("이 름");
         });
    	$("#tel").focus(function() {
         	 $("#telwrite").text("전화번호");
         	 $("#tel").attr("placeholder", "ex) 010-xxxx-xxxx");
        });
    	$("#email").focus(function() {
          	 $("#emailwrite").text("이메일");
          	 $("#email").attr("placeholder", "ex) xxxx@gmail.com");
         });
    	$("#address").focus(function() {
          	 $("#addresswrite").text("주 소");
         });
    $(".back").blur(function() {
      $(this).css("background-color", ""); // 포커스가 해제되면 원래 배경색으로
    });
  });
	
	
	// 비밀번호 확인 키업 이벤트
	
	$("#pw1").keyup(function(){
		let pwpw = $(this).val();
		if(pwpw==""){
			$("#pwCheck").text("비밀번호를 입력하세요").css("color","black");	
		}else if(regExpPw.test(pwpw)){
			$("#pwCheck").text("✔ 영문,숫자,특수문자를 포함한 8글자 이상").css("color","blue");	
		}else{
			$("#pwCheck").text("❌ 영문,숫자,특수문자를 포함한 8글자 이상").css("color","red");	
		}
	});
	$("#pw2").keyup(function(){
		let pw1 = $("#pw1").val();
		let pw2 = $("#pw2").val();
		if(pw2==""){
			
			$("#pwCheckConfirm").text("비밀번호를 입력하세요.").css("color","black");	
		}else if(pw1==pw2){
			$("#pwCheckConfirm").text("✔ 같은 비밀번호 입니다.").css("color","blue");	
		}else{
			$("#pwCheckConfirm").text("❌ 다른 비밀번호 입니다.").css("color","red");	
		}
	});
	
	