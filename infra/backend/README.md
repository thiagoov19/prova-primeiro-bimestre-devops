# Backend remoto do Terraform

O Terraform utiliza um backend remoto na AWS para armazenar o state no Amazon S3 e
uma tabela do DynamoDB para o mecanismo de lock. O bucket e a tabela foram criados
antes da inicialização do backend, pois precisam existir para que o Terraform
possa utilizá-los.

## Recursos utilizados

| Recurso | Nome | Configuração |cd ~/prova-primeiro-bimestre-devops
git branch --show-current
git status --short
|---|---|---|
| Bucket S3 | `tfstate-prova-devops-227863838598-thiagoov19` | Região `us-east-1`, versionamento habilitado e acesso público bloqueado |
| Tabela DynamoDB | `terraform-locks` | Chave de partição `LockID` do tipo String e modo `PAY_PER_REQUEST` |

## Configuração do backend

A configuração está em `infra/versions.tf`:

- **Bucket:** `tfstate-prova-devops-227863838598-thiagoov19`
- **Chave do state:** `prova/terraform.tfstate`
- **Região:** `us-east-1`
- **Tabela de lock:** `terraform-locks`
- **Criptografia do state:** habilitada

## Criação dos recursos pela AWS CLI

Os comandos abaixo representam a configuração usada. Confira-os com o histórico do terminal e ajuste se necessário antes de entregar.

```bash
BUCKET=tfstate-prova-devops-227863838598-thiagoov19
REGION=us-east-1

aws s3api create-bucket \
  --bucket "$BUCKET" \
  --region "$REGION"

aws s3api put-bucket-versioning \
  --bucket "$BUCKET" \
  --versioning-configuration Status=Enabled

aws s3api put-public-access-block \
  --bucket "$BUCKET" \
  --public-access-block-configuration \
  BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region "$REGION"
```

## Verificação

O versionamento do bucket e o estado da tabela podem ser consultados com:

```bash
aws s3api get-bucket-versioning \
  --bucket tfstate-prova-devops-227863838598-thiagoov19 \
  --region us-east-1

aws dynamodb describe-table \
  --table-name terraform-locks \
  --region us-east-1 \
  --query "Table.TableStatus"
```

## Observação sobre o destroy

O comando `terraform destroy` remove os recursos gerenciados pelo state do projeto,
mas não remove o bucket S3 nem a tabela DynamoDB usados pelo backend remoto. Esses
recursos precisam permanecer disponíveis para armazenar e bloquear o state.