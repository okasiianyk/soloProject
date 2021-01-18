function showCont(x){
	let element1=x.getElementsByClassName('description')[0];
	element1.hidden=false;

	let element2=x.getElementsByClassName('pastries')[0];
	element2.hidden=true;
}
function showImg(x){
	let element1=x.getElementsByClassName('description')[0];
	element1.hidden=true;

	let element2=x.getElementsByClassName('pastries')[0];
	element2.hidden=false;
}