import 'package:flutter_test/flutter_test.dart';

import 'package:dovuidangian/app.dart';

void main() {
  testWidgets('Quiz app renders home and opens category selection', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(QuizApp());

    expect(find.text('Đố vui dân gian'), findsOneWidget);
    expect(find.text('Bắt đầu chơi'), findsOneWidget);

    await tester.tap(find.text('Bắt đầu chơi'));
    await tester.pumpAndSettle();

    expect(find.text('Chọn lĩnh vực câu đố'), findsOneWidget);
    expect(find.text('Đố vui dân gian'), findsOneWidget);
  });

  testWidgets('Quiz app can open settings', (WidgetTester tester) async {
    await tester.pumpWidget(QuizApp());

    expect(find.text('Đố vui dân gian'), findsOneWidget);
    expect(find.text('Bắt đầu chơi'), findsOneWidget);

    await tester.tap(find.text('Cấu hình game'));
    await tester.pumpAndSettle();

    expect(find.text('Cấu hình game đố vui'), findsOneWidget);
    expect(find.text('Volume'), findsOneWidget);
  });
}
