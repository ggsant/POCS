import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_notifications/app/app_widget.dart';

Widget makeTestable(Widget widget) => MaterialApp(home: widget);

void main() {
  // WidgetTester: Responsável por toda a “simulação” do seu widget, construção, gestos, etc.

  // Função auxiliar para envolver os widgets a serem testados.
  testWidgets('description', (WidgetTester tester) async {
    // pumpWidget() renderiza a UI dado um widget.
    await tester.pumpWidget(makeTestable(AppWidget()));
    expect(find.byIcon(Icons.title), findsOneWidget);
  });
}
