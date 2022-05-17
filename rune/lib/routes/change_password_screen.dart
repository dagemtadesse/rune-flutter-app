import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/providers/change_password_form_model.dart';

import '../models/network/network_states.dart';
import '../models/network/user_requests.dart';
import '../theme.dart';
import '../widgets/widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormBanner(
              header: "Change Your password",
              description: '',
            ),
            const SizedBox(
              height: 48,
            ),
            Consumer<ChangePasswordFormModel>(
              builder: (context, formProvider, _) => Expanded(
                child: Column(
                  children: [
                    ValidateInput(
                      placeholder: 'Old Password',
                      setter: (String value) =>
                          formProvider.oldPassword = value,
                      validationMsg: formProvider.oldPasswordValidation,
                      hidePassword: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ValidateInput(
                      placeholder: 'New Password',
                      setter: (String value) =>
                          formProvider.newPassword = value,
                      toggler: formProvider.togglePasswordVisibility,
                      hidePassword: formProvider.hidePassword,
                      showIcon: true,
                      validationMsg: formProvider.newPasswordValidation,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ValidateInput(
                        placeholder: 'Confirm New Password',
                        hidePassword: true,
                        setter: (String value) =>
                            formProvider.cNewPassword = value,
                        validationMsg: formProvider.cNewPasswordValidation),
                    const SizedBox(
                      height: 16,
                    ),
                    NetworkProgress(
                      state: formProvider.changePasswordRequest,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                ExpandableButton(
                  text: 'Change Password',
                  onPressed: () async {
                    final provider = Provider.of<ChangePasswordFormModel>(
                        context,
                        listen: false);
                    if (provider.validateOldPassword() &&
                        provider.validateNewPassword() &&
                        provider.validateConfirmPassword()) {
                      try {
                        provider.setChangePasswordRequest(Sent());
                        // final data = await UserRequest.changePassword(
                        //     provider.oldPassword, provider.newPassword);
                        // provider.setChangePasswordRequest(Received(data));
                      } catch (error) {
                        provider.setChangePasswordRequest(Failure(error));
                      }
                    }
                  },
                  theme: SplashTheme.buttonTheme,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
