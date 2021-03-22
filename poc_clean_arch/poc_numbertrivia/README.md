# O projeto que vamos construir

Vamos construir um aplicativo para obter fatos interessantes sobre números - um aplicativo Number Trivia.

Esse app possui todos os componentes principais, como obtenção de dados de uma API, cache local, tratamento de erros, validação de entrada e muito mais. Quanto ao gerenciamento de estado, será feito com bloc.

[API](http://numbersapi.com/#42)

# Flutter Clean Architecture Proposal ™ da Reso Coder

![Clean-Architecture-Flutter-Diagram (1)](https://user-images.githubusercontent.com/61892998/111909537-71fcdd00-8a3c-11eb-9cff-330351a1ff28.png)

**Explicação e Organização do Projeto**
Cada "recurso" do aplicativo, como obter algumas curiosidades interessantes sobre um número, será dividido em 3 camadas - presentation , domínio e dados. O aplicativo que estamos construindo terá apenas um recurso.

![number_trivia-feature](https://user-images.githubusercontent.com/61892998/111909554-8c36bb00-8a3c-11eb-961b-3682a50f453c.png)

# Presentation

[Tutorial parte 1](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)

Isso é o que você está acostumado com a arquitetura "impura" do Flutter. Obviamente, você precisa de  widgets  para exibir algo na tela. Esses widgets então  despacham eventos  para o  Bloc  e ouvem os  estados  (ou um equivalente se você não usar o Bloc para gerenciamento de estados).

Observe que o "Holder Logic Holder" (por exemplo, Bloc) não faz muito sozinho. Ele delega todo o seu trabalho aos  casos de uso. No máximo, a camada de apresentação trata da conversão e validação de entrada básica.

# Domain

O domínio  é a camada interna que não deve ser suscetível aos caprichos de alterar as fontes de dados ou portar nosso aplicativo para o Angular Dart. Ele conterá apenas a lógica de negócios  principal  (casos de uso) e  objetos de negócios  (entidades). Deve ser totalmente  independente de todas as outras camadas.

Casos de uso  são classes que encapsulam toda a lógica de negócios de um caso de uso específico do aplicativo (por exemplo, Get Concrete NumberTrivia ou Get Random NumberTrivia).

Mas, como a  camada de domínio  é completamente independente quando obtém dados de um Repositório , que é da camada de dados ? Você vê aquele gradiente colorido chique para o Repositório ? Isso significa que ele pertence a ambas as camadas ao mesmo tempo. Podemos fazer isso com inversão de dependência .

Essa é apenas uma maneira elegante de dizer que criamos uma classe abstrata Repositório definindo um contrato do que o Repositório deve fazer - isso vai para a  camada de domínio . Dependemos então do “contrato” do Repositório definido no domínio , sabendo que a própria implementação do Repositório  na  camada de dados irá cumprir este contrato.

O princípio de inversão de dependência  é o último dos princípios SOLI D. Ele basicamente afirma que os limites entre as camadas devem ser tratados com interfaces (classes abstratas no Dart).

Não haverá muita lógica de negócios para executar no aplicativo, já que estamos apenas exibindo fatos numéricos interessantes. Quanto aos objetos de negócios, haverá uma única entidade bastante enxuta  chamada   NumberTrivia - apenas um número e o texto das curiosidades.

# Data

A  camada de dados  consiste em uma  implementação de Repositório  (o contrato vem da  camada de domínio ) e  fontes de dados  - uma geralmente é para obter dados remotos (API) e a outra para armazenar esses dados em cache. Repositório é onde você decide se deseja retornar dados novos ou armazenados em cache, quando armazená-los em cache e assim por diante.

Você pode notar que  as fontes de dados  não retornam Entidades,  mas sim  Modelos . A razão por trás disso é que transformar dados brutos (por exemplo, JSON) em objetos Dart requer algum código de conversão JSON. Não queremos esse código específico de JSON dentro das Entidades do  domínio - e se decidirmos mudar para XML?

Portanto, criamos   classes Model que  estendem Entities e adicionam alguma funcionalidade específica ( toJson , fromJson ) ou campos adicionais, como ID do banco de dados, por exemplo.

O RemoteDataSource executará solicitações HTTP GET na API do Numbers . LocalDataSource simplesmente armazenará os dados em cache usando o  pacote shared_preferences .

Essas duas fontes de dados serão "combinadas" em NumberTriviaRepository,  que será a única fonte de verdade para os dados interessantes de curiosidades sobre números.

A política de cache será muito simples. Se houver uma conexão de rede, sempre obtenha os dados da API e os armazene em cache. Então, se não houver rede, retorne os dados em cache mais recentes.