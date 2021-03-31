# poc_rest

Uum aplicativo de Clima em Flutter que demonstre como gerenciar vários blocs para implementar temas dinâmicos, pull-to-refresh e muito mais. Nosso aplicativo meteorológico extrai dados reais de uma API e demonstra como separar nosso aplicativo em três camadas (dados, lógica de negócios e apresentação).


API - [Ver+](https://www.metaweather.com/)
Tipos de tempo - [Ver+](https://www.metaweather.com/api/)

Vamos nos concentrar em dois pontos de extremidade:

* /api/location/search/?query=$city para obter um locationId para um determinado nome de cidade
* /api/location/$locationId para obter o clima para um determinado locationId

Tutorial - [Ver+](https://bloclibrary.dev/#/pt-br/flutterweathertutorial)