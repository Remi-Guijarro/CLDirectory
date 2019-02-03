#!/bin/bash
localdir=$(pwd)
function createSSMTPConfig()
{
    if [[ $1 = "gmail" ]];then
        echo $(cat $localdir/__GMAIL-SSMTP__ > $localdir/fichierBidon)
        config=('mail' 'auth' 'pass')
        for configString in "${config[@]}"
        do
            printf "your $configString :> "
            read answerConfig
            sed -i -e "s/__$configString\__/$answerConfig/" $localdir/fichierBidon
        done
    elif [[ $1 = "outlook" ]];then
        echo $(cat $localdir/__OUTLOOK-SSMTP__ > $localdir/fichierBidon)
    elif [[ $1 = "custom" ]];then
        echo $(cat $localdir/__CUSTOM-SSMTP__ > $localdir/fichierBidon)
    fi  
}

if [ "$EUID" -ne 0 ];then
    printf "You must be root to run this script :  sudo $basename $0  \n\r"
else    
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
        if [[ -f /etc/ssmtp/ssmtp.conf ]];then
            createSSMTPConfig  gmail
        else
            touch ssmtp.conf
        fi
    fi
fi