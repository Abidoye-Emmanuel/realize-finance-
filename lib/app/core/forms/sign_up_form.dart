import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_gradient_button.dart';
import 'package:realize_mobile_app/app/widgets/input/custom_input_field.dart';
import 'package:realize_mobile_app/app/widgets/dropdowns/custom_dropdown.dart';
import 'package:realize_mobile_app/app/core/forms/custom_form/custom_form.dart';

class SignupForm extends StatefulWidget {
  final Function onFormSubmit; // Add this line
  const SignupForm({Key? key, required this.onFormSubmit})
      : super(key: key); 

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool get isFormValid => _formKey.currentState?.validate() == true;
  bool isLoading = false;

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

  Future<void> _submit() async {
    if (_formKey.currentState!.validate())
    return;

    setState(() {
      isLoading = true;
    });
  }

  List<String> countries = [
    'Nigeria',
    'Ghana',
    'South Africa',
    'United Kingdom',
    'United States',
    'Canada',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      builder: buildLoginForm,
      schema: loginValidationSchema,
    );
  }

  Widget buildLoginForm(BuildContext context, CustomFormController controller) {
    return Column(
      children: [
        CustomDropdown<String>(
          label: 'Country',
          items: countries.map((String state) {
            return DropdownMenuItem<String>(
              value: state,
              child: Text(state),
            );
          }).toList(),
          onChanged: (newValue) {
            print(newValue);
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomInput(
          label: 'Email Address',
          placeholder: 'Enter your email ',
          onChanged: (value) {
            controller.updateValue('email', value);
          },
          errorText: controller.getError('email'),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomInput(
          initialValue: '',
          label: 'Phone Number',
          placeholder: 'Enter your phone number',
          onChanged: (value) {},
          isPhoneNumber: true,
          errorText: controller.getError('phone_number'),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomInput(
          label: 'Password',
          placeholder: 'Enter your password ',
          onChanged: (value) {
            controller.updateValue('password', value);
          },
          isPassword: true,
          errorText: controller.getError('password'),
        ),

        PurpleGradientButton(
          text: 'Create my account',
          onPressed: () {
            controller.validate(
              loginValidationSchema
            );
            if (controller.isValid) {
              // Use the isValid getter here

              // Handle valid form submission
              _submit;
              
            }
          }
        )
      ],
    );
  }
}
