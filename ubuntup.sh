#!/bin/bash

# Atualizar pacotes do sistema
echo "Atualizando pacotes..."
sudo apt update -y
sudo apt upgrade -y

# Instalar Node.js
echo "Instalando Node.js..."
sudo apt install -y nodejs

# Instalar NVM (Node Version Manager)
echo "Instalando NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Carregar o NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Instalar Node.js 16 com NVM
echo "Instalando Node.js 16 com NVM..."
nvm install 16

# Instalar VS Code
echo "Instalando Visual Studio Code..."
sudo snap install --classic code

# Instalar Docker e configurar para rodar sem sudo
echo "Instalando Docker..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Adicionar o usuário ao grupo Docker para rodar sem sudo
echo "Configurando Docker para rodar sem sudo..."
sudo usermod -aG docker $USER

# Instalar Git
echo "Instalando Git..."
sudo apt install -y git

# Solicitar nome de usuário e e-mail para o Git
echo "Informe o seu nome de usuário do Git:"
read git_user_name
echo "Informe o seu e-mail do Git:"
read git_user_email

# Configurar Git com nome de usuário e e-mail
echo "Configurando Git..."
git config --global user.name "$git_user_name"
git config --global user.email "$git_user_email"

# Instalar Insomnia
echo "Instalando Insomnia..."
sudo snap install insomnia

# Instalar Steam
echo "Instalando Steam..."
sudo apt install -y steam

# Caminho para a pasta Documents
documents_path="$HOME/Documents"

# Verificar se a pasta Documents existe
if [ -d "$documents_path" ]; then
    # Criar as pastas solicitadas
    echo "Criando pastas em $documents_path..."
    mkdir -p "$documents_path/work/Joga"
    mkdir -p "$documents_path/personal"

    echo "Pastas criadas com sucesso!"
else
    echo "Pasta Documents não encontrada!"
fi

echo "Setup completo! Reinicie seu terminal para aplicar as alterações do Docker."
