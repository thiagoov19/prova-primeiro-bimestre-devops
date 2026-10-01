# Registro de uso de IA

- **Aluno:** Thiago
- **RA:** 6325304
- **Ferramenta utilizada:** Inner AI Fusion
- **Objetivo:** usar a IA como apoio durante o desenvolvimento, a implantação, a validação e a documentação da prova de DevOps.

## Prompts e solicitações — registro resumido

> Os itens abaixo resumem os pedidos feitos durante o trabalho. Não são transcrições literais de todo o histórico.

1. **Organização do Terraform:** pedi ajuda para reorganizar os arquivos de infraestrutura dentro de `infra/`, seguindo a estrutura solicitada no enunciado.

2. **Módulo de RDS:** pedi apoio para configurar o banco PostgreSQL em subnets privadas e integrar o módulo à infraestrutura.

3. **Módulo de EC2:** pedi ajuda para configurar a instância, o `user_data` e a composição dos módulos Terraform.

4. **Backend remoto:** pedi orientação sobre o state remoto com S3 e o lock com DynamoDB, incluindo documentação e comandos de verificação.

5. **Credenciais do Learner Lab:** pedi ajuda para considerar as credenciais temporárias, a região `us-east-1` e o uso do `LabRole`/`LabInstanceProfile`, sem criar uma role própria.

6. **Variáveis sensíveis:** pedi orientação para passar a senha do banco ao Terraform sem versioná-la no repositório.

7. **Erro no primeiro apply:** compartilhei que o primeiro `terraform apply` falhou por causa da senha do RDS e pedi ajuda para entender a falha e corrigir a configuração.

8. **Deploy e validação na AWS:** pedi ajuda para organizar e validar os testes da API implantada, incluindo o health check e as operações de CRUD.

9. **Evidências da infraestrutura:** pedi apoio para organizar a documentação das evidências do deploy, dos recursos AWS, dos outputs e do state.

10. **Terraform destroy:** pedi orientação para registrar e conferir a destruição dos recursos do projeto e a limpeza após os testes.

11. **README do backend:** informei que havia enviado o README do backend e pedi orientação sobre o próximo passo.

12. **Conferência do merge:** compartilhei saídas de comandos Git e pedi ajuda para conferir a integração da branch `feature/terraform` na `main`.

13. **Nome do arquivo README:** compartilhei o estado do repositório e a listagem de arquivos do backend para diagnosticar o nome `README.MD` e conseguir adicioná-lo ao Git.

14. **Verificação do `tfplan`:** compartilhei as saídas de `git ls-files infra/tfplan` e `git check-ignore -v infra/tfplan` para confirmar se o plano estava versionado ou ignorado.

15. **Commit e push:** depois de criar os arquivos, pedi orientação sobre os próximos passos para adicioná-los ao Git, fazer commit e enviar as alterações.

16. **Terminal aparentemente travado:** compartilhei a saída do `git diff --cached` e informei que o terminal tinha parado durante os comandos de commit e push.

17. **Revisão do repositório:** forneci o endereço do repositório público e pedi uma conferência geral antes de abrir o pull request.

## Como a IA foi utilizada

Usei a IA para interpretar mensagens de erro, entender saídas de comandos, organizar as etapas do trabalho e preparar documentação. As sugestões foram conferidas com os arquivos e comandos do projeto. A execução dos comandos, a validação da infraestrutura, os testes e a decisão final sobre as alterações foram feitos por mim.

## Limitação deste registro

Este documento é um resumo reconstruído com base no histórico disponível e não uma transcrição literal completa. Para entregar uma lista literal dos prompts, é necessário consultar e copiar o histórico completo da conversa na plataforma. Não foram acrescentados prompts apresentados como citações exatas.