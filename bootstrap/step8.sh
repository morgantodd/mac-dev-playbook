
ln -s ~/code/github/personal/dotfiles/.bash ~/

if [[ $(arch) == "i386" ]]; then
  BREW_PATH=/usr/local/bin/brew
elif [[ $(arch) == "arm64" ]]; then
  BREW_PATH=/opt/homebrew/bin/brew
else
  echo "Unknown architecture $(arch); only i386 and arm64 are supported"
  exit 1
fi

echo "eval \"$(${BREW_PATH} shellenv)\"" >> ~/.bashrc
source ~/.bashrc

# source this so we can run asdf
source $(brew --prefix asdf)/libexec/asdf.sh


# generate ssh key so I can clone from chuck
# brew install cntlm
# copy cntlm.conf from OneDrive
#export http_proxy=http://localhost:3128
#export https_proxy=http://localhost:3128
#export HTTP_PROXY=http://localhost:3128
#export HTTPS_PROXY=http://localhost:3128
#git config --global http.proxy http://localhost:3128
#git config --global https.proxy http://localhost:3128

# these are the minimum versions that are built for Apple Silicon/arm64
VAULT_VERSION=1.8.0
TERRAFORM_VERSION=1.0.2
if [[ $(arch) == "i386" ]]; then
    VAULT_VERSION=0.11.6
    TERRAFORM_VERSION=0.11.3
fi
asdf plugin add vault
asdf install vault $VAULT_VERSION
asdf global vault $VAULT_VERSION
asdf plugin add terraform
asdf install terraform $TERRAFORM_VERSION
asdf global terraform $TERRAFORM_VERSION

asdf plugin add golangci-lint
asdf install golangci-lint 1.43.0
asdf global golangci-lint 1.43.0

asdf plugin add snyk
asdf install snyk latest
asdf global snyk latest

# copy snyk api to ~/.config/configstore/snyk.json

# copy ca-certs.pem from OneDrive to /etc/ssl/certs/ca-certificates.crt


####################
# to build devlabsctl on the mac
asdf plugin add golang
asdf install golang 1.16
asdf global golang 1.16
go get -u github.com/go-bindata/go-bindata/...
go install github.com/jstemmer/go-junit-report@latest

# get a nice git prompt in bash:
if [[ -d ~/.bash-git-prompt ]]; then
    cd ~/.bash-git-prompt && git pull && cd -
else
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
fi

####################

# vim
if [[ ! -d ~/.vim/autoload ]]; then
    mkdir -p ~/.vim/autoload
    pushd ~/.vim/autoload
    curl -O https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

if [[ -d ~/.tmux/plugins/tpm ]]; then
    cd ~/.tmux/plugins/tpm && git pull && cd -
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
