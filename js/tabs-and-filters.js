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
        "i-iv-i" : "1 - <i>Progressions</i> : I - IV - I",
        "i-v-i" : "1 - <i>Progressions</i> : I - V - I", 
        "ii-v-i" : "1 - <i>Progressions</i> : II - V - I",
        "iv-v-i" : "1 - <i>Progressions</i> : IV - V - I",
        "v/v-v-i" : "1 - <i>Progressions</i> : V/V - V - I",
        "kch4": "2 - <i>Key Changes</i> : Up a perfect <i>4</i><sup>th</sup> / Down a perfect <i>5</i><sup>th</sup>",
        "kch5": "2 - <i>Key Changes</i> : Up a perfect <i>5</i><sup>th</sup> / Down a perfect <i>4</i><sup>th</sup>",
        "pdlp": "Pedal Point",
        "arp": "Arpeggio Patterns",
        "aug6fr": "4 - <i>Chords</i> : French Augmented 6<sup>th</sup>",
        "sigchord" : "4 - <i>Chords</i> : Signature chords",
        "cbl": "Chromatic Bass Line",
        "chm": "Chromatic Harmony",
        "cml": "Chromatic Melodic Line",
        "dbl": "Descending Bass Line",
        "fvhm": "Four Voice Harmony",
        "mjk-f": "3.1 - <i>Tonal</i> : F major",
        "mnk-a": "3.1 - <i>Tonal</i> : A minor",
        "mnk-e": "3.1 - <i>Tonal</i> : E minor",
        "mnk-f": "3.1 - <i>Tonal</i> : F minor",
        "lyd-f": "3.2 - <i>Modal</i> : F lydian",
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
    filterDiv.innerHTML = "";

    if (!TAB_MAP[tabId]) return;

    const attr = TAB_MAP[tabId];
    const titles = document.querySelectorAll(".entry-title");

    /* ===============================
       COLLECTE + TRI ALPHABÉTIQUE
    =============================== */
    const values = new Set();
    titles.forEach(t => {
        const raw = t.getAttribute(attr);
        if (!raw) return;
        raw.split(",")
            .map(v => v.trim())
            .filter(Boolean)
            .forEach(v => values.add(renameDataValue(v)));
    });

    const sortedValues = Array.from(values).sort((a, b) =>
        a.localeCompare(b)
    );

    /* ===============================
       REGROUPEMENT
    =============================== */
    const groups = {};
    const others = [];

    sortedValues.forEach(v => {
        const m = v.match(/^(\d+)\s*-\s*([^:]+)\s*:\s*(.+)$/);
        if (!m) {
            others.push(v);
            return;
        }

        const section = `${m[1]} - ${m[2].trim()} :`;
        const item = m[3].trim();

        if (!groups[section]) groups[section] = [];
        groups[section].push(item);
    });

    const hasSections = Object.keys(groups).length > 0;

    /* ===============================
       FLUX LINÉAIRE
    =============================== */
    let linear = [];

    if (!hasSections) {
        /* CAS 1 : AUCUNE SECTION → COMPORTEMENT HISTORIQUE */
        linear = sortedValues.map(v => ({
            type: "label",
            html: v,
            value: v
        }));
    } else {
        /* CAS 2 : SECTIONS DÉTECTÉES */
        const orderedSections = Object.keys(groups).sort((a, b) =>
            a.localeCompare(b)
        );

        orderedSections.forEach(section => {
            linear.push({ type: "section", value: section });

            groups[section]
                .sort((a, b) => a.localeCompare(b))
                .forEach(item => {
                    linear.push({
                        type: "label",
                        html: item,
                        value: `${section} ${item}`
                    });
                });
        });

        if (others.length) {
            linear.push({ type: "section", value: "Other" });
            others.forEach(v => {
                linear.push({
                    type: "label",
                    html: v,
                    value: v
                });
            });
        }
    }

    /* ===============================
       RENDU EN 4 COLONNES (INCHANGÉ)
    =============================== */
    const columnsCount = 4;
    const perCol = Math.ceil(linear.length / columnsCount);

    for (let c = 0; c < columnsCount; c++) {
        const col = document.createElement("div");
        col.className = "column";

        linear
            .slice(c * perCol, (c + 1) * perCol)
            .forEach(item => {
                if (item.type === "section") {
                    const span = document.createElement("span");
                    span.className = "filter-section";
                    span.innerHTML = item.value;
                    col.appendChild(span);
                } else {
                    const label = document.createElement("label");
                    label.innerHTML = item.html;
                    label.dataset.value = item.value;
                    col.appendChild(label);
                }
            });

        filterDiv.appendChild(col);
    }

    /* ===============================
       FILTRAGE AU CLIC
    =============================== */
    filterDiv.onclick = e => {
        const label = e.target.closest("label");
        if (!label) return;

        label.classList.toggle("active");

        const activeValues = Array.from(
            filterDiv.querySelectorAll("label.active")
        ).map(l => l.dataset.value);

        const entries = document.querySelectorAll(
            ".score-entry:not(.selected-clone)"
        );

        if (activeValues.length === 0) {
            applyPrefilter(tabId);
            return;
        }

        entries.forEach(entry => {
            const raw =
                entry.querySelector(".entry-title").getAttribute(attr) || "";

            const entryValues = raw
                .split(",")
                .map(v => renameDataValue(v.trim()))
                .filter(Boolean);

            const match = activeValues.some(v =>
                entryValues.some(ev => ev === v || ev.startsWith(v))
            );

            entry.style.display = match ? "" : "none";
        });
    };
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
