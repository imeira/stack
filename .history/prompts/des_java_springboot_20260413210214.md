Por favor, siga o criterio estabelecido abaixo e resolva o code challenge (desafio) proposto abaixo.

Você é um desenvolvedor de software sênior com expertise em containers utilizando docker, Java 17, Spring Framework e Arquitetura Hexagonal. utilizando as melhores praticas e padroes de projeto que fique menos acoplamento. Sua tarefa é resolver um problema complexo de algoritmo, garantindo um código limpo, modular e testável. Seu código será avaliado por engenheiros de software experientes, então siga as melhores práticas de desenvolvimento.

Requisitos Gerais:

Utilize docker, java 17, Maven e o Spring Framework para facilitar a injeção de dependências e configuração.

Configuração Docker e containerização. Crie um arquivo docker-compose.yml contendo toda a infraestrutura necessária para executar o desafio.

A aplicação deve estar 100% funcional ao chamar a classe Main.

Use Arquitetura Hexagonal (Ports and Adapters) para garantir baixo acoplamento e alta coesão.

Testabilidade: A lógica de decisão deve ser testável de forma isolada, com cobertura de testes unitários e testes de integração para diferentes cenários.
Utilize doccker compose para o testes. Use Wiremock para simular as integracoes e adaptadores.

Escalabilidade: A arquitetura deve permitir o crescimento do número de regras, tipos de transações e volume de dados sem perda significativa de desempenho.

Manutenibilidade: O código deve ser modular, legível e de fácil manutenção, permitindo ajustes e inclusão de novas regras de negócio com o mínimo de impacto.

Flexibilidade e Configurabilidade: As funcionalidades devem ser facilmente configuráveis (por exemplo, via arquivos JSON, banco de dados ou interface administrativa)

Documente as classes e métodos principais para facilitar a leitura e manutenção.

Modelagem dos Endpoints:

Espera-se que os participantes realizem a modelagem completa dos endpoints das APIs, incluindo:

• Definição das rotas (URLs)

• Estrutura dos headers

• Formato do body das requisições e respostas

• Utilização adequada dos códigos de status HTTP

Implementação minima de Segurança JWT no header das chamadas das apis para os controllers. Exponha um endpoint get /auth que devolta um token jwt valido com base no client_id da app. O Objetivo desse endpoint get é para ficar facil testar as rotas pela interface do swagger.

Requisitos de Qualidade do Código

Código modular e seguindo os princípios SOLID.

Separação clara entre domínio, aplicação e infraestrutura.

Cobertura mínima de 80% em testes unitários e de integração.

Código documentado utilizando JavaDoc e Swagger.

Configure o swagger no springboot para documentacao das rotas (gerando uma interface html do swager e adicione no readme como acessar)

No arquivo README.md, documente de forma clara e objetiva:

• O método escolhido para interação com o sistema (ex: API REST, etc.).

• Como executar o sistema (ex: comandos para subir as aplicações).

• Como testar o sistema (ex: endpoints, dados de exemplo, ferramentas recomendadas).

• Qualquer outra informação relevante que facilite o entendimento e uso do projeto

• Detalhes sobre a solução, gostaríamos de saber qual foi o seu racional nas decisões.

• Caso algo não esteja claro e você precisou assumir alguma premissa quais foram e o que te motivou a tomar essas decisões.

Adicione um "Desenho de solução do Case" na raiz do projeto. deve ser um arquivo no formato .drawio ou .tsx e neste desenho Queremos observar, por exemplo: Se a solução suportaria um alto volume de transações por segundo (TPS); Como ela se comportaria diante de falhas em serviços ou microsserviços; Se há preocupação com resiliência, escalabilidade e desempenho.

Abaixo os pontos que daremos mais atenção na avaliação do desafio:

• Arquitetura utilizada

• Abstração, acoplamento, extensibilidade e coesão

• Análise assintótica, utilizando a notação Big O

• Design Patterns (Ex: Singleton, Strategy, Factory, etc.)

• Microservices Patterns (Ex: CQRS, SAGA, ACL, etc.)

• Clean Architecture

• Clean Code

• SOLID

• Testes de unidade e integração

• Cobertura de testes (Code Coverage)

• Documentação da Solução no README.md

### ATENÇÃO:

seguindo as instruções acima segue abaixo o code challenge (desafio) proposto que deve ser implementado:

Implemente uma rota HTTP que:
Atenda uma chamada de Um sistema em Cloud (com serviços AWS) que realize o cancelamento de um Pix agendado, através da chamada pelo aplicativo do celular para uma rota http.

Volume: 20 mil transações por dia
Disponível: 24/7
Tempo de resposta: até um segundo

Requisitos online:
Atualizar a situação do agendamento para “Cancelado”
Gerar comprovante para o cliente

Requisito assíncrono:
Alterar o extrato para excluir o lançamento futuro
