# Flutter do Google Maps: marcador, círculo e polígono.

![Apresentação Colorida de Alimentação Saudável](https://user-images.githubusercontent.com/61892998/113002010-c3e1e900-9147-11eb-94a3-3523810893d6.png)

Hoje, oferecer serviços relacionados à localização tornou-se quase fundamental quando se trata de aplicativos móveis. E, felizmente, temos o Google Maps ao nosso lado, que cria experiências de localização envolventes e nos ajuda a tomar as melhores decisões de negócios com informações precisas em tempo real.

Desenvolvimento rápido, interface expressiva e flexível e desempenho nativo, fizeram do Flutter uma das principais e mais populares ferramentas para o desenvolvimento de aplicativos multiplataforma. Agora, vamos falar sobre o uso do plug-in: google_maps_flutter e como usá-lo.

# Packages necessários

                google_maps_flutter: ^1.2.0
                location: ^3.2.4
# Obs

**Desconhecidos**

**Set** - Uma coleção de objetos em que cada objeto pode ocorrer apenas uma vez. [DOC](https://api.flutter.dev/flutter/dart-core/Set-class.html)

**Marker** - Marca uma localização geográfica no mapa. Um ícone de marcador é desenhado orientado contra a tela do dispositivo em vez da superfície do mapa; ou seja, não mudará necessariamente a orientação devido às rotações, inclinação ou zoom do mapa. [DOC](https://pub.dev/documentation/google_maps_flutter_platform_interface/2.0.2/google_maps_flutter_platform_interface/Marker-class.html)

**MarkerId** Identifica exclusivamente um marcador entre os marcadores do GoogleMap.Isso não precisa ser globalmente exclusivo, apenas exclusivo na lista. [DOC](https://pub.dev/documentation/google_maps_flutter_platform_interface/2.0.2/google_maps_flutter_platform_interface/MarkerId-class.html)

**Polygon** - Desenha um polígono através de localizações geográficas no mapa. [DOC](https://pub.dev/documentation/google_maps_flutter_platform_interface/2.0.2/google_maps_flutter_platform_interface/Polygon-class.html)

**Circle** - Desenha um círculo no mapa. [DOC](https://pub.dev/documentation/google_maps_flutter_platform_interface/2.0.2/google_maps_flutter_platform_interface/Circle-class.html)

**LatLng** - Um par de coordenadas de latitude e longitude, armazenadas como graus.[DOC](https://pub.dev/documentation/google_maps_flutter_platform_interface/2.0.2/google_maps_flutter_platform_interface/LatLng-class.html)


**HashSet** - Uma implementação de conjunto baseada em hash table não ordenada. Os elementos de a HashSet devem ter implementações consistentes de igualdade e hashCode. Isso significa que a operação igual deve definir uma relação de equivalência estável nos elementos (reflexiva, simétrica, transitiva e consistente ao longo do tempo), e que o hashCode deve ser consistente com a igualdade, de modo que o mesmo para objetos considerados iguais. A maioria das operações simples do HashSet são feitas em tempo constante (potencialmente amortizado): adicionar, conter, remover e comprimento, desde que os códigos hash dos objetos sejam bem distribuídos. [DOC](https://api.flutter.dev/flutter/dart-collection/HashSet-class.html)


Um pouco mais sobre Set, HashSet, e outros: 
[Dart - Using Set, HashSet, LinkedHashSet, SplayTreeSet Examples](https://www.woolha.com/tutorials/dart-using-set-hashset-linkedhashset-splaytreeset-examples)
[Dart Collections: Set and HashSet. Dart Tutorial for Flutter](https://www.youtube.com/watch?v=xEWi5LCbCCM&ab_channel=Smartherd)

[Tutorial](https://medium.com/@zeh.henrique92/google-maps-flutter-marker-circle-and-polygon-c71f4ea64498)