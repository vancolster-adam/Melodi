    /* =========================================================
       HEADER SHRINK
    ========================================================= */
    const main = document.querySelector('.title-main');
    const sub = document.querySelector('.title-sub');
    const author = document.querySelector('.title-author');
    const pageHeader = document.querySelector('.page-header');

    const anim = "transform 0.75s ease, margin-top 0.75s ease, max-height 0.75s ease, opacity 0.75s ease";
    [main,sub,author,pageHeader].forEach(el => el.style.transition = anim);

    window.addEventListener('scroll', () => {
        const a = window.scrollY > 50;
        main.classList.toggle('shrink', a);
        sub.classList.toggle('shrink', a);
        author.classList.toggle('shrink', a);

        pageHeader.classList.toggle('shrink', a);
        pageHeader.style.marginTop = a ? "25px" : "40px";
    });


    /* =========================================================
   BLUR HEADER & FOOTER
========================================================= */
window.addEventListener("scroll", () => {
    const header = document.querySelector(".page-header");
    const t = Math.min(window.scrollY, 200) / 200;
    header.style.backdropFilter = `blur(${t * 8}px)`;
    header.style.opacity = 1 - t;
});

window.addEventListener("scroll", () => {
    const footer = document.querySelector("footer");
    const t = Math.min(window.scrollY, 200) / 200;
    footer.style.backdropFilter = `blur(${(1 - t) * 8}px)`;
    footer.style.opacity = t;
});