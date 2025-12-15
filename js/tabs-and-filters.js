let currentTabId = "all";

    /* =========================================================
       MAPPING TAB → ATTRIBUT
    ========================================================= */
    const TAB_MAP = {
        "composers": "data-composer",
        "styles": "data-style",
        "harmony": "data-hcp",
        "forms": "data-work",
        "rhythm": "data-rhythm",
        "instrumentation": "data-instrument"
    };

    const DATA_RENAME = {
        "pdlp": "Pedal Point",
        "arp": "Arpeggio Patterns",
        "aug6fr": "Chord : French Augmented 6th",
        "cbl": "Chromatic Bass Line",
        "chm": "Chromatic Harmony",
        "cml": "Chromatic Melodic Line",
        "fvhm": "Four Voice Harmony",
        "kch4": "Key Changes : <sub><ruby>Down a perfect 5<sup>th</sup><rt>Up a perfect 4<sup>th</sup></rt></ruby></sub>",
        "kch5": "Key Changes : <sub><ruby>Down a perfect 4<sup>th</sup><rt>Up a perfect 5<sup>th</sup></rt></ruby></sub>",
        "mnk-a": "Minor Key : A minor",
        "mnk-e": "Minor Key : E minor"
    };

    const renameDataValue = v => DATA_RENAME[v] || v;

    /* =========================================================
       PREFILTRAGE PAR ONGLET (NE TOUCHE PAS LES CLONES)
    ========================================================= */
    function applyPrefilter(tabId) {
        const entries = document.querySelectorAll(".score-entry:not(.selected-clone)");

        if (!TAB_MAP[tabId]) {
            entries.forEach(e => e.style.display = "");
            return;
        }

        const attr = TAB_MAP[tabId];

        entries.forEach(entry => {
            const val = entry.querySelector(".entry-title").getAttribute(attr);
            entry.style.display = (val && val.trim() !== "") ? "" : "none";
        });
    }

    /* =========================================================
       FILTRE (IGNORE .selected-clone)
    ========================================================= */
    function updateFilter(tabId) {
        const filterDiv = document.querySelector(".filter .filter-list");

        if (!TAB_MAP[tabId]) {
            filterDiv.innerHTML = "";
            return;
        }

        const attr = TAB_MAP[tabId];
        const titles = document.querySelectorAll(".entry-title");

        const values = new Set();
        titles.forEach(t => {
            const raw = t.getAttribute(attr);
            if (!raw) return;
            raw.split(",").map(x => x.trim()).filter(Boolean)
                .forEach(v => values.add(renameDataValue(v)));
        });

        const sorted = Array.from(values).sort((a,b)=> a.localeCompare(b));
        const columnsCount = 4;
        const perCol = Math.ceil(sorted.length / columnsCount);

        filterDiv.innerHTML = "";
        for (let c = 0; c < columnsCount; c++) {
            const col = document.createElement("div");
            col.className = "column";
            const slice = sorted.slice(c * perCol, (c+1) * perCol);
            slice.forEach(value => {
                const idSafe = "f_"+value.replace(/\s+/g,"_").replace(/[^a-zA-Z0-9_]/g,"");
                const label = document.createElement("label");
                label.innerHTML = `<input type="checkbox" id="${idSafe}" value="${value}"> ${value}`;
                col.appendChild(label);
            });
            filterDiv.appendChild(col);
        }

        filterDiv.addEventListener("change", () => {
            const checked = Array.from(filterDiv.querySelectorAll('input[type="checkbox"]:checked')).map(i => i.value);
            const entries = document.querySelectorAll(".score-entry:not(.selected-clone)");

            if (checked.length === 0) {
                applyPrefilter(tabId);
                return;
            }

            entries.forEach(entry => {
                const raw = entry.querySelector(".entry-title").getAttribute(attr) || "";
                const attrValues = raw.split(",").map(s => renameDataValue(s.trim())).filter(Boolean);
                const ok = checked.some(ch => attrValues.includes(ch));
                entry.style.display = ok ? "" : "none";
            });
        });
    }

    /* =========================================================
       TABS
    ========================================================= */
    const tabs = document.querySelectorAll(".tab-item");

    tabs.forEach(tab => {
        tab.addEventListener("click", () => {
            tabs.forEach(t => t.classList.remove("active"));
            tab.classList.add("active");
            currentTabId = tab.id;

            applyPrefilter(currentTabId);
            updateFilter(currentTabId);
        });
    });

    document.getElementById("all").classList.add("active");
    applyPrefilter("all");
    updateFilter("all");