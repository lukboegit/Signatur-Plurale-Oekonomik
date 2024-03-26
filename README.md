# Netzwerkkram

Download your fresh official Netzwerk mail signature here. (oben auf signatur_netzwerk.html klicken und copy/pasten)

**PERSONALISIERUNG:**

In der signatur_Netzwerk.html Datei scroll runter bis zum Block `<div class="Infos">`, dort kannst du deinen Namen und Job anpassen und gegebenenfalls das Exploring Economics löschen. Im Block `<div class="Links">` änderst du dann noch die Mailadresse. **WICHTIG:** Du musst sie an beiden Stellen ersetzen, also `<p><a href="mailto:DEINE_MAIL">DEINE_MAIL</a></p>`

Wenn du Exploring aus der Signatur streichen willst, lösche diesen Block:

 ```
 <div class="Logo2">
            <img style="max-width: 130px; display: block; margin-bottom: 12px;"
                src="https://www.plurale-oekonomik.de/wp-content/uploads/2023/10/logo_exploring_economicsMailsignature.jpg"
                alt="ExploringEconomicsLogo.jpg">
</div>
```

und ändere den ersten Block von oben gesehen der mit .container beginnt folgendermaßen:

```
.container {
        display: grid;
        grid-template-columns: auto;
        grid-template-rows: auto;
        grid-template-areas:
            "Logo1 Netzwerkinfos"
            "Trenner Trenner"
            "Socials Links"
            "Rechtliches Rechtliches";
        column-gap: 45px;
        row-gap: 15px;
    }
```

**WICHTIG:** Danach kommt noch einmal Block der mit 

```
@media (max-width: 600px) {
        .container {
```

beginnt. Den bitte nicht verändern.

**NUTZUNG DER SIGNATUR**

+ HTML Mailsignatur bei **Apple Mail** einrichten: https://www.apfelschule.com/html-signatur-in-apple-mail/
+ HTML Signatur bei **Thunderbird** einrichten: https://support.mozilla.org/de/kb/signaturen
+ HTML Signatur bei **Outlook** einrichten: https://clean.email/blog/email-signature/outlook-html-signature

Outlook oder Apple Mail behandeln das hinzufügen von Signaturen in HTML code eher wie etwas, das man verstecken muss. Falls Du also noch keinen Mail Client nutzt, nimm gerne Thunderbird, it is good an open source.

Wenn du den Mittwald Webmailer nutzt, findest du eure Signatur unter Settings->Identities. Die Mailsignatur die du dort einstellt, wird allerdings nur genutzt, wenn du Mails über das Webinterface versendest.