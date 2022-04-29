# Fejlesztői szerver futtatása

- `pullold ezt a repot`
- `importáld a project.sql file-t`
- `.env-ben írd át a DB_URI-t erre: mysql://root@localhost/project`
- `api mappán belül, terminál: virtualenv venv`
- `api mappán belül, terminál: venv\scripts\activate` `linuxon: source venv\bin\activate`
- `válaszd ki a meglfelelő python interpretert a venv mappából`
- `api mappán belül, terminál: pip install -r requirements.txt`
- `.env-ben api és app url-t írd át erre:` `(ha eleve nem ez lenne)`
    - `APP_URL=http://localhost:5500/frontend`
    - `API_URL=http://localhost:5000`
- 
- `api mappán belül, terminál: flask run --reload`

    




