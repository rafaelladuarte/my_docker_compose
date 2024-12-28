#!/bin/bash
echo "🧹 Iniciando limpeza completa do Docker..."

# Parar todos os containers em execução
echo "⏹️ Parando todos os containers..."
docker stop $(docker ps -aq) 2>/dev/null
echo "✅ Containers parados"

# Remover todos os containers
echo "🗑️ Removendo todos os containers..."
docker rm $(docker ps -aq) 2>/dev/null
echo "✅ Containers removidos"

# Remover todas as imagens
echo "🖼️ Removendo todas as imagens..."
docker rmi $(docker images -q) -f 2>/dev/null
echo "✅ Imagens removidas"

# Remover todos os volumes
echo "💾 Removendo todos os volumes..."
docker volume rm $(docker volume ls -q) 2>/dev/null
echo "✅ Volumes removidos"

# Recriar cache do docker
echo "🗄️ Recriando cache do docker..."
docker system prune -a -f 2>/dev/null
echo "✅ Cache recriado"

# Mostrar status atual
echo -e "📊 Status atual do Docker:"
echo "📦 Containers:"
docker ps -a
echo -e "\n🖼️ Imagens:"
docker images
echo -e "\n💾 Volumes:"
docker volume ls
echo -e "\n🌐 Redes:"
docker network ls

echo "🔁 Reiniciando docker..."
sudo systemctl restart docker -f 2>/dev/null

echo "🎉 Limpeza completa finalizada!"
echo "🔧 Recursos não utilizados removidos"
