# poc_clean_arch

![Screenshot (25)](https://user-images.githubusercontent.com/61892998/111867718-9d0c0180-8954-11eb-98d1-4ad4401f36df.png)


A Clean Architecture foi criada por Robert C. Martin e promovida em seu livro Clean Architecture: A Craftsman’s Guide to Software Structure. Assim como outras filosofias de design de software, a Clean Architecture tenta fornecer uma metodologia a ser usada na codificação, a fim de facilitar o desenvolvimento códigos, permitir uma melhor manutenção, atualização e menos dependências.

Um objetivo importante da Clean Architecture é fornecer aos desenvolvedores uma maneira de organizar o código de forma que encapsule a lógica de negócios, mas mantenha-o separado do mecanismo de entrega.

A Clean Architecture não foi o primeiro conceito de design de software que apareceu, ao longo do tempo as arquiteturas de software vêm sendo criadas com um mesmo objetivo de solucionar um princípio de design conhecido como SoC (separation of concerns).

As vantagens de utilizar uma arquitetura em camadas são muitas, porém podemos pontuar algumas:

**Testável**. As regras de negócios podem ser testadas sem a interface do usuário, banco de dados, servidor ou qualquer outro elemento externo.
**Independente da interface do usuário**. A interface do usuário pode mudar facilmente, sem alterar o restante do sistema. Uma UI da Web pode ser substituída por uma UI do console, por exemplo, sem alterar as regras de negócios.
**Independente de banco de dados**. Você pode trocar o Oracle ou SQL Server, por Mongo, BigTable, CouchDB ou qualquer outro. Suas regras de negócios não estão vinculadas ao banco de dados.
**Independente de qualquer agente externo**. Na verdade, suas regras de negócios simplesmente não sabem nada sobre o mundo exterior, não estão ligadas a nenhum Framework.

A separação de camadas poupará o desenvolvedor de muitos problemas futuros com a manutenção do software, a regra de dependência bem aplicada deixará seu sistema completamente testável. Quando um framework, um banco de dados, ou uma API se tornar obsoleta a substituição de uma camada não será uma dor de cabeça, além de garantir a integridade do core do projeto. Para mais detalhes de cada camada da Clean Architecture podemos ver no blog do Uncle Bob.

“Good architecture makes the system easy to understand, easy to develop, easy to maintain, and easy to deploy. The ultimate goal is to minimize the lifetime cost of the system and to maximize programmer productivity.”
**― Robert C. Martin, Clean Architecture**

Uma solução arquitetural dessas se mostra muito eficiente, porém para cada bônus há um ônus, na prática a criação de um modelo estrutural desse porte mostra-se um trabalho e tanto no início, ainda mais com as aplicações se reduzindo cada vez mais a níveis de micro-serviços. Também não podemos permitir que qualquer aplicação seja construída sem o mínimo de estrutura e respeito aos princípios do SOLID.

“Good software systems begin with clean code. On the one hand, if the bricks aren’t well made, the architecture of the building doesn’t matter much. On the other hand, you can make a substantial mess with well-made bricks. This is where the SOLID principles come in.”
**― Robert C. Martin, Clean Architecture**

# Conceitos

A ideia por trás do conceito de arquitetura limpa é tornar o **projeto escalável**, fácil de manter e testável, criando camadas separadas e sempre dependendo de abstrações e não de classes concretas.

**Pontos chave**

* Independência de frameworks: Seu projeto nunca pode ser dependente de um framework externo, sempre deve haver uma camada que abstraia a lógica, possibilitando a remoção do framework sem impactar a aplicação.
* Testável: A camada de regra de negócios deve ser testada sem dependência de UI, banco ou serviço da web.
* Independência da UI: Seu sistema não deve estar ciente da existência de uma UI, sendo possível substituir sua interface gráfica por um terminal sem problemas.
* Independência de agentes externos: Suas regras de negócios não devem saber sobre a existência do mundo ao seu redor. Em outras palavras, ela só precisa saber o que precisa para cumprir sua responsabilidade.
# Camadas



![0_iU9Ks05_GTtGh6zV](https://user-images.githubusercontent.com/61892998/111867753-cc227300-8954-11eb-8e24-9ce5c0c1ea9d.jpg)




# SOLID

**S - Princípio de Responsabilidade Única (SRP)**

                Uma classe deve ter um, e apenas um, motivo para mudar.

Quando os requisitos mudam, isso implica que o código deve passar por alguma reconstrução, o que significa que as classes devem ser modificadas. Quanto mais responsabilidades uma classe tiver, mais solicitações de mudança ela receberá e mais difícil será a implementação dessas mudanças. As responsabilidades de uma classe são acopladas umas às outras, visto que mudanças em uma das responsabilidades podem resultar em mudanças adicionais para que as outras responsabilidades sejam tratadas adequadamente por aquela classe.

O que é uma responsabilidade ?!
Uma responsabilidade pode ser definida como um motivo de mudança. Sempre que pensarmos que alguma parte do nosso código é potencialmente uma responsabilidade, devemos considerar separá-la da classe. Digamos que estejamos trabalhando em um projeto que ajuda as pessoas a se tornarem mais ativas em suas comunidades, e o sistema precisa ter integração com a mídia social. Seria uma boa ideia separar a responsabilidade de integração da mídia social das outras partes do sistema, pois devemos estar sempre preparados para mudanças externas.

**O - Princípio aberto-fechado**

    Você deve ser capaz de estender o comportamento de uma classe, sem modificá-lo.

    Este princípio é a base para a construção de código que pode ser mantido e reutilizado. - Robert C. Martin

Como algo pode ser aberto e fechado ?! Uma classe segue o OCP se cumprir estes dois critérios:

**Abrir para extensão**
Isso garante que o comportamento da classe possa ser estendido. Conforme os requisitos mudam, devemos ser capazes de fazer uma classe se comportar de maneiras novas e diferentes, para atender às necessidades dos novos requisitos.

**Fechado para modificação**
O código-fonte de tal classe é imutável, ninguém tem permissão para fazer alterações no código.

**Como alcançamos isso?**

Por meio de **abstrações**. Para poder estender o comportamento de uma classe sem alterar uma única linha de código, precisamos fazer abstrações. Por exemplo, se tivéssemos um sistema que trabalha com diferentes formas como classes, provavelmente teríamos classes como Círculo, Retângulo, etc. Para que uma classe que dependa de uma dessas classes para implementar OCP, precisamos introduzir uma Forma interface/classe. Então, onde quer que tivéssemos injeção de dependência, injetaríamos uma instância de Shape em vez de uma instância de uma classe de nível inferior. Isso nos daria o luxo de adicionar novas formas sem ter que alterar o código-fonte das classes dependentes.

Como sabemos se devemos fazer do Shape uma classe ou uma interface? Para isso, temos o Princípio de Substituição de Liskov, que nos diz quando a herança é adequada. 

**L - Princípio de Substituição de Liskov**

As classes derivadas devem ser substituíveis por suas classes básicas.

        O que se quer aqui é algo como a seguinte propriedade de substituição: Se
        para cada objeto o1 do tipo S houver um objeto o2 do tipo T de modo que para todos os programas P definidos em termos de T, o comportamento de P é inalterado quando o1 é substituído para o2, então S é um subtipo de T. - Barbara Liskov

Vamos visualizar a definição com um estudo de caso. Digamos que temos uma classe Rectangle e uma classe que a estende, Square. Digamos também que Rectangle tenha dois métodos, setWidth e setHeight, que, bem, definem a largura e a altura do retângulo, respectivamente.

O problema é que o comportamento dos dois métodos difere entre as classes Rectangle e Square. A razão para isso é que um Quadrado, por definição matemática, é um Retângulo com altura e largura iguais. Assim, os dois métodos irão alterar o mesmo valor, enquanto para o Retângulo, eles irão alterar a largura e a altura respectivamente, que são valores diferentes um do outro.

Quando estamos usando abstração (princípio aberto-fechado), queremos que os métodos se comportem da mesma forma para cada classe derivada, e não de maneira diferente. Nesse caso, podemos ver claramente que uma classe Square não deve estender a classe Rectangle , porque o comportamento dos métodos herdados é diferente.

**A solução**
Devemos projetar por contrato. O que isso significa é que cada método deve ter pré-condições e pós-condições definidas. As pré-condições devem ser verdadeiras para que um método seja executado e as pós-condições devem ser verdadeiras após a execução de um método.

Suponha que sua classe básica funcione com um membro int. Agora, o seu subtipo exige que o int seja positivo. Isso é pré-condições reforçadas, e agora qualquer código que funcionava perfeitamente bem antes com ints negativos está quebrado.
Da mesma forma, suponha o mesmo cenário, mas a classe base usada para garantir que o membro seria positivo após ser chamado. Em seguida, o subtipo muda o comportamento para permitir ints negativos. O código que funciona no objeto (e assume que a pós-condição é um int positivo) agora é quebrado, pois a pós-condição não é mantida.

Robert C. Martin sugere que é útil documentar (comentários) as pré-condições e pós-condições para cada método.

**I - Princípio de Segregação de Interface**

Crie interfaces refinadas que sejam específicas do cliente.

Os clientes não devem ser forçados a implementar interfaces que não usam. - Robert C. Martin

Em outras palavras, é melhor ter muitas interfaces menores do que menos interfaces mais pesadas.

Por exemplo, digamos que tivéssemos uma interface chamada Animal , que teria os métodos comer, dormir e andar. Isso significaria que teríamos uma interface monolítica chamada Animal, o que não seria a abstração perfeita, pois alguns animais podem voar. 

Quebrando essa interface monolítica em interfaces menores com base na função, obteríamos as interfaces CanEat, CanSleep e CanWalk. Isso possibilitaria a uma espécie comer, dormir e, por exemplo, voar. Uma espécie seria uma combinação de papéis, em vez de ser caracterizada como animal, o que não seria necessariamente a melhor descrição. Em uma escala maior, os microsserviços são um caso muito semelhante, são peças de um sistema separadas por responsabilidades, ao invés de um grande monólito.

Ao quebrar as interfaces, favorecemos a composição em vez de herança e desacoplamento em vez de acoplamento. Nós favorecemos a composição separando por papéis (responsabilidades) e o desacoplamento por não acoplar classes derivadas com responsabilidades desnecessárias dentro de um monólito.

**D - Princípio de Inversão de Dependência**

Depende de abstrações, não de concreções.

    A. Módulos de alto nível não devem depender de módulos de baixo nível. Ambos devem depender de abstrações.
    B. As abstrações não devem depender de detalhes. Os detalhes devem depender de abstrações.
    Robert C. Martin

Digamos que temos um sistema que lida com autenticação por meio de serviços externos, como Google, GitHub, etc. Teríamos uma classe para cada serviço: GoogleAuthenticationService , GitHubAuthenticationService, etc. Agora, digamos que em algum lugar em nosso sistema, precisamos autenticar nosso usuário. Para isso, conforme mencionado, temos diversos serviços disponíveis. Para poder usufruir de todos os serviços, temos duas possibilidades: Ou escrevemos um código que adapta cada serviço ao processo de autenticação ou definimos uma abstração dos serviços de autenticação. A primeira possibilidade é uma solução suja que potencialmente introduzirá dívida técnica no futuro; caso um novo serviço de autenticação deva ser integrado ao sistema, teremos que alterar o código, o que viola o OCP. A segunda possibilidade é muito mais limpa, permite a adição futura de serviços e as alterações podem ser feitas em cada serviço sem alterar a lógica de integração. Definindo um Com a interface AuthenticationService e implementando-a em cada serviço, poderíamos então usar a injeção de dependência em nossa lógica de autenticação e ter a assinatura do método de autenticação parecida com isto: authenticate (AuthenticationService authenticationService). Então, poderíamos autenticar por um serviço específico como este: authenticate (new GoogleAuthenticationService). Isso nos ajuda a generalizar a lógica de autenticação sem ter que integrar cada serviço separadamente.

Ao depender de abstrações de nível superior, podemos facilmente alterar uma instância com outra instância para alterar o comportamento. Inversão de dependência aumenta a capacidade de reutilização e flexibilidade de nosso código.

