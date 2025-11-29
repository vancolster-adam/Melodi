    document.querySelectorAll(".title").forEach(title => {
    title.addEventListener("click", () => {
    const content = title.nextElementSibling;
    content.style.display = content.style.display === "block" ? "none" : "block";});
    });


  document.querySelectorAll('.viewer-container').forEach(container => {
    const slider = container.querySelector('.zoom-slider');
    const image = container.querySelector('.svg-image');

    slider.addEventListener('input', () => {
      const zoom = slider.value;
      image.style.transform = `scale(${zoom})`;
    });
  });

