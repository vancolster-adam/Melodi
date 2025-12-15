    /* =========================================================
       ZOOM
    ========================================================= */
    document.querySelectorAll('.score-viewer').forEach(viewer => {
        const slider = viewer.querySelector('.zoom-range');
        const svg = viewer.querySelector('.score-svg');
        slider.addEventListener('input', () => {
            svg.style.transform = `scale(${slider.value})`;
        });
    });
