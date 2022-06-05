import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/channels/widgets/search_bar.dart';

void main(){
  testWidgets('Searching and verifying widgets in Search bar',
      (WidgetTester tester) async {
    await tester.pumpWidget(SearchBar());

    final sizedBoxCount = find.byType(SizedBox);
    final rowWidgetCount = find.byType(Row);

    final paddingWidgetFinder = find.byType(Padding);
    final inputFieldCount = find.byType(TextFormField);

    expect(sizedBoxCount, findsNWidgets(2));
    expect(rowWidgetCount, findsOneWidget);
    
    expect(paddingWidgetFinder, findsOneWidget);
    expect(inputFieldCount, findsOneWidget);

  });
}