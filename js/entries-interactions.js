    /* =========================================================
       TITRE + ICONES + ADD + TOOLTIP
    ========================================================= */
    document.querySelectorAll(".entry-title").forEach(title => {

        const rawText = title.textContent.trim();
        title.textContent = "";

        const left = document.createElement("div");
        left.className = "entry-title-left";
        left.textContent = rawText;
        title.appendChild(left);

        const iconAdd = document.createElement("span");
        iconAdd.className = "entry-icon visible";
        iconAdd.textContent = "add_circle_outline";
        left.appendChild(iconAdd);

        const hasLegend = title.hasAttribute("data-legend");
        let iconHelp = null;
        let tooltip = null;
        let locked = false;

        if (hasLegend) {
    iconHelp = document.createElement("span");
    iconHelp.className = "entry-help";
    iconHelp.textContent = "help_outline";
    title.appendChild(iconHelp);

    const legendId = title.getAttribute("data-legend");
    tooltip = document.createElement("div");
    tooltip.className = "legend-tooltip";
    tooltip.innerHTML = document.getElementById(legendId).innerHTML;
    title.appendChild(tooltip);

    // État verrouillé
    iconHelp.addEventListener("click", e => {
        e.stopPropagation();
        locked = !locked;
        iconHelp.classList.toggle("locked-state", locked);
        tooltip.classList.toggle("show", locked);
    });

    // Hover IN
    iconHelp.addEventListener("mouseenter", () => {
        if (!locked) tooltip.classList.add("show");
    });

    // Hover OUT
    iconHelp.addEventListener("mouseleave", () => {
        if (!locked) tooltip.classList.remove("show");
    });

    // Empêche fermeture lorsqu’on passe la souris sur la bulle
    tooltip.addEventListener("mouseenter", () => {
        if (!locked) tooltip.classList.add("show");
    });

    tooltip.addEventListener("mouseleave", () => {
        if (!locked) tooltip.classList.remove("show");
    });

    tooltip.addEventListener("click", e => e.stopPropagation());
}

        /* =========================================================
           AJOUT / RETRAIT DES SELECTED-ENTRIES
        ========================================================= */
        iconAdd.addEventListener("click", e => {
            e.stopPropagation();

            const entry = title.parentElement;
            const zone  = document.querySelector(".selected-entries");
            const list  = document.querySelector(".selected-list");
            const entryId = rawText;

            const nowAdded = iconAdd.classList.toggle("added");
            iconAdd.textContent = nowAdded ? "add_circle" : "add_circle_outline";
            if (nowAdded) {
                // État sélectionné = icône verte "add_circle"
                iconAdd.textContent = "add_circle";
                iconAdd.classList.add("added");

                // Hover = icône rouge "cancel"
                iconAdd.onmouseenter = () => {
                    iconAdd.textContent = "cancel";
                };
                iconAdd.onmouseleave = () => {
                    iconAdd.textContent = "add_circle";
                };

            } else {
                // État non sélectionné = icône "add_circle_outline"
                iconAdd.textContent = "add_circle_outline";
                iconAdd.classList.remove("added");

                // Enlever listeners hover
                iconAdd.onmouseenter = null;
                iconAdd.onmouseleave = null;
            }

            left.classList.toggle("added", nowAdded);

            const infoEl = entry.querySelector(".entry-info");
            if (infoEl) infoEl.classList.toggle("added", nowAdded);

            if (nowAdded) {
                // affichage du panneau si nécessaire
                zone.style.display = "flex";

                // vérifier l'existence d'un clone avec le même data-selected-id (comparaison JS sûre)
                const exists = Array.from(list.querySelectorAll('.selected-clone'))
                    .some(el => el.getAttribute('data-selected-id') === entryId);

                if (!exists) {
                    const clone = entry.cloneNode(true);
                    clone.classList.add("selected-clone");
                    clone.setAttribute("data-selected-id", entryId);

                    // Icône de suppression dans le clone
                    const del = document.createElement("span");
                    del.className = "selected-remove material-icons-outlined";
                    del.textContent = "cancel";
                    clone.querySelector(".entry-title").appendChild(del);

                    del.addEventListener("click", e => {
                        e.stopPropagation();

                        // 1. supprimer le clone
                        clone.remove();

                        // 2. retirer l’état "added" dans le stock
                        const stockEntries = document.querySelectorAll(".score-entry:not(.selected-clone)");
                        stockEntries.forEach(stock => {
                            const title = stock.querySelector(".entry-title-left");
                            if (title && title.textContent.trim() === entryId) {
                                const iconAdd = stock.querySelector(".entry-icon");
                                const info = stock.querySelector(".entry-info");

                                // retirer l'état "added"
                                iconAdd.classList.remove("added");
                                iconAdd.textContent = "add_circle_outline";
                                stock.querySelector(".entry-title-left").classList.remove("added");
                                if (info) info.classList.remove("added");
                            }
                        });

                        // 3. fermer le panneau s'il n'y a plus rien dedans
                        const list = document.querySelector(".selected-list");
                        if (list.querySelectorAll(".selected-clone").length === 0) {
                            document.querySelector(".selected-entries").style.display = "none";
                        }
                    });


                    // nettoyer le clone des éléments interactifs
                    clone.querySelectorAll(".entry-content").forEach(x => x.remove());
                    clone.querySelectorAll(".entry-icon").forEach(x => x.remove());
                    clone.querySelectorAll(".entry-help").forEach(x => x.remove());
                    clone.querySelectorAll(".legend-tooltip").forEach(x => x.remove());
                    // déplacer .entry-info dans le titre et le transformer
                    const info = clone.querySelector(".entry-info");
                    if (info) {
                        const text = info.querySelector(".entry-info-text");

                        // stocker le texte puis le retirer (le texte n'est plus visible)
                        const infoText = text ? text.textContent.trim() : "";
                        if (text) text.remove();

                        // transformer l'info en icône d'info "help"
                        info.classList.add("clone-info"); // style spécial
                        clone.querySelector(".entry-title").appendChild(info);

                        // créer un span pour afficher le texte au hover
                        const reveal = document.createElement("span");
                        reveal.className = "clone-info-reveal";
                        reveal.textContent = infoText;
                        info.appendChild(reveal);
                    }

                    clone.querySelectorAll("*").forEach(el => {
                        el.classList.remove("added","locked-state","visible");
                    });

                    clone.style.cursor = "default";
                    clone.querySelectorAll(".entry-title").forEach(tt => {
                        tt.style.cursor = "default";
                        tt.onclick = null;
                    });

                    list.appendChild(clone);
                }

            } else {
                // suppression du clone correspondant (recherche JS sûre)
                const existing = Array.from(list.querySelectorAll('.selected-clone'))
                    .find(el => el.getAttribute('data-selected-id') === entryId);
                if (existing) existing.remove();

                // vérification robuste du nombre de clones restants
                const remaining = list.querySelectorAll('.selected-clone').length;
                if (remaining === 0) zone.style.display = "none";
            }
        });

        title.addEventListener("click", () => {
            const content = title.parentElement.querySelector(".entry-content");
            const open = content.style.display === "block";

            if (open) {
                content.style.display = "none";
                if (hasLegend) {
                    iconHelp.classList.remove("visible");
                    tooltip.classList.remove("show");
                }
            } else {
                content.style.display = "block";
                requestAnimationFrame(() => {
                    iconAdd.classList.add("visible");
                    if (hasLegend) {
                        iconHelp.classList.add("visible");
                        if (locked) tooltip.classList.add("show");
                    }
                });
            }
        });
    });
