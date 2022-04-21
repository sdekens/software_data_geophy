echo 'Installing required packages'
sudo apt -y install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

#TODO Compléter la commande avec le bon nom du fichier
echo 'Installing Anaconda'
bash Miniconda3-latest-Linux-x86_64.sh


source /home/$USER/miniconda3/bin/activate
conda init


echo 'Reloading the bashrc'
source ~/.bashrc

# Disable the auto-activation of the conda environment when starting a shell
conda config --set auto_activate_base False
