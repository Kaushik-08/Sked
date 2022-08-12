
let $ = document
let modalElem = $.getElementById("todo_form")
let addBtn = $.getElementById("add_btn")
let addTodoBtn = $.getElementById("todo_submit")
let inputElem = $.getElementById("todo_input")
let statusElem = $.getElementById("no_status")
let statusdrop = $.querySelectorAll(".status")
let closeModalBtn = $.querySelector(".btn")
let overlay = $.getElementById("overlay")

console.log($.getElementById("add_btn"))
console.log($.querySelectorAll('.todo'))

function addBtnHandler() {
    modalElem.classList.add("active")
    overlay.classList.add("active")
    inputElem.focus()
}
addBtn.addEventListener("click", addBtnHandler)

function closeModalHandler() {
    modalElem.classList.remove("active")
    overlay.classList.remove("active")
    inputElem.value = ""
}
closeModalBtn.addEventListener("click", closeModalHandler)


// window.onkeydown = function (e){
//     if (e.keyCode === 27) {
//         closeModalHandler()
//     }
// }

let idNumber = 0;
function createElem() {

    console.log("entered createElem")

    if (inputElem.value) {
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

        newSpan.addEventListener("click", removeHandler)
    }

    console.log("exiting createElem")

}

$.querySelectorAll('span.close').forEach(item => {
    item.addEventListener('click', removeHandler);
})

function removeHandler(e) {
    e.target.parentElement.remove()
}

function addTodoElemHandler() {
    // e.preventDefault();
    createElem()

    const todos = $.querySelectorAll('.todo')
    console.log(todos)
    todos.forEach((todo) => {
        todo.addEventListener("dragstart", dragStartHandler)
        todo.addEventListener('dragend', dragEndHandler);
    })
}
addTodoBtn.addEventListener("click", addTodoElemHandler)


const todos = $.querySelectorAll('.todo');
todos.forEach((todo) => {
    console.log(todo)
    todo.addEventListener("dragstart", dragStartHandler)
    todo.addEventListener('dragend', dragEndHandler);
})

function dragStartHandler(e) {
    e.dataTransfer.setData("elemId", e.target.id);
}

function dragEndHandler(e) {
    e.currentTarget.classList.remove('dragging');
}

statusdrop.forEach(function (status) {
    status.addEventListener('dragenter', dragEnterHandler);
    status.addEventListener('dragleave', dragLeaveHandler);
    status.addEventListener('dragover', dragOverHandler);
    status.addEventListener('drop', dropHandler);
});


function dragEnterHandler(e) {
    e.currentTarget.classList.add('drop');
};

function dragLeaveHandler(e) {
    e.currentTarget.classList.remove('drop');
};

function dragOverHandler(e) {
    e.preventDefault();
}

function dropHandler(e) {
    e.currentTarget.classList.remove('drop');
    let targetId = e.dataTransfer.getData("elemId");
    let targetEl = $.getElementById(targetId);
    e.target.append(targetEl);
}