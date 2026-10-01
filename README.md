# API de Reservas — TechNova

**Aluno:** Thiago Marques Bueno
**RA:** 6325304
**Disciplina:** DevOps — ADS 2026.2

## Descrição

API de Reservas (Node.js/Express + PostgreSQL), containerizada com Docker,
orquestrada localmente com Docker Compose e provisionada na AWS com Terraform
modularizado (VPC, Security Groups, EC2, RDS) e remote state (S3 + DynamoDB).


## Sobre o projeto

API REST de reservas desenvolvida em Node.js e Express, com PostgreSQL como banco de dados. O projeto pode ser executado localmente com Docker Compose e tem infraestrutura AWS definida com Terraform modularizado e state remoto.

## Funcionalidades

- Verificação de saúde da aplicação em `GET /health`.
- Listagem de reservas em `GET /reservas`.
- Criação de reservas em `POST /reservas`.
- Atualização de reservas em `PUT /reservas/:id`.
- Remoção de reservas em `DELETE /reservas/:id`.
- Persistência dos dados em PostgreSQL.

As reservas utilizam os campos `cliente`, `data` e `status`. O status é opcional e, quando não informado, utiliza `pendente`.

Exemplo de corpo para criar uma reserva:


json
Copiar

{
  "cliente": "João",
  "data": "2026-11-05",
  "status": "pendente"
}




## Estrutura do repositório

- `app/`: código-fonte da API e Dockerfile.
- `docker-compose.yml`: configuração para execução local da API e do PostgreSQL.
- `infra/`: configuração Terraform e módulos de infraestrutura.
- `infra/backend/README.md`: documentação do backend remoto.
- `evidencias/`: prints e registros dos testes, recursos provisionados e limpeza da infraestrutura.

## Executar localmente

Pré-requisitos: Docker e Docker Compose instalados.

1. Crie o arquivo de ambiente a partir do exemplo:

   ```bash
   cp .env.example .env
   ```

2. Edite `.env` e substitua a senha de exemplo por uma senha local.

3. Construa e inicie os serviços:

   ```bash
   docker compose up -d --build
   ```

4. Verifique a API:

   ```bash
   curl http://localhost:3000/health
   ```

A API e o banco são executados pelo Docker Compose. O volume `pgdata` preserva os dados do PostgreSQL entre reinicializações. Para parar os serviços:


bash
Copiar

docker compose down




## Infraestrutura AWS

A infraestrutura foi definida com Terraform para a região `us-east-1`. A solução inclui VPC, subnets públicas e privadas, security groups, uma instância EC2 e um banco RDS PostgreSQL em subnets privadas.

O state do Terraform utiliza backend remoto em S3, com uma tabela DynamoDB para lock. A configuração e os recursos do backend estão documentados em `infra/backend/README.md`.

Para operar a infraestrutura, são necessárias credenciais temporárias válidas do AWS Academy Learner Lab e a senha do banco fornecida por variável de ambiente. Não coloque credenciais ou senhas em arquivos versionados.


bash
Copiar

cd infra
export TF_VAR_db_password='SUBSTITUA_POR_UMA_SENHA_VALIDA'
terraform init
terraform plan
terraform apply




Após validar os outputs e a aplicação, a infraestrutura de prova foi destruída com:


bash
Copiar

terraform destroy




Os recursos compartilhados usados pelo backend remoto — bucket S3 e tabela DynamoDB — não fazem parte dos recursos destruídos pelo Terraform do projeto.

## Segurança e arquivos locais

Arquivos com credenciais, senhas, estado local e artefatos de execução não devem ser publicados. O `.gitignore` exclui arquivos como `.env`, arquivos de state, `terraform.tfvars`, `tfplan` e chaves privadas.

Consulte `.env.example` para conhecer as variáveis necessárias à execução local; não use senhas reais nesse arquivo.