echo 'Creating the virtual environment pg'
#conda create -n pg -c gimli -c conda-forge pygimli=1.2.4
#conda install -c gimli pygimli
# This seems to be the correct command line. Needs to be tested.
conda create -n pg -c gimli pygimli

echo 'Activating virtual environment'
conda activate pg
