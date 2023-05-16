# Update system to ensure there's not conflict 
sudo dnf upgrade --refresh

#Enable EPEL Repo - Import EPEL for Rocky Linux9 (EL9) -  Enable the CRB
sudo dnf config-manager --set-enabled crb

#Install EPEL using dnf
sudo dnf install \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
    https://dl.fedoraproject.org/pub/epel/epel-next-release-latest-9.noarch.rpm


