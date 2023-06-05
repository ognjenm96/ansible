/bin/bas
# Kreiranje ansible korisnika za adminsitraciju kroz ansible
#Kreiranje korisnika ansible
sudo useradd ansibletest # Promeniti ime i finalnoj verziji
#Dodavanje usera u odgovarajuce grupe
sudo usermod -a -G wheel ansibletest # Promeniti ime i finalnoj verziji
#Postavljane sifre za usera
sudo passwd ansibletest # Promeniti ime i finalnoj verziji
