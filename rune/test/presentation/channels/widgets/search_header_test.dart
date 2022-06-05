import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/channels/widgets/search_header.dart';

void main(){
  testWidgets('Finding and verifying widgets in search header ',
      (WidgetTester tester) async {
    await tester.pumpWidget(SearchHeader());
    final paddingWidgetFinder = find.byType(Padding);
    final columnWidgetCount = find.byType(Column);

    final rowWidgetCount = find.byType(Row);
    final sizedBoxWidgetCount = find.byType(SizedBox);

    final iconButtonCount= find.byType(IconButton);

    expect(paddingWidgetFinder, findsOneWidget);
    expect(columnWidgetCount, findsOneWidget);

    expect(rowWidgetCount, findsNWidgets(2));
    expect(sizedBoxWidgetCount, findsNWidgets(3));
    
    expect(iconButtonCount, findsOneWidget);




  });
}