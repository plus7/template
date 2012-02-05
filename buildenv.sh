#!/bin/sh
echo "Copying dirs..."
cp -R arch ~/
cp -R opt ~/
cp -R proj ~/
cp -R repo ~/
cp -R tmp ~/
cp -R usr ~/
cp -R vm ~/
cp -R work ~/

echo "Adding some commands to .bashrc..."
echo "alias sl=ls" >> ~/.bashrc
echo "alias ks=ls" >> ~/.bashrc
echo "alias lks=ls" >> ~/.bashrc
echo "export PATH=~/usr/bin:$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=~/usr/lib:$LD_LIBRARY_PATH" >> ~/.bashrc

echo "detecting apt..."
which apt-get
if [ $? -eq 0 ] ; then
  gksu apt-get -y install gcc g++ ruby python mercurial subversion emacs ocaml mono
fi

echo "detecting yum..."
which yum
if [ $? -eq 0 ] ; then
  gksu yum -y install gcc gcc-c++ ruby python mercurial subversion emacs ocaml mono
fi

cd ~/arch
echo "fetch..."
wget http://download.virtualbox.org/virtualbox/4.1.8/Oracle_VM_VirtualBox_Extension_Pack-4.1.8-75467.vbox-extpack
wget http://www.microsoft.com/downloads/info.aspx?na=41&srcfamilyid=6b598327-9748-4052-884a-6ee737380dcd&srcdisplaylang=en&u=http%3a%2f%2fdownload.microsoft.com%2fdownload%2f6%2fB%2f6%2f6B6BFB83-3D3A-467C-8080-01F7A953A37F%2ffsharp.zip
cd -

