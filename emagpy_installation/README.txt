This is a README file for the installation of EMagPy.

1. Place the Pipfile, Pipfile.lock and the download_emagpy_and_packages.sh files in a folder that will be your virtual environment.

2. If you have the Pipfile and Pipfile.lock files:
    - Execute the download_emagpy_and_packages.sh by running the command: . download_emagpy_and_packages.sh

2bis. If you don't have the Pipfile and Pipfile.lock files:
    - Open the nano editor for the download_emagpy_and_packages.sh script: nano download_emagpy_and_packages.sh
    - Uncomment the line "pipenv install **********" by removing the "#" in front of it
    - Comment the line "pipenv install" by adding a "#" in front of it
    - Go back to point 2

3. To run the EMagPy GUI:
    - Go in the emagpy/src/ directory: cd emagpy/src/  
    - Run the ui.py file with Python: python3 ui.py
