    document.querySelectorAll(".score-min").forEach(img => {

        const entry = document.createElement("div");
        entry.className = "score-entry";

        const titleText = img.alt || "Untitled";
        const title = document.createElement("div");
        title.className = "entry-title";
        title.textContent = titleText;

        [...img.attributes].forEach(a => {
            if (a.name.startsWith("data-")) title.setAttribute(a.name, a.value);
        });

        const infoText = img.getAttribute("data-info");
        let info = null;
        if (infoText) {
            info = document.createElement("div");
            info.className = "entry-info";
            info.innerHTML = `
                <span class="material-icons-outlined entry-info-icon">info</span>
                <span class="entry-info-text">${infoText}</span>
            `;
        }

        const content = document.createElement("div");
        content.className = "entry-content";
        content.innerHTML = `
            <div class="score-viewer">
                <div class="svg-scrollbox">
                    <img class="score-svg" src="${img.src}">
                </div>
                <div class="zoom-bar">
                    <input type="range" class="zoom-range" min="0.5" max="3" step="0.1" value="1">
                </div>
            </div>
            <div class="entry-subtitle">Related :</div>
            <ul><li><a href="#"></a></li></ul>
        `;

        entry.appendChild(title);
        if (info) entry.appendChild(info);
        entry.appendChild(content);

        img.insertAdjacentElement("beforebegin", entry);
        img.remove();
    });
