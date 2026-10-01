# Relatório do Processo

**Ferramenta de IA utilizada:** Inner AI Fusion, assistente de IA da plataforma Inner AI. Usei a ferramenta como apoio para esclarecer comandos, revisar etapas e organizar a documentação. O conteúdo abaixo descreve o processo com base no trabalho realizado e deve ser conferido pelo aluno antes da entrega.

## Questão 1 — A Jornada Completa (Aulas 01 a 07)

Comecei organizando o projeto da API de Reservas em um repositório Git.
Usei branches e commits para registrar as etapas de implementação e infraestrutura.
A API foi desenvolvida em Node.js com Express e conectada a um banco PostgreSQL.
Implementei as operações de consulta, criação, atualização e remoção de reservas.
Também disponibilizei a rota `/health` para verificar se a API estava respondendo.
Depois preparei o Dockerfile multi-stage e conferi que a aplicação executava como usuário não-root.
Usei Docker Compose para subir a API junto com o PostgreSQL em ambiente local.
Testei o CRUD localmente e confirmei a persistência dos dados no volume do banco.
Em seguida organizei a infraestrutura Terraform em módulos, separando responsabilidades.
A configuração criou VPC, subnets, security groups, RDS em rede privada e EC2 em rede pública.
Configurei o state remoto em S3 e o lock com DynamoDB antes de inicializar o Terraform.
Essa ordem ajudou a validar primeiro a aplicação e os containers antes de levar a solução para a nuvem.
Por fim, validei a API implantada na AWS, registrei evidências e executei o destroy dos recursos do projeto.
As aulas 01 a 07 apareceram na combinação de versionamento, aplicação, containers, infraestrutura como código, modularização, nuvem e validação; ajusto esta relação conforme os tópicos específicos tratados em cada aula.

## Questão 2 — O Processo com IA como Copiloto

Usei o Inner AI Fusion como ferramenta de apoio durante o desenvolvimento e a organização da entrega.
Pedi ajuda para interpretar etapas e comandos de Git e Terraform, conferir a sequência de trabalho e preparar documentação.
Também usei a conversa para revisar o que ainda faltava depois do deploy e depois do destroy.
A IA ajudou a decompor tarefas grandes em passos menores e a explicar mensagens do terminal.
Por exemplo, a saída do Git mostrou que `infra/backend/README.md` ainda não estava versionado.
A assistência identificou que o arquivo real se chamava `README.MD`, diferença importante em um sistema Linux.
Isso evitou tratar o `git push` sem alterações como se fosse um erro no envio.
A IA também ajudou a interpretar que `tfplan` estava ignorado pelo `.gitignore` e não aparecia entre os arquivos rastreados.
Foi necessário conferir os comandos e resultados diretamente no terminal, pois a resposta da IA não substitui a validação do ambiente.
Também precisei revisar nomes de arquivos, branches e o estado real do repositório antes de executar comandos.
Não usei Kiro Spec no processo; portanto, não apliquei formalmente um fluxo de requisitos, design e tarefas dessa ferramenta.
Em comparação com fazer tudo manualmente, a IA economizou tempo na explicação de erros e na estruturação dos próximos passos.
Por outro lado, respostas precisam ser conferidas: comandos ou detalhes sugeridos podem não corresponder exatamente ao ambiente ou ao enunciado.
A decisão final de executar, validar e documentar cada etapa permaneceu sob minha responsabilidade.

## Questão 3 — Infraestrutura, Segurança e o Learner Lab

A infraestrutura foi criada na região `us-east-1` do AWS Academy Learner Lab.
O Terraform foi organizado em módulos para separar rede, regras de segurança, banco de dados e instância de aplicação.
A VPC contém subnets públicas e privadas para separar componentes com diferentes necessidades de acesso.
A EC2 foi colocada na subnet pública para permitir o acesso necessário à aplicação e à administração dentro das regras configuradas.
O RDS PostgreSQL ficou em subnets privadas para não expor diretamente o banco à internet.
Os security groups controlam as comunicações entre os componentes e limitam o acesso administrativo conforme a configuração do projeto.
Usei o perfil disponibilizado pelo laboratório, `LabInstanceProfile`, e a role autorizada `LabRole`.
Essa abordagem respeitou as restrições do Learner Lab, sem criar uma role ou um usuário IAM próprio.
As credenciais do laboratório são temporárias e incluem Session Token, por isso precisam estar válidas durante as operações.
Também foi necessário usar a região autorizada e considerar as permissões limitadas do ambiente acadêmico.
O state remoto foi armazenado em um bucket S3 com versionamento e bloqueio de acesso público.
A tabela DynamoDB `terraform-locks` foi configurada para auxiliar no bloqueio do state durante operações do Terraform.
Após validar a implantação e registrar as evidências, destruí os recursos provisionados pelo projeto.
O bucket e a tabela do backend permaneceram, pois são recursos necessários para armazenar e bloquear o state remoto.
Esse desenho separa a aplicação do banco, reduz a exposição do RDS e respeita as limitações do ambiente de laboratório.

## Questão 4 — Validação e Responsabilidade

Antes de executar `terraform apply`, revisei a configuração e conferi as variáveis e os arquivos que seriam utilizados.
Usei `terraform init` para inicializar o projeto com o backend remoto configurado.
Usei `terraform plan` para visualizar as alterações propostas antes de aplicá-las.
Conferi se a região configurada era `us-east-1` e se os módulos correspondiam à arquitetura pretendida.
Também revisei os security groups, as subnets e a separação entre a EC2 pública e o RDS privado.
A senha do banco foi fornecida por variável de ambiente e não deveria ser salva no repositório.
Depois do apply, consultei os outputs e o state para verificar os recursos criados.
Validei o health check e testei operações de CRUD na API implantada, conferindo a integração com o banco.
Registrei evidências da API, EC2, RDS, rede, security groups, S3, DynamoDB e do state.
Antes da entrega, confirmei que o `tfplan` estava ignorado e que não estava sendo rastreado pelo Git.
Também executei o destroy e verifiquei que o state do projeto ficou vazio e que não havia EC2 em execução nem RDS do projeto.
Aceitar código de IA sem revisão poderia criar recursos públicos indevidamente, regras de rede excessivas ou custos desnecessários.
Também poderia expor senhas, credenciais ou arquivos de state e deixar recursos ativos após a prova.
A evolução de Git para Docker, Terraform e módulos ensinou a controlar mudanças, repetir ambientes e separar responsabilidades.
Esse conhecimento permite usar IA como copiloto, mas exige compreender, revisar e testar o que ela sugere antes de aplicar.