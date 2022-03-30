echo 'Cloning EMagPy repository'
git clone https://gitlab.com/hkex/emagpy


echo 'Installing the packages required for the GUI'
pipenv shell

# If you don't have the Pipfile and Pipfile.lock, comment the line below
pipenv install

# If you don't have the Pipfile and Pipfile.lock, uncomment the line below
#pipenv install numpy matplotlib==3.2.1 pandas scipy pyproj spotpy joblib tqdm pyvista pyvistaqt PyQt5 emagpy
