
let current = 1;

const b1 = document.querySelector(".board1");
const b2 = document.querySelector(".board2");

function swapBoards() {
    if (current === 1) {
        b1.classList.remove("maxi");
        b1.classList.add("mini");

        b2.classList.remove("mini");
        b2.classList.add("maxi");

        current = 2;
    } else {
        b2.classList.remove("maxi");
        b2.classList.add("mini");

        b1.classList.remove("mini");
        b1.classList.add("maxi");

        current = 1;
    }
}

/* clic UNIQUEMENT sur le board en miniature */
b1.addEventListener("click", e => {
    if (current === 2 && b1.classList.contains("mini")) {
        e.stopPropagation();
        swapBoards();
    }
});

b2.addEventListener("click", e => {
    if (current === 1 && b2.classList.contains("mini")) {
        e.stopPropagation();
        swapBoards();
    }
});
