#!/bin/bash
echo "Make sure you're root before installing the tools"
sleep 5
clear
echo "Installing all dependencies"
cd
sudo apt-get install git -y
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
sudo apt-get install ruby -y
sudo apt install snapd -y
sudo apt install cmake -y
sudo apt install jq -y
sudo snap install chromium -y
sleep 2
clear
echo "Installing python tools"
mkdir -p ~/tools
mkdir -p ~/tools/temp/
mkdir -p ~/tools/payloads/
wget https://raw.githubusercontent.com/R0X4R/Garud/master/payloads/ssti.txt
wget https://raw.githubusercontent.com/R0X4R/Garud/master/payloads/lfi.txt
mv lfi.txt ~/tools/payloads/
mv ssti.txt ~/tools/payloads/
git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r && cd ~/tools/Sublist3r && sudo pip3 install -r requirements.txt
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git ~/tools/sqlmap/
git clone https://github.com/ameenmaali/urldedupe.git ~/tools/urldedupe && cd ~/tools/urldedupe && cmake CMakeLists.txt && make && mv urldedupe /usr/bin/
git clone https://github.com/codingo/Interlace.git ~/tools/interlace && cd ~/tools/interlace && python3 setup.py install
cd
mkdir ~/wordlists/
cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt
wget https://gist.githubusercontent.com/Lopseg/33106eb13372a72a31154e0bbab2d2b3/raw/a79331799a70d0ae0ea906f2b143996d85f71de5/dicc.txt
wget https://wordlists-cdn.assetnote.io/data/manual/best-dns-wordlist.txt
mv best-dns-wordlist.txt dns.txt
clear
echo "All python tools are installed"
sleep 2
echo "Installing go-lang tools"
go get github.com/michenriksen/aquatone
go get -u github.com/tomnomnom/assetfinder
GO111MODULE=on go get -u -v github.com/bp0lr/gauplus
go get github.com/tomnomnom/waybackurls
go get github.com/Emoe/kxss
go get -u github.com/tomnomnom/qsreplace
git clone https://github.com/projectdiscovery/dnsx.git; cd dnsx/cmd/dnsx; go build; mv dnsx /usr/bin/ &> /dev/null
cd ~/tools/temp/ && git clone https://github.com/projectdiscovery/notify.git; cd notify/cmd/notify; go build; mv notify /usr/bin/
cd ~/tools/temp/ && git clone https://github.com/hahwul/dalfox && cd dalfox && go install
cd ~/tools/temp/ && git clone https://github.com/dwisiswant0/crlfuzz && cd crlfuzz/cmd/crlfuzz && go build . && sudo mv crlfuzz /usr/bin/
cd ~/tools/temp/ && git clone https://github.com/projectdiscovery/nuclei.git && cd nuclei/v2/cmd/nuclei && go build && mv nuclei /usr/bin/
cd ~/tools/temp/ && git clone https://github.com/projectdiscovery/subfinder.git && cd subfinder/v2/cmd/subfinder && go build && mv subfinder /usr/bin/
cd ~/tools/temp/ && wget https://github.com/projectdiscovery/httpx/releases/download/v1.0.6/httpx_1.0.6_linux_386.tar.gz && tar -xvf httpx_1.0.6_linux_386.tar.gz && mv httpx /usr/bin/
cd ~/tools/temp/ && wget https://github.com/OWASP/Amass/releases/download/v3.12.3/amass_linux_i386.zip && unzip amass_linux_i386.zip && cd amass_linux_i386 && mv amass /usr/bin/
cd ~/tools/temp/ && go get -u github.com/ffuf/ffuf
cd ~/tools/temp/ && git clone https://github.com/R0X4R/Fuzzy.git
cd Fuzzy
chmod +x fuzzy && mv fuzzy /usr/bin/
cd
rm -rf ~/tools/temp/
go get -u github.com/tomnomnom/anew
go get -u github.com/tomnomnom/gf
mkdir ~/.gf
cp -r ~/go/src/github.com/tomnomnom/gf/examples ~/.gf/
echo 'source ~/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
git clone https://github.com/1ndianl33t/Gf-Patterns
mv ~/Gf-Patterns/*.json ~/.gf
sudo cp ~/go/bin/* /usr/bin/
nuclei -update-templates
sleep 2
clear
echo -e "Please add your slack webhook in ~/.config/notify/notify.conf file"
