import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/widgets/input/custom_input_field.dart';
import 'package:realize_mobile_app/app/core/forms/custom_form/custom_form.dart';

// Define an enum to manage the sign-in modes for clarity and type safety.
enum SignInMode { email, phone }

class ForgotPasswordForm extends StatefulWidget {
  final Function onFormSubmit;
  final SignInMode mode; // Add this property to switch between modes.

  const ForgotPasswordForm({Key? key, required this.onFormSubmit, required this.mode})
      : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
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
     
    ];

    return Column(children: formFields);
  }
}
