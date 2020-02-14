sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

sudo apt install zfs-fuse python-fuse fuse-zip sshfs libewf libfuse-div libexpatl-dev -y
sudo apt install xmount -y
sudo apt install build-essential libc6:i386 libncurses5:i386 libstdc++6:i386 git python-pip -y
sudo apt install vim binwalk dtrx ranger curl exiftool feh magic-wormhole -y

# Volatility
sudo python -m easy_install --upgrade pyOpenSSL

# Typora (Markdown editor)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora
