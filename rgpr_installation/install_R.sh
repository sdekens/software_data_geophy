echo 'Adding R repository'
sudo apt install -y libffi-dev
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
echo 'updating packages'
sudo apt update
sudo apt-get dist-upgrade
echo 'Installing R'
sudo apt install -y r-base r-base-core r-recommended

# We need to install the GDAL dependencies to install the terra R package
echo 'Adding Ubuntugis repository'
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
sudo apt update
echo 'Installing gdal dependencies'
sudo apt install -y libudunits2-dev libgdal-dev libgeos-dev libproj-dev

echo 'Installing R packages'
Rscript -e "install.packages(c('repr','IRdisplay','evaluate','crayon','pbdZMQ','devtools','uuid','digest','raster','gstat','sp','rgdal'))"

