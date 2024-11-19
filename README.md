# my_docker_compose

Este repositório contém configurações para orquestração de contêineres usando Docker Compose, desenvolvido para fins de estudo pessoal.

## Descrição

O repositório inclui exemplos de como configurar ambientes isolados e orquestrar múltiplos contêineres para diversos estudos. Entre os exemplos estão serviços como **Airflow**, **Kafka**, **Hadoop**, **Spark**, e bancos de dados **NoSQL**, todos configurados com Docker Compose.

## Estrutura do Repositório

- `docker-compose.yaml`: Arquivo de configuração principal do Docker Compose para orquestrar os contêineres.
- `setup.sh`: Script para configuração inicial do ambiente.
- Pastas como `Airflow`, `Kafka`, `Hadoop`, etc., contêm arquivos de configuração específicos para cada serviço.

## Como Usar

1. Clone este repositório:
   ```bash
   git clone https://github.com/rafaelladuarte/my_docker_compose.git
   cd my_docker_compose
   ```

2. Execute o Docker Compose dentro da pasta do serviço desejado:
   ```bash
   docker-compose up -d
   ```

Isso irá subir todos os serviços configurados no arquivo `docker-compose.yaml`.

## Requisitos

- Docker
- Docker Compose

## Contribuindo

Se você encontrar problemas ou tiver sugestões de melhorias, fique à vontade para abrir uma **issue** ou fazer um **pull request**.

## Licença

Este projeto está sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

