```
    ____        __  ____                             
   / __ )____  / /_/ __ \__  ______  ____  ___  _____
  / __  / __ \/ __/ /_/ / / / / __ \/ __ \/ _ \/ ___/
 / /_/ / /_/ / /_/ _, _/ /_/ / / / / / / /  __/ /    
/_____/\____/\__/_/ |_|\__,_/_/ /_/_/ /_/\___/_/

  By Sebs_ (www.github.com/SebsIII) - V X.x

```   
A way to easly run Telegram BOTs from linux terminal, with a minimal [shell script](https://www.shellscript.sh/), that opens a new [screen](https://www.geeksforgeeks.org/linux-unix/screen-command-in-linux-with-examples/) session, creates a [python virtual enviroment(VENV)](https://docs.python.org/3/library/venv.html) and runs your BOT automatically!

This project started when i was having trouble when setting up my first home server which, other than saving data and files as a [NAS](https://it.wikipedia.org/wiki/Network_Attached_Storage), would also **host Telegram BOTs**. <br>
The issues started when **dealing with python**, a nice programming language capable of everything, but hard to deal with in linux envs hence those use python internally, so downloading other libraries and updating the already existing ones could *destroy* the system. <br>
There's where [Python VENVs](https://docs.python.org/3/library/venv.html) come into action! <br>
They're virtual enviroments *isolated* from the rest of the system, so downloading, updating, changing or doing any option won't damage the main system.

##  Requirements
BotRunner needs those commands to be run:
- [screen](https://www.geeksforgeeks.org/linux-unix/screen-command-in-linux-with-examples/)
- [python3](https://www.python.org/)
- [pip](https://pypi.org/project/pip/)
- SUDO permissions for **chmod +x command**
- your BOT folder

> [!WARNING]
> Make sure that your BOT FILE THAT SHOULD BE RUN is named as **BOTNAME_bot.py**

## Usage

Downloading & setting up BotRunner is easy, here's how:

1. Download bot runner with this command:
```
git clone https://www.github.com/SebsIII/BotRunner    
```
2. cd in your BOT root folder:
```
cd /bot/root/folder
```

3. Allow BotRunner.sh to be run:
```
sudo chmod +x ./BotRunner.sh
```
4. Run BotRunner:
```
/path/to/BotRunner BOTNAME
```
Where BOTNAME is the name of your bot, eg. MyBOT
