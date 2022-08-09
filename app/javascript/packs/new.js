let popup_div = document.getElementById('popup-div');
let close_btn = document.getElementById('close-btn');
let open_btn = document.getElementById('create-btn');
open_btn.addEventListener('click', open_div);
close_btn.addEventListener('click', close_div);
function open_div(){
    popup_div.style.display = 'block';
}
function close_div(){
    popup_div.style.display = 'none';
}