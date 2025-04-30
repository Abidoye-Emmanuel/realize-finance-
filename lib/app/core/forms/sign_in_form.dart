import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/widgets/input/custom_input_field.dart';
import 'package:realize_mobile_app/app/core/forms/custom_form/custom_form.dart';
import 'package:realize_mobile_app/app/features/auth/screens/forgot_password.dart';
import 'package:realize_mobile_app/app/widgets/buttons/transparent_text_button.dart';

// Define an enum to manage the sign-in modes for clarity and type safety.
enum SignInMode { email, phone }

class SignInForm extends StatefulWidget {
  final Function onFormSubmit;
  final SignInMode mode; // Add this property to switch between modes.

  const SignInForm({Key? key, required this.onFormSubmit, required this.mode})
      : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool get isFormValid => _formKey.currentState?.validate() == true;

  final loginValidationSchema = ValidationSchema(rules: {
    'email': (value) {
      if (value == null || value.isEmpty) {
        return 'Email is required';
      }
      if (!value.contains('@')) {
        return 'Please enter a valid email address';
      }
      return null; // Indicates the value is valid
    },
    'password': (value) {
      if (value == null || value.isEmpty) {
        return 'Password is required';
      }
      if (value.length < 8) {
        return 'Password must be at least 8 characters long';
      }
      return null;
    },
  });

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      builder: buildLoginForm,
      schema:
          loginValidationSchema, // Make sure to define or update this schema based on your implementation.
    );
  }

  Widget buildLoginForm(BuildContext context, CustomFormController controller) {
    // Determine which input fields to display based on the mode.
    List<Widget> formFields = [
      if (widget.mode == SignInMode.email)
        CustomInput(
          label: 'Email Address',
          placeholder: 'Enter your email',
          onChanged: (value) => controller.updateValue('email', value),
          errorText: controller.getError('email'),
        ),
      if (widget.mode == SignInMode.phone)
        CustomInput(
          initialValue: '',
          label: 'Phone',
          placeholder: 'Enter your phone number',
          onChanged: (value) => controller.updateValue('phone', value),
          isPhoneNumber: true,
          errorText: controller.getError('phone'),
        ),
      const SizedBox(height: 16),
      CustomInput(
        label: 'Password',
        placeholder: 'Enter your password',
        onChanged: (value) => controller.updateValue('password', value),
        isPassword: true,
        errorText: controller.getError('password'),
      ),
      const SizedBox(height: 16),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        TransparentTextButton(
            text: "Forgot Password?",
            textAlign: TextAlign.right,
            isUnderline: true,
          
            fontSize: 14,
            onPressed: () {
              // Navigator logic here
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                         const ForgotPassword()),
              );
            })
      ]),
    ];

    return Column(children: formFields);
  }
}
