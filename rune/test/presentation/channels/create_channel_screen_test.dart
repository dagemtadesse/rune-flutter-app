import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/channels/create_channel_screen.dart';

void  main() {
  testWidgets('Create channel page contains four input fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(CreateChannelPage());
    final inputFieldsCount = find.byType(TextFormField);
    expect(inputFieldsCount, findsNWidgets(4));
  });

   testWidgets('Create channel page contains one Icon button and one elevated button',
      (WidgetTester tester) async {
    await tester.pumpWidget(CreateChannelPage());

    final buttonFieldsCount = find.byType(IconButton);
    final inputFieldsCount = find.byType(ElevatedButton);

    expect(inputFieldsCount, findsOneWidget);
    expect(buttonFieldsCount, findsOneWidget);
  });


}
