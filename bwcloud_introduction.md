# Arbeiten in der Cloud

### Erste Schritte mit Ubuntu 16.04

#### Wichtige Befehle

`sudo` 

`cd` (**change directory**)

`ls` (**list** all files in the current directory)

#### Installation von zusätzlichen Paketen/Programmen

```{bash}
sudo apt-get install <paket>
```

#### Update der installierten Pakete und des Systems

```{bash}
sudo apt-get update && sudo apt-get upgrade -y
```

#### Anlegen eines neuen Users

```{bash}
sudo adduser <username>
```

#### Anlegen einer neuen Gruppe

```{bash}
sudo addgroup <groupname>
```

#### User zu einer Gruppe hinzufügen

```{bash}
sudo usermod -aG <groupname> <username>
```

### Installation eines RStudio Servers

#### Installation Base R
```{bash}
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
sudo apt-get update
sudo apt-get install r-base
```

#### Installation RStudio Server
```{bash}
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/rstudio-server-1.1.453-amd64.deb
sudo gdebi rstudio-server-1.1.453-amd64.deb
```



### Einrichten eines Proxy Server (NGINX)

Installiere den Web-/Proxyserver Nginx.

```{bash}
sudo apt-get install nginx -y
```