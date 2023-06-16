// 스크롤 위치를 확인하여 Top 버튼을 표시 또는 숨김
window.onscroll = function() { scrollFunction(); };

function scrollFunction() {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		document.querySelector(".top-button").style.display = "block";
	} else {
		document.querySelector(".top-button").style.display = "none";
	}
}

// 클릭 시 페이지 맨 위로 스크롤
function scrollToTop() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}