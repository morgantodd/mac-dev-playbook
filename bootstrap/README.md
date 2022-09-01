# Step 

## this one-liner does the following:
## install brew, which in turn will install the xcode command line tools (which includes git),
## make ~/code the default place to store all repos
## clone the repo into ~/code and run the setup script
```
bash -c "$(curl https://raw.githubusercontent.com/danielkoo/mac-dev-playbook/main/bootstrap/brew-installer.sh)" && \
mkdir ~/code && cd ~/code && git clone https://github.com/danielkoo/mac-dev-playbook.git && \
cd mac-dev-playbook && bootstrap/run.sh
```
