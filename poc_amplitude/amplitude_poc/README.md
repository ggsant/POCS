# Amplitude

# Como funciona o amplitude

Para entender como o Amplitude funciona, vamos examinar um exemplo hipotético.

Tunes é um reprodutor de música padrão para dispositivos móveis que tem ações comuns, como tocar uma música, pular uma música, reproduzir aleatoriamente e compartilhar uma música.

![b6e7876-music_player](https://user-images.githubusercontent.com/61892998/114892981-9fdb0480-9de3-11eb-83a8-5d58e746470c.png)

Usando o Amplitude, você pode rastrear todas as ações que seus usuários fazem em detalhes e entender melhor o que está funcionando e o que não está.

# Quais ações o Amplitude acompanhará?

O amplitude dá a você o poder de determinar o que é importante para sua experiência. Você pode optar por rastrear tudo e qualquer coisa.

Por exemplo, em Tunes, você pode rastrear os botões de controle de música que os usuários pressionam ou até mesmo quantas músicas cada usuário ouviu em cada sessão.

# Os eventos representam as ações que os usuários realizaram

Cada vez que acontece uma ação que você deseja acompanhar, você envia um Evento para Amplitude. Os eventos podem ser tão fáceis quanto escolher a string de texto que os define.
Por exemplo, em Tunes, você pode enviar um evento “Play Song” toda vez que um usuário pressiona o botão Play.

# Propriedades do evento fornecem contexto

Propriedades do evento fornecem **contexto** sobre eventos, como **onde** no seu aplicativo eles ocorrem ou **em que estado o aplicativo estava quando ocorreu**.

Por exemplo, em Tunes, quando alguém pressiona o evento “Play Song”, usando uma propriedade Event, você também pode rastrear o título da música que está sendo tocada, o artista, o gênero, etc. Qualquer detalhe relacionado ao evento em si pode atuar como uma propriedade de evento.

# As sessões de usuário são uma série de eventos em uma única visita

As sessões de usuário permitem que você acompanhe uma série de eventos que são realizados em uma única visita ou interação com seu aplicativo.

Na maioria das vezes, o Amplitude monitora a sessão automaticamente para você. Se estiver usando a API HTTP, você precisará lidar com as sessões manualmente.

# Propriedades do usuário são detalhes sobre o seu usuário

As propriedades do usuário ajudam a entender seu usuário no momento em que ele executou ações em seu aplicativo. O estado em que estavam, suas preferências ou detalhes do dispositivo são exemplos de propriedades comuns do usuário.

Por exemplo, no Tunes, você pode acompanhar se um usuário está ou não em um plano pago ou gratuito. Isso permitirá que você segmente esses usuários por esta propriedade e compare os usuários pagos e gratuitos (ou considere apenas o comportamento dos usuários pagantes).

# Guia de autopreenchimento de dados

O Guia de preenchimento automático de dados pode ser usado para importar dados históricos para o Amplitude. 

# Coisas a considerar

1. **Mantenha os dados históricos separados**. 

Considere manter os dados históricos em um projeto separado do Amplitude e não preencher os dados históricos em um projeto de produção ao vivo. Isso não apenas torna o upload mais fácil, mas mantém seus dados de amplitude ao vivo limpos e mantém você focado nos dados atuais e no futuro. 

Provavelmente, você não irá verificar os dados históricos com frequência, mas quando o fizer, ainda estará facilmente acessível. Além disso, os valores históricos das propriedades do usuário também seriam processados ​​e substituiriam os valores ativos atuais.

Assim, no sistema de ingestão, devemos sincronizar os valores de propriedade out-of-date para novos eventos ao vivo que vêm dentro Você pode pular as propriedade de sincronização de usuário, adicionandoo seguinte no event payload: 

                    "$skip_user_properties_sync": true

2. **Conectando dados do usuário entre dois conjuntos de dados.** 

Se você deseja conectar os dados históricos com os dados atuais, deve combinar os dados históricos e os dados ativos no mesmo projeto. Você também **deve ter uma ID comum compartilhada entre os dois conjuntos de dados**, que é o campo ID do usuário no sistema do Amplitude. Você precisará definir a ID de usuário de seus dados históricos para a ID de usuário em seus dados atuais se quiser que os dados se conectem.

3. **A nova contagem de usuários pode mudar**. 

Amplitude define **um novo usuário com base no registro de data e hora do evento mais antigo que Amplitude vê para um determinado usuário.** Como resultado, se um usuário for registrado como novo em 15/04/20 e os dados forem preenchidos para o usuário em 20/04/20, o usuário será refletido como novo em 20/04/20. 

4. **Os dados do aplicativo atual podem estar comprometidos.** 

Se houver uma incompatibilidade entre sua ID de usuário atual e a ID de usuário preenchida, interpretaremos as duas IDs de usuário distintas como dois usuários distintos. Como resultado, os usuários serão contados duas vezes. Como **não podemos excluir os dados depois de gravados,** talvez seja necessário criar um novo projeto para eliminar quaisquer problemas de dados. 

5. **Entenda como o Amplitude identifica usuários únicos**.  

Usamos os campos ID do dispositivo e ID do usuário para calcular a ID de amplitude. 

6. **Limite de eventos mensais.**  

Cada evento preenchido conta para o seu volume mensal de eventos.

7. **Cota diária para ingestão de eventos**. 

Há um limite diário de 500 mil eventos por id de dispositivo (e por id de usuário) para um projeto que pode ser ingerido, para proteger o Amplitude de spam de eventos. Esse limite tem uma janela contínua de 24 horas de intervalo de 1 hora. Isso significa que, a qualquer momento, um determinado usuário ou dispositivo só pode enviar 500 mil eventos nas últimas 24 horas. Se este limite for atingido, eles verão excedered_daily_quota_users / excedered_daily_quota_devices na resposta.

# Instruções para o backfill

1. **Revise a documentação da Batch API**. 

Se você exportou dados históricos usando a API de exportação e deseja preencher essa exportação de histórico, observe que os campos exportados não estão no mesmo formato que os campos necessários para importação (ou seja, API de exportação lista **$insert_id** enquanto APIs HTTP e Batch irão formatar **insert_id** sem prefixar $).

2. **Entenda quais campos você deseja enviar e mapeie seus dados históricos para nossos campos.** 
É altamente recomendável usar o campo **_insert_id_field** para que possamos desduplicar eventos.

3. **Crie um projeto de teste no Amplitude onde você enviará dados de teste de amostra de seu backfill**. 

Você deve fazer vários testes em alguns dias de dados em um projeto separado do Amplitude antes do upload final para o projeto de produção. Dessa forma, você também pode dar uma olhada e ter certeza de que está tudo certo. 

**NOTA IMPORTANTE**: Se você bagunçar a importação para o seu projeto de produção, não haverá como "desfazer" o upload.

4. **Limite seu upload a 100 lotes/seg e 1000 eventos/seg.**

Você pode agrupar eventos em um upload, mas recomendamos **não enviar mais de 10 eventos por lote**. Portanto, esperamos que no máximo 100 lotes sejam enviados por segundo e, portanto, o limite de 1000 eventos/s ainda se aplica, pois não recomendamos o envio de mais de 10 eventos por lote. 

Você também será limitado se enviar mais de 10 eventos/s para um único ID de dispositivo. 

**Orientação para a maneira mais recomendada de preencher grandes quantidades de dados:**

A. Divida o conjunto de eventos em mini conjuntos não sobrepostos (por exemplo, partição por device_id).

B. Tenha 1 worker por conjunto de eventos executando as etapas 1-3.

            * Leia um grande número de eventos de seu sistema.
            * Particione esses eventos em solicitações com base em device_id ou user_id.
            * Envie suas solicitações simultaneamente / em paralelo à Amplitude.

Para otimizar ainda mais o processo acima, você também pode fazer o seguinte:

Em seu upload, você deve tentar novamente de forma agressiva com tempos limite elevados. Você deve sempre tentar novamente até receber um 200. Se você enviar um insert_id, nós iremos desduplicar quaisquer dados duplicados para você do nosso lado que sejam enviados dentro de 7 dias um do outro.

# Timing

Se você enviar dados com data e hora de 30 dias ou mais, pode levar até 48 horas para aparecer em algumas partes do sistema, portanto, não se assuste se não vir tudo imediatamente. Você pode usar a guia Atividade do usuário  para verificar os eventos que está enviando à medida que são atualizados em tempo real, independentemente da hora do evento.

# Recursos

Scripts de amostra para importação de dados:  https://gist.github.com/djih/2a7e7fb2c1d45c8277f7aef64b682ed6

Dados de amostra:  https://d24n15hnbwhuhn.cloudfront.net/sample_data.zip

# Sistema de Ingestão de Dados

O sistema de ingestão do Amplitude, as propriedades do usuário atual de cada usuário estão sempre sendo rastreadas e sincronizadas com os eventos de entrada do usuário. Este diagrama detalha o processo de sincronização da propriedade do usuário. Ao enviar dados para o Amplitude, os clientes enviarão dados de eventos ou chamadas para atualizar as propriedades de usuário de um usuário. Essas chamadas atualizarão os valores de propriedade do usuário atuais de um usuário e afetarão as propriedades que estão sendo sincronizadas para eventos subsequentes recebidos após a chamada. Por exemplo, digamos que o usuário USER tenha atualmente uma propriedade de usuário, 'color', definida como 'red'. Em seguida, o USER registra o evento 'Exibir página A' e dispara um que define a 'cor' como 'azul'. Depois, eles registram um 'identify' que muda a cor para azul.  Depois disso, eles registram uma 'Ver página B':

                                logEvent -> 'Ver página A'
                                identify -> 'cor': 'azul'
                                logEvent -> 'Ver página B'

Se o Amplitude receber eventos do USER nessa ordem exata, você esperaria que 'Exibir página A' tivesse 'cor' = 'vermelho' e 'Exibir página B' tivesse 'cor' = 'azul'. Isso porque no Amplitude, mantemos o valor das propriedades do usuário no momento do evento. Por este motivo, a ordem em que os eventos são carregados é muito importante. Se o for recebido após 'Exibir página B', então 'Exibir página B' terá 'cor' = 'vermelho' em vez de 'azul'. identify

A maneira como a Amplitude garante que os eventos sejam processados ​​na ordem em que são recebidos é que processamos todos os eventos de um usuário usando o mesmo ingestion worker. Em essência, todos os eventos do USER seriam enfileirados em ordem em um único ingestion worker. Se, em vez disso, esses eventos forem processados ​​em paralelo entre dois workers separados, será muito mais difícil garantir o pedido (por exemplo, um worker pode ser mais rápido do que outro etc.). 

Como os eventos de cada usuário são processados ​​pelo mesmo worker, se esse usuário enviar um número anormalmente alto de eventos em um curto período de tempo, eles sobrecarregariam o worker atribuído. Por esse motivo, o limite de upload de eventos é de 300 eventos/s por ID de dispositivo. 

É possível que o preenchimento do cliente exceda 300 eventos/s se for um sistema que itera por meio de dados históricos e envia dados em paralelo o mais rápido possível. Como resultado, o Amplitude rastreará a taxa de evento de cada ID de dispositivo e rejeitará eventos, além de retornar um código de resposta HTTP de limitação 429 se detectar que um determinado dispositivo está enviando mais rápido do que 300 eventos/s. 

É por isso que, se você receber um 429 em resposta a um upload de evento, o processo deve ficar suspenso por alguns segundos e repetir o upload até que tenha sucesso, conforme declarado em nossoDocumentação da Batch API . Isso garantirá que nenhum evento seja perdido no processo de aterramento. Se você não tentar novamente após um código de resposta 429, esse lote específico de eventos não será ingerido.    

# Instruções para preenchimento de usuários pré-existentes

Se você tiver usuários pré-existentes, deverá preencher esses usuários pré-existentes para marcar com precisão quando esses usuários eram novos usuários. O Amplitude marca os usuários como novos com base no carimbo de data/ hora do evento mais antigo.

Para preencher seus usuários pré-existentes, use nossa  API Batch  para enviar um "evento fictício" ou um evento de inscrição em que o carimbo de data/hora do evento é a hora em que o usuário era realmente novo. Por exemplo, se um usuário se inscreveu em 1º de agosto de 2020, o carimbo de data/hora do evento enviado seria 1º de agosto de 2020.

# Amplitude library

**Classes**

# Amplitude Flutter Documentation

[Doc](https://pub.dev/documentation/amplitude_flutter/latest/amplitude/amplitude-library.html)

[Package](https://pub.dev/packages/amplitude_flutter)

[GitHub](https://github.com/amplitude/Amplitude-Flutter)