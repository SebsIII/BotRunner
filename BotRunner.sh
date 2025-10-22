#!/bin/bash
# BotRunner by Sebs_
# This Script is a useful tool to run python bots automatically.
# it can also be used in .service files to easly run bots at startup!
#
# It works by starting a new screen, and running the bot in a python venv
# Syntax: ./BotRunner [BOT_NAME]

# WARNING! This script will only work if the main bot script is named as [BOT_NAME]_bot.py
# WARNING! This script SHOULD be run the root folder of the bot to make the script faster

getTime(){  #Prints current time in HH:MM:SS
    echo $(date +%T)
}

echo    "  
    ____        __  ____                             
   / __ )____  / /_/ __ \__  ______  ____  ___  _____
  / __  / __ \/ __/ /_/ / / / / __ \/ __ \/ _ \/ ___/
 / /_/ / /_/ / /_/ _, _/ /_/ / / / / / / /  __/ /    
/_____/\____/\__/_/ |_|\__,_/_/ /_/_/ /_/\___/_/     
" 
echo "  By Sebs_ (www.github.com/SebsIII) - V1.0"
echo    

BOT=$1
BOTNAME="${BOT}_bot.py"
BOTLOCATION=$(find ~ -type f -name "$BOTNAME" 2> /dev/null -print -quit)    ##THIS SEARCHES IN THE TRASH ALSO

if [ -z "$1" ]; then
    echo "[$(getTime)] - ERROR: No input parameter, add your BOT name and restart!"
    exit
fi

## check system requirements
if [ ! -z "$BOTLOCATION" ]; then  # checks if BOTNAME exists
    if command -v screen &> /dev/null ; then     #checks if screen is present
        if command -v python3 &> /dev/null ; then
            if command -v pip &> /dev/null ; then
                echo "[$(getTime)] - System requirements OK";
            else    
                echo "[$(getTime)] - ERROR: pip is not present on your system, install it and continue!"
                exit
            fi
        else    
            echo "[$(getTime)] - ERROR: python is not present on your system, install it and continue!"
            exit
        fi
    else
        echo "[$(getTime)] - ERROR: Screen is not present in your system, install it before running this script!";
        exit 
    fi
else
    echo "[$(getTime)] - ERROR: I wasn't able to find $BOTNAME, are you sure you're in the bot's root folder?"
    exit
fi 


if ( ! screen -ls | grep $BOT > /dev/null); then
    if [ -z $(cd $(dirname "$BOTLOCATION") && find . -type f -name "requirements.txt") ]; then
        echo "[$(getTime)] - There is no 'requirements.txt' in the BOT folder, wuold you like me to prepare one for you? [Y/n]"
        read reply
        if [ "$reply" = 'y' ] || [ "$reply" = 'Y' ]; then   
            if(screen -dmS "${BOT}-BotRunner" 2> /dev/null); then
                echo "[$(getTime)] - Starting $BOTNAME, stored in $BOTLOCATION."
                echo "[$(getTime)] - Screen started at [$(screen -ls | grep "$BOT" | awk '{print $1}')]"
                screen -S "$BOT" -X stuff "set -e; \
                    cd $(dirname "$BOTLOCATION") && \
                    python3 -m venv \"$BOT-VENV\" && \
                    source \"$BOT-VENV/bin/activate\" && \
                    pip install -q pipreqs && \
                    pipreqs ./ && \
                    pip install -q -r requirements.txt && \
                    python3 ${BOT}_bot.py || screen -S \"$BOT\" -X quit$(printf \\r)
                "

                echo "[$(getTime)] - My job is done and $BOT should be running, if you want to make sure everything's fine, resume the screen and check."
                exit
            fi
        else
            echo "[$(getTime)] - ERROR: Could not continue without requirements.txt file!"
            exit
        fi
    else
        echo "It COULD run now"
    fi
else
    echo "[$(getTime)] - $BOTNAME is already running at screen ID $(screen -ls | grep "$BOT" | awk -F. '{print $1}' | tr -d '[:space:]')!"
fi


