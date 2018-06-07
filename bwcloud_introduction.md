# Arbeiten in der Cloud

## Instanz einrichten und vorbereiten

### Putty download und SSH Key erstellen
1. Download Putty [https://putty.org/](https://putty.org/)
2. Generate SSH Key
3. Save Keys
4. Add Key in BWCloud

### Instanz erstellen
1. Ubuntu 16.04 Raw
2. Key auswählen
3. Sicherheitsgruppe `default`
4. Netzwerk `public2`

### Sicherheitsgruppe hinzufügen
1. HTTP Gruppe mit Port 80 & 443 erstellen
2. Sicherheitsgruppe zu Instanz hinzufügen

### Putty einrichten
1. Host Name eintragen
2. Namen geben und speichern
3. Key unter _SSH_ → _Auth_ → _Private key file for authentication_ auswählen und erneut speichern 
4. Dialog bestätigen


### Erste Schritte mit Ubuntu 16.04

#### Wichtige Befehle

`cd <dir>` (**change directory**)

`ls` (**list** all files in the current directory)

`chmod 755 <dir|file> ` (ändere Zugriffsrechte)

`chown <username>:<groupname> <dir|file>` (ändere Besitzter)

`nano` (öffne Texteditor Nano)

`sudo` (führe Befehle als "super-user" aus)

`Ctrl/Strg + L` Leeren der Console

`Ctrl/Strg + C` Abbrechen des Befehls 

`↑` Anzeigen des letzten Befehls

`RECHTSKLICK` Einfügen 

##### Installation von zusätzlichen Paketen/Programmen

```{bash}
sudo apt-get install <paket>
```

##### Anlegen eines neuen Users

```{bash}
sudo adduser <username>
```

##### Anlegen einer neuen Gruppe

```{bash}
sudo addgroup <groupname>
```

##### User zu einer Gruppe hinzufügen

```{bash}
sudo usermod -aG <groupname> <username>
```

### Vorbereiten des Servers

#### Update der installierten Pakete und des Systems

```{bash}
sudo apt-get update && sudo apt-get upgrade -y
```
#### Einstellen des Servernamen 

```{bash}
sudo nano /etc/hosts
```
##### Schreibe Folgendes in die zweite Zeile 

```
127.0.0.1 <name_of_your_instance>
```

### Installation eines RStudio Servers

#### Installation Base R
```{bash}
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
sudo apt-get update
sudo apt-get install r-base -y
```

#### Installation RStudio Server
```{bash}
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/rstudio-server-1.1.453-amd64.deb
sudo gdebi rstudio-server-1.1.453-amd64.deb
sudo rm rstudio-server-1.1.453-amd64.deb
```

### Einrichten eines Proxy Server (Nginx)

#### Installation Nginx.

```{bash}
sudo apt-get install nginx -y
```

#### Lösche **default** Konfiguration

```{bash}
sudo rm /etc/nginx/sites-enabled/default
```

#### Erstelle neue Konfiguration

```{bash}
sudo nano /etc/nginx/sites-available/rstudio
```

##### Konfiguration zum Einfügen

```
server {
    listen 80;
    server_name rserver;
    location / {
        proxy_set_header  X-Real-IP  $remote_addr;
        proxy_set_header  Host       $http_host;
        proxy_pass        http://127.0.0.1:8787;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_cache_bypass $http_upgrade;
    }
}
```

#### Verlinke die neue Konfiguration und starte Nginx neu
```{bash}
sudo ln -s /etc/nginx/sites-available/rstudio /etc/nginx/sites-enabled/rstudio
sudo service nginx restart
```

### Zugriffsrechte

#### Erstellen einer R-Server Gruppe 

```
sudo addgroup rserver
```
#### Erstellen eines Users für diese Gruppe 
```
sudo adduser jane 
sudo usermod -aG rserver jane
```

#### Zugriff nur für rserver Gruppe 

```
sudo nano /etc/rstudio/rserver.conf
```
##### Schreibe Folgendes in das File

```
auth-required-user-group=rserver
```
