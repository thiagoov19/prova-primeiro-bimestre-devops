# Entrega — Prova Prática de DevOps

- **Aluno:** Thiago
- **RA:** 6325304
- **Projeto:** API de Reservas

## Itens entregues

- API REST em Node.js e Express com operações CRUD e rota de health check.
- Integração com PostgreSQL.
- Dockerfile e configuração Docker Compose para execução local.
- Infraestrutura AWS definida com Terraform e organizada em módulos.
- Backend remoto Terraform em S3, com DynamoDB para lock.
- Evidências dos testes, da infraestrutura provisionada e da execução do destroy.
- README com instruções do projeto.
- Relatório do processo, incluindo o uso de ferramenta de IA.

## Validações realizadas

A API foi executada localmente e na AWS. Foram testados o health check e os endpoints de reservas. Também foram conferidos recursos da infraestrutura e as evidências do state remoto. Ao final, os recursos do projeto foram destruídos e a limpeza foi verificada.

## Observações

O bucket S3 e a tabela DynamoDB do backend remoto foram mantidos para armazenar e bloquear o state, conforme a função deles. Credenciais, senhas, arquivos de state e outros arquivos sensíveis não devem ser incluídos na entrega.

O pull request da entrega deve ser aberto no repositório da disciplina, no caminho `entregas/provaPrimeiroBi/6325304/`, somente na data permitida pelo enunciado.