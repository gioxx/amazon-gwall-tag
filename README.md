# Gioxx's Wall Amazon Affiliate Tag Replacer

<img src="icons/Amazon_Tag_Replacer_noBG.png" alt="Amazon Tag Replacer" width="180">

Estensione browser che aggiunge o sostituisce il parametro `tag` sui link Amazon.it con il codice affiliato di Gioxx's Wall, evitando le aree sensibili di login e checkout.

## Come funziona
- Ambito: solo domini `amazon.it` (schede e frame).
- Tag applicato: `gioxx-21`.
- Esclusioni: non interviene su percorsi di login (`/ap/`, `/gp/sign-in`) e checkout (`/checkout/`, `/gp/buy/`).
- Trasparenza: nessun dato personale raccolto o inviato; l'estensione si limita a modificare gli URL.
- Pagina informazioni: `about.html` accessibile dalle opzioni dell'estensione.

## File principali
- `manifest.json`: manifest MV3 per Chrome/Edge con `declarativeNetRequest` e `rules.json`.
- `rules.json`: regola di redirect che imposta/aggiorna il parametro `tag`, con filtro regex e percorsi esclusi.
- `manifest.firefox.json`: manifest MV2 per Firefox, usa `webRequest`/`webRequestBlocking` e `background.js`.
- `background.js`: listener che riscrive l'URL su Firefox rispettando le stesse esclusioni.
- `about.html`: pagina "About" con descrizione, tag in uso e note di trasparenza.
- `icons/`: asset di base `Amazon_Tag_Replacer_noBG.png` e derivati `icon16.png`, `icon48.png`, `icon128.png` usati nei manifest.


---


> Mi tengo qui di seguito degli appunti validi per poter poi caricare l'estensione nei due store ufficiali.
>
> ## Build pacchetti per store
> - Requisiti: `zip` disponibile nel PATH.
> - Comando: `bash scripts/build.sh`
> - Output in `dist/`:
>   - `amazon-gwall-tag-chrome.zip` (MV3): include `manifest.json`, `rules.json`, `about.html`, `icons/`.
>   - `amazon-gwall-tag-firefox.zip` (MV2): include `manifest.json` derivato da `manifest.firefox.json`, `background.js`, `about.html`, `icons/`.
>
> ## Listing store (proposte testo)
> - Short description: `Sostituisce i link Amazon.it con il tag affiliato di Gioxx's Wall, evitando login e checkout.`
> - Long description:
>   - Aggiunge o aggiorna il parametro `tag` su Amazon.it per sostenere Gioxx's Wall.
>   - Non interviene su login, checkout o percorsi sensibili.
>   - Nessuna raccolta di dati personali; lavora solo sugli URL nelle schede/frame Amazon.it.
>   - Pagina informativa inclusa (`about.html`) con tag e trasparenza d'uso.
>   - Compatibile con Chrome/Edge (MV3) e Firefox (MV2).
> - Punti elenco (store):
>   - Tag affiliato `gioxx-21` su Amazon.it
>   - Esclusioni: login, checkout, percorsi `ap/`, `checkout/`, `gp/buy/`, `gp/sign-in`
>   - Nessun tracciamento, nessun dato inviato
>   - Pagina info inclusa
>
> ## Checklist pubblicazione
> - Chrome Web Store:
>   - Manifest MV3 (`manifest.json`) con permesso `declarativeNetRequest` e `host_permissions` `*://*.amazon.it/*`.
>   - Caricare icone 16/48/128 da `icons/`.
>   - Screenshot che mostrano la pagina About e l'effetto sul link (barra indirizzi).
>   - Sezione Privacy: dichiarare che non raccoglie/trasmette dati (solo riscrittura URL).
>   - Note versione: evidenziare esclusione login/checkout e tag `gioxx-21`.
> - Firefox AMO:
>   - Manifest MV2 (`manifest.firefox.json`) con permessi `webRequest`/`webRequestBlocking` e scope `*://*.amazon.it/*`.
>   - Caricare le stesse icone 16/48/128.
>   - Abilitare `about.html` come pagina opzioni (già configurata).
>   - Screenshot: pagina About e esempio link.
>   - Sezione Privacy: stessa dichiarazione di non raccolta dati.
>   - Note versione: stesso testo della versione Chrome.
