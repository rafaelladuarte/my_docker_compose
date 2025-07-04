#!/bin/bash

# Atualiza o sistema e instala pacotes essenciais
echo "🔄 Atualizando sistema e instalando pacotes essenciais..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential curl git

# Instalar tmux
echo "🖥️ Instalando tmux..."
sudo apt install -y tmux

# Instalação do Git
echo "🔧 Instalando Git..."
sudo apt install -y git

# Configuração do Git
echo "🦝 Configurando Git..."
# Defina seu nome e email do Git aqui
GIT_USER_NAME="Seu Nome"
GIT_USER_EMAIL="seuemail@dominio.com"
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global core.editor "nano"
git config --global credential.helper cache
git config --global push.default simple

# Instalação do Docker
echo "🐳 Instalando Docker..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce

# Adiciona o usuário ao grupo 'docker' para evitar usar sudo
echo "🔐 Configurando Docker para rodar sem sudo..."
sudo usermod -aG docker $USER

# Instalação do Docker Compose
echo "🦑 Instalando Docker Compose..."
sudo rm /usr/local/bin/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.19.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verifica a instalação do Docker Compose
echo "🔍 Verificando instalação do Docker Compose..."
docker-compose --version

# Instalação do Pyenv
echo "🐍 Instalando Pyenv..."
sudo curl https://pyenv.run | bash

# Adiciona as configurações do Pyenv ao arquivo .bashrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

# Recarrega o .bashrc para aplicar as mudanças
source ~/.bashrc

# Instalando dependências do Python para o Pyenv
sudo apt update
sudo apt install \
    build-essential \
    curl \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    llvm \
    make \
    tk-dev \
    wget \
    xz-utils \
    zlib1g-de

# Instalação de uma versão específica do Python usando Pyenv
PYTHON_VERSION=3.13.1
pyenv update
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION

# Atualizando o pip
pip install --upgrade pip

# Instalação do Pipenv
echo "📦 Instalando Pipenv..."
pip install --user pipenv

# Configura o Pipenv no PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Instalando o node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

# Em vez de reiniciar a concha ou shell
\. "$HOME/.nvm/nvm.sh"

# Descarregar e instalar a Node.js:
nvm install 22

# Consultar a versão da Node.js:
node -v
nvm current

# Consultar a versão da npm:
npm -v

# Exibe mensagem de conclusão
echo "🎉 Configuração concluída!"
