import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_notifications/app/modules/send_notifications/presenter/widgets/on_state.dart';

Widget makeTestable(Widget widget) => MaterialApp(home: widget);

void main() {
  // WidgetTester: Responsável por toda a “simulação” do seu widget, construção, gestos, etc.

  // Função auxiliar para envolver os widgets a serem testados.
  testWidgets('description', (WidgetTester tester) async {
    // pumpWidget() renderiza a UI dado um widget.
    await tester.pumpWidget(makeTestable(OnStatePage()));
    final iconFinder = find.byIcon(Icons.title);
    expect(iconFinder, findsOneWidget);
  });
}
