function selectGender(value) {//성별 작성
    var gender = value;
    console.log('Selected Gender:', gender);
    // 이 부분에서 서버로 값을 전달하거나 변수에 저장하는 등의 작업을 수행할 수 있습니다.
}

function inputCheck(){

    if(form.name.value||form.name.value.trim().length==0){
        alert('이름을 입력하세요.');
        form.name.value="";
        form.name.focus();
        return false;
    }
    else if(form.id_value.value||form.id_value.value.trim().length==0){
        alert('아이디를 입력하세요.');
        form.id_value.value="";
        form.id_value.focus();
        return false;
    }
    else if(form.idDuplicaiton.value!="idCheck"){
        alert('아이디 중복체크를 해 주세요.');
        form.id_value.focus();
        return false;
    }
    else if(form.pw_value1.value||form.pw_value1.value.trim().length==0){
        alert('비밀번호를 입력하세요.');
        form.pw_value1.value="";
        form.pw_value1.focus();
        return false;
    }
    else if(form.pw_value1.value!=form.pw_value2.value){
        alert('비밀번호가 일치하지 않습니다.');
        form.pw_value1.value="";
        form.pw_value2.value="";
        form.pw_value1.focus();
        return false;
    }

    else if(form.email.value||form.email.value.trim().length==0){
        alert('이메일을 입력하세요.');
        form.email.value="";
        form.email.focus();
        return false;
    }
    else{
        alert(form.id.value+'('+form.name.value +") 님의 \n 회원가입이 완료되었습니다.");
        return true;
    }
}


function checkId(form) {
    form.action = "checkId.jsp";
    form.submit();
    return false;
}

var password = document.getElementById("pw_value1");
confirm_password = document.getElementById("pw_value2");

function validatePassword(){
  if(password.value != confirm_password.value) { // 만일 두 인풋 필드값이 같지 않을 경우
    // setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
    confirm_password.setCustomValidity("비밀번호 불일치"); 
  } 
  else { // 만일 두 인풋 필드값이 같을 경우
    // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
    // 따라서 빈값을 주어 submit 처리되게 한다
    confirm_password.setCustomValidity('비밀번호 일치'); 
  }
}
