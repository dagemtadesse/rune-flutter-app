import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/splash/splash_screen.dart';

void  main() {
   testWidgets('Splash screen page contains two Text buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(SplashScreen());
    final inputFieldsCount = find.byType(TextButton);
    expect(inputFieldsCount, findsNWidgets(2));

  });
}