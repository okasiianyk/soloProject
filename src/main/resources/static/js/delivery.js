function ready() {
        var b = "wrapContainer";
      //  document.getElementById(b).onmouseover = function() {mouselog(event)};
      //  document.getElementById(b).onmousemove = function() {mouselog(event)};


        var cirMain = document.getElementById("cirMain");
        
       setTimeout(() => cirMain.classList.add('use'), 0000);
       setTimeout(() => cirMain.classList.add('use2'), 1100);
   	   cirMain.classList.remove('use');
}

document.addEventListener("DOMContentLoaded", ready);

var deg=[290, -15, 25, 60, -70, -20, 30, 60];


function aClick(e){
	var cirMain = document.getElementById("cirMain");
	cirMain.classList.remove('use2');  
	cirMain.classList.remove('use');
	let temp=e.closest(".pointCircle");
	let inputAll=temp.getElementsByClassName("inpTxt")[0];
	let tSpan=temp.getElementsByTagName("span")[0];
	inputAll.style.display="block";
	inputAll.getElementsByTagName("input")[0].value = tSpan.innerHTML;
	
	temp.style.transform = 'rotate(' + 0 + 'deg)';
	tSpan.style.display="none";
	
}

function btnClick(e){
	var cirMain = document.getElementById("cirMain");
	cirMain.classList.add('use2');  
	let temp=e.closest(".pointCircle");
	let inputAll=temp.getElementsByClassName("inpTxt")[0];
	let tSpan=temp.getElementsByTagName("span")[0];
	tSpan.style.display="block";
	inputAll.style.display="none";
	let arr=document.getElementsByClassName("pointCircle");
	for(let i=0; i<arr.length; i++){
		arr[i].style.transform = 'rotate(' + deg[i] + 'deg)';
	}
	tSpan.innerHTML = inputAll.getElementsByTagName("input")[0].value;
}

