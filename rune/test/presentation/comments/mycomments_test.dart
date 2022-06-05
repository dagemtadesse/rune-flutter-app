import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/comments/mycomments.dart';

void  main() {
  testWidgets('Searching and verifying Widgets in mycomments',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyComments());

    final paddingWFinder = find.byType(Padding);

    final columnWFinder= find.byType(Column);

    expect(paddingWFinder, findsOneWidget);
    
    expect(columnWFinder, findsOneWidget);


  });
}