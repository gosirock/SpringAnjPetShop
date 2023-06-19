function clickMinus() {		/* 수량 파트 : (-) 클릭할 때 */
 	var tfQuantity = document.getElementById('quantity');		// 수량 텍스트 필드에 입력되어있는 값(문자).
    var currentValue = parseInt(tfQuantity.value);				// 현재 수량 텍스트 필드에 입력되어있는 값(정수).
    if (currentValue >= 1) {									// 현재 텍스트 필드의 숫자가 1 이상이면 (최소값이 0이 되도록 하기 위함)
      tfQuantity.value = currentValue - 1;						// 현재 텍스트 필드 값에서 1 뺀 값을 현재값으로 할당. 
    }
      calcPrice();	
      calcRewards();											
  }
  

  
  function updateQuantity(value) {	/* onchange - 입력필드 내용 변경 후 포커스 이동시 할 일. */
  	var tfQuantity = document.getElementById('quantity');		// 수량 텍스트 필드에 입력되어있는 값(문자).
    var currentValue = parseInt(value);							// 현재 필드에 입력된 값. 
    if (!isNaN(currentValue) && currentValue >= 1) {			// 현재 필드에 입력된 값이 공백이 아니면서 1 이상이면 
      tfQuantity.value = currentValue;							// 입력필드의 값을 현재 값으로 할당. 
    } else {													// 현재 필드의 값이 공란이거나 1 미만 값이 입력될 때 
      tfQuantity.value = 1;										// 입력필드의 현재 값을 1로 세팅해두기 
    }
  	  calcPrice();
  	  calcRewards();
  }
  
 window.addEventListener('scroll', function() {
	 var btn = document.querySelector('fixedPurchaseBtn');		// class이름이 fixedPurchaseBtn인 요소를 선택하여 btn에 할당. 
	 var topDistance = btn.getBoundingClientRec().top;		// 버튼의 상단 경계가 뷰포트(보이는 영역)의 상단 경계로부터 얼마나 떨어져 있는지 
//	 var windHeight = window.innerHeight;						// 현재 브라우저 창의 뷰포트 높이(픽셀단위로 반환)
//	 var btnHeight = button.offsetHeight;						// 버튼의 높이를 픽셀 단위로 반환 
//	 var startFixed = 1200; 										// 버튼이 고정되어서 스크롤과 같이 움직이기 시작하는 시점 
	 
//	 if (topDistance + btnHeight <= windHeight - startFixed) {
	 if (topDistance <= 100) {
		 //btn.classList.add('fixed');
		 btn.style.bottom = '20px'
	 } else {
		 //button.classList.remove('fixed');
		 btn.style.bottom = '-100px'
	 }
	 
 });
  
  
  
  
  
  
  
  
  
  
  
  