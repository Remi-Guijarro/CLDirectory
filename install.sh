cd ~/Documents
mkdir Annuaires
cd Annuaires
touch .files
apt-get install ssmtp
if [ $? -eq 1 ] || [ $? -eq 2 ];then
    echo error occured when installing ssmtp, retry later
    exit
else
    cd /etc/ssmtp/    
    cat /etc/ssmtp/ssmtp.conf
fi