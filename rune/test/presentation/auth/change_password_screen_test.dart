import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/auth/change_password_screen.dart';
import 'package:rune/presentation/auth/widgets/auth_inputs.dart';

void main(){
 testWidgets('change password screen page contains three password input fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(ChangePasswordScreen());

    final inputFieldsCount = find.byType(PasswordInput);
    
    expect(inputFieldsCount, findsNWidgets(3));

  });
}

