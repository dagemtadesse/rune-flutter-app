import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/channels/mychannels_screen.dart';

void main(){
  testWidgets('Finding padding and Column widgets in MyChannels Screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyChannels());
    
    final paddingWidgetFinder = find.byType(Padding);
    final columnWidgetFinder = find.byType(Column);

    expect(paddingWidgetFinder, findsOneWidget);
    expect(columnWidgetFinder, findsOneWidget);

  });
}