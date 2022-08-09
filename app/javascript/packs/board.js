let $ = document
let modalElem = $.getElementById("todo_form")
let addBtn = $.getElementById("add_btn")
let addTodoBtn = $.getElementById("todo_submit")
let inputElem = $.getElementById("todo_input")
let statusElem = $.getElementById("no_status")
let statusdrop = $.querySelectorAll(".status")
let closeModalBtn = $.querySelector(".btn")
let overlay = $.getElementById("overlay")

addBtn.addEventListener("click",addBtnHandler)
function addBtnHandler () {
    modalElem.classList.add("active")
    overlay.classList.add("active")
    inputElem.focus()
}

closeModalBtn.addEventListener("click",closeModalHandler)
function closeModalHandler(){
    modalElem.classList.remove("active")
    overlay.classList.remove("active")
    inputElem.value = ""
}

// window.onkeydown = function (e){
//     if (e.keyCode === 27) {
//         closeModalHandler()
//     }
// }

let idNumber = 0;
function createElem(){
    if(inputElem.value){
        idNumber++
        let newDiv = $.createElement("div")
        newDiv.className = "todo" 
        newDiv.innerHTML = "Task";
        newDiv.setAttribute("draggable", "true")
        newDiv.setAttribute("id", idNumber)
        newDiv.innerHTML = inputElem.value


        let newSpan = $.createElement("span")
        newSpan.className = "close"
        newSpan.innerHTML = "&times;"
        newDiv.append(newSpan)
        statusElem.append(newDiv)
				modalElem.classList.remove("active")
        overlay.classList.remove("active")
		
				newSpan.addEventListener("click",removeHandler)
				function removeHandler (e){
					e.target.parentElement.remove()
				}
    }
}


addTodoBtn.addEventListener("click",addTodoElemHandler)
function addTodoElemHandler (){
    createElem()
        
    $.querySelectorAll('.todo').forEach(function(todo){
        todo.addEventListener("dragstart",dragStartHandler)
        todo.addEventListener('dragend', dragEndHandler);
    })
}

inputElem.addEventListener("keydown",keydownHandler)
function keydownHandler(e) {
    if (e.keyCode === 13) {
        createElem()
        inputElem.value = ""
				inputElem.blur()

        $.querySelectorAll('.todo').forEach(function(todo){
            todo.addEventListener("dragstart",dragStartHandler)
            todo.addEventListener('dragend', dragEndHandler);
        })
    }
}

function dragStartHandler(e){
    console.log("started dragging");
    console.log(e.currentTarget.classList);
    e.currentTarget.classList.add('dragging');
    e.dataTransfer.setData("elemId",e.target.id);

}

function dragEndHandler (e){
    e.currentTarget.classList.remove('dragging');
}

statusdrop.forEach(function (status){
    console.log(status);
    status.addEventListener('dragenter', dragEnterHandler);
    status.addEventListener('dragleave', dragLeaveHandler);
    status.addEventListener('dragover', dragOverHandler);
    status.addEventListener('drop', dropHandler);
	
		function dragEnterHandler (e) {
            // console.log(e.target.innerText);

    e.currentTarget.classList.add('drop');
		};

		function dragLeaveHandler (e) {
            // console.log(e.target);
				e.currentTarget.classList.remove('drop');
		};

		function dragOverHandler(e){
            // console.log(e.target);
				e.preventDefault();
		}
	
    function dropHandler(e){
        console.log(e.dataTransfer);
        console.log( e.dataTransfer.getData("id"));
        e.currentTarget.classList.remove('drop');
        let targetId = e.dataTransfer.getData("elemId");
        let targetEl = $.getElementById(targetId);
        status.append(targetEl);
        // document.getElementById(status.id).append("value added")
    }
})