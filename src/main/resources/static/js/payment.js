let i=0;	

window.onload = setInterval(() => {
	let element=document.createElement('div');
	element.classList="";
	element.classList.add("mystyle");
	element.style.position = "absolute";
	element.style.top = i*40 +"px";
	element.style.left =  i*40 +"px";
	element.style.zIndex = -10*i;
	i++;
	element.classList.add("mystyle"+i);
	let md = document.getElementById('container');
 	
 	
 	md.appendChild(element);
 	
 	if (i>3) {
 		i=0;
 		md.innerHTML = "";
 	}
	console.log(i);		
	
 	
 }, 1000);
 
 
/*window.addEventListener('scroll', function() {
  document.getElementById('container2').innerHTML = pageYOffset + 'px';
});*/