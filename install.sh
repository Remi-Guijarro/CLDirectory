#!/bin/bash
localdir=$(pwd)
function createSSMTPConfig()
{
    if [[ $1 = "gmail" ]];then
        echo $(cat $localdir/SSMTP_CONFIG/__GMAIL-SSMTP__ > $localdir/fichierBidon)
        config=('mail' 'auth' 'pass')
        for configString in "${config[@]}"
        do
            printf "your $configString :> "
            read answerConfig
            sed -i -e "s/__$configString\__/$answerConfig/" $localdir/fichierBidon
        done
    elif [[ $1 = "outlook" ]];then
        echo $(cat $localdir/SSMTP_CONFIG/__OUTLOOK-SSMTP__ > $localdir/fichierBidon)
         config=('mail' 'auth' 'pass')
        for configString in "${config[@]}"
        do
            printf "your $configString :> "
            read answerConfig
            sed -i -e "s/__$configString\__/$answerConfig/" $localdir/fichierBidon
        done
    elif [[ $1 = "custom" ]];then
        echo $(cat $localdir/SSMTP_CONFIG/__CUSTOM-SSMTP__ > $localdir/fichierBidon)
        config=('mail' 'auth' 'pass' 'mailServeur' 'port' 'domain' 'hostname' 'Usetls' 'UsestartTLS' 'FromLineOverride')
        for configString in "${config[@]}"
        do
            printf "$configString :> "
            read answerConfig
            sed -i -e "s/__$configString\__/$answerConfig/" $localdir/fichierBidon
        done
    fi  
}

function conputeConfigChoice()
{
    printf "what mail do you want to config (gmail|outlook|custom) :> "
    read configmail
    if [[ "$configmail" == "custom" ]];then
        printf "here"
        printf "This config suppose you know what you're doing, are you sure to continue ? (yY|nN ) :> "
        read answer
        if [[ "$answer" == "Y" ]] || [[ "$answer" == "y" ]]; then
            echo $configmail > answerFile
        else
            conputeConfigChoice
        fi
    else
        echo $configmail > answerFile
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
            conputeConfigChoice
            configmail=$(tail -1 answerFile)
            createSSMTPConfig $configmail
        else
            touch ssmtp.conf
            conputeConfigChoice
            configmail=$(tail -1 answerFile)
            createSSMTPConfig $configmail
        fi
    fi
fi