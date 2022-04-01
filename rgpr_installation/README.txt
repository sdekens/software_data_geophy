This is a README file for the installation of RGPR.

1. R should already be installed on your machine. You can test if that's the case by running this command into the terminal: R
    - If you enter the R editor, exit it with the quit() command.
    - If R isn't installed, run the script install_R.sh with the following command: . install_R.sh

2. Execute the install_prerequisites.sh script by running the command: . install_prerequisites.sh

3. Enter the R editor by running this command: sudo R

4. In the R editor, run the following command: devtools::install_github("emanuelhuber/RGPR")
