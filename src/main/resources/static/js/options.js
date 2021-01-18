function onNav() {
	let boxOne = document.getElementsByClassName('nav')[0];
 	boxOne.classList.add('nav_anim2');
 	boxOne.classList.remove('nav_anim');
}
function outNav() {
	let boxOne = document.getElementsByClassName('nav')[0];
 	boxOne.classList.remove('nav_anim2');
 	boxOne.classList.add('nav_anim');
 	
}