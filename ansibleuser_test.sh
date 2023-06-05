/bin/bas
# Kreiranje ansible korisnika za adminsitraciju kroz ansible

cat ** Sart **

cat ** Kreiranje korisnika ansible **
sudo useradd ansibletest # Promeniti ime i finalnoj verziji
cat ** Dodavanje usera u odgovarajuce grupe
sudo usermod -a -G wheel ansibletest # Promeniti ime i finalnoj verziji
cat ** Postavljane sifre za usera
sudo passwd ansibletest # Promeniti ime i finalnoj verziji

cat ** Kraj **
