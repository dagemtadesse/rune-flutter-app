import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/comments/widgets/bottomnav.dart';


void main() {
  testWidgets('Finding and verifying widgets in bottomnav ',
      (WidgetTester tester) async {

    await tester.pumpWidget(BottomNav());
    final bottomNavBarCount = find.byType(BottomNavigationBar);

    expect(bottomNavBarCount, findsOneWidget);



      });
}