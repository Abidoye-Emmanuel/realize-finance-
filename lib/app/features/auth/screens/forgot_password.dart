import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/texts/span_text_small.dart';
import 'package:realize_mobile_app/app/core/forms/forgot_password_form.dart';
import 'package:realize_mobile_app/app/widgets/navs/back_with_text_header.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_gradient_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  SignInMode _currentMode = SignInMode.phone;

  void _submitForm() {
    // Handle the form submission logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent the scaffold from resizing
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Align(
            alignment: Alignment.centerLeft,
            child: BackWithTextHeader(
              text: '',
              onPressed: () {
                Navigator.pop(context);
              },
            ), // You can set the text for the back button here.
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot password?",
                  style: TextStyle(
                      color: AppColors.primaryBlackColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SpanTextSmall(
                    text: "Reset your password here with the code sent",
                    color: AppColors.primaryGrayColor3,
                    textAlign: TextAlign.center,
                  ),
                ]),
                SizedBox(height: 16),
                Divider(
                  thickness: 1,
                  color: AppColors.primaryDividerGray,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(2, (index) => _buildTab(index)),
              ),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                  child: ForgotPasswordForm(
                      onFormSubmit: _submitForm, mode: _currentMode),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                  child: ForgotPasswordForm(
                      onFormSubmit: _submitForm, mode: _currentMode),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 64.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PurpleGradientButton(
                  text: 'Submit',
                  onPressed: _submitForm,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(int index) {
    List<String> tabTitles = ["Phone number", "Email address"];
    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = index);
        setState(() => index == 0
            ? _currentMode = SignInMode.phone
            : _currentMode = SignInMode.email);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _selectedIndex == index
                  ? AppColors.primaryBlackColor
                  : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        child: Text(
          tabTitles[index],
          style: TextStyle(
            color: _selectedIndex == index
                ? AppColors.primaryBlackColor
                : AppColors.primaryTabGray,
            fontWeight:
                _selectedIndex == index ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
