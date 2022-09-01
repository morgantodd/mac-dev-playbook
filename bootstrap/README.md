# Step 

## this one-liner does the following:
## install xcode command line tools, which includes git
## make ~/code the default place to store all repos
## clone the repo into ~/code and run the setup script
```
xcode-select --install || \
mkdir ~/code && cd ~/code && git clone https://github.com/danielkoo/mac-dev-playbook.git && \
cd mac-dev-playbook && bootstrap/run.sh
```
