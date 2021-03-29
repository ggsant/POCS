# Push Notifications 

O envolvimento do usuário é crucial para o sucesso de qualquer aplicativo móvel. As notificações push ajudam a atrair a atenção do usuário e, quando implementadas corretamente em conjunto com conteúdo de alta qualidade, podem contribuir para o maior sucesso de marketing.

# O que são notificações push?
Se você usa um smartphone, quase certamente encontrará notificações push todos os dias. Notificações push são mensagens pop-up clicáveis ​​que aparecem nos dispositivos de seus usuários, independentemente de eles estarem usando esse aplicativo específico. Mesmo quando o dispositivo está inativo ou o usuário está usando outro aplicativo, eles recebem notificações push, desde que o dispositivo esteja online e as permissões de notificação sejam concedidas.

Neste tutorial, usaremos Firebase Cloud Messaging para enviar notificações push.

# Configuração do Firebase
Para começar a usar o Firebase , você deve criar um novo projeto do Firebase e configura-lo para Android ou Ios. Veja aqui como fazer essa configuração [Ver +](https://medium.com/@engapplabs/como-implementar-firebase-%C3%A0-sua-aplica%C3%A7%C3%A3o-em-flutter-42e20b1b4a5d)

# Plugins Flutter
Os plug-ins Flutter necessários para este projeto são:

* firebase_core, que é necessário para usar qualquer serviço Firebase com Flutter
* firebase_messaging, que é usado para receber notificações no aplicativo
* overlay_support, que cria uma interface de usuário de sobreposição

Você pode obter esses pacotes em pub.dev com suas versões mais recentes. Adicione-os ao arquivo do projeto Flutter.pubspec.yaml

Tutorial: [Flutter push notifications with Firebase Cloud Messaging](https://blog.logrocket.com/flutter-push-notifications-with-firebase-cloud-messaging/)