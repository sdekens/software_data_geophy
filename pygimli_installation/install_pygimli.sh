echo 'Creating the virtual environment pg'
conda create -n pg -c gimli -c conda-forge pygimli=1.2.4

echo 'Activating virtual environment'
conda activate pg
