from requests import post
from config import MAILGUN_API_KEY, MAILGUN_API_URL


def send_email_verification_email(recipient: str, first_name: str, url: str):
    post(
        url=MAILGUN_API_URL,
        auth=("api", MAILGUN_API_KEY),
        data={
            "from": "TickOff Csapat <noreply@tickoff.hu>",
            "to": [recipient],
            "subject": "E-mail cím megerősítése",
            "template": "email-verification",
            "v:first_name": first_name,
            "v:url": url,
        },
    )


def send_password_reset_email(recipient: str, url: str):
    post(
        url=MAILGUN_API_URL,
        auth=("api", MAILGUN_API_KEY),
        data={
            "from": "TickOff Csapat <noreply@tickoff.hu>",
            "to": [recipient],
            "subject": "Jelszó visszaállítása",
            "template": "password-reset-request",
            "v:url": url,
        },
    )


def send_new_password_email(recipient: str, new_password: str):
    post(
        url=MAILGUN_API_URL,
        auth=("api", MAILGUN_API_KEY),
        data={
            "from": "TickOff Csapat <noreply@tickoff.hu>",
            "to": [recipient],
            "subject": "Új jelszó",
            "template": "new-password",
            "v:new_password": new_password,
        },
    )