import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/auth/signup_screen.dart';
import 'package:rune/presentation/auth/widgets/auth_button.dart';
import 'package:rune/presentation/auth/widgets/auth_inputs.dart';
import 'package:rune/presentation/auth/widgets/form_banner.dart';

void main(){

   testWidgets('searching widgets in Sign up Screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(SignUpScreen());
    
    final formBanner = find.byType(FormBanner);

    final textFieldCount = find.byType(AuthInput);

    final passwordFieldCount= find.byType(PasswordInput);

    final buttonFieldCount = find.byType(AuthButton);
  
    expect(formBanner, findsOneWidget);
    expect(textFieldCount, findsNWidgets(2));
    
    expect(passwordFieldCount, findsNWidgets(2));
    expect(buttonFieldCount, findsOneWidget);


  });
}