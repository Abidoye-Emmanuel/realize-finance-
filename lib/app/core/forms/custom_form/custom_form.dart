import 'dart:async';
import 'package:flutter/material.dart';

// Defines a function signature for building the form UI.
typedef CustomFormBuilder = Widget Function(BuildContext context, CustomFormController controller);

// The main CustomForm widget that users will interact with.
class CustomForm extends StatefulWidget {
  final CustomFormBuilder builder;
  final ValidationSchema schema;

  const CustomForm({Key? key, required this.builder, required this.schema}) : super(key: key);

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final CustomFormController _controller = CustomFormController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Providing the controller to the builder function.
    return widget.builder(context, _controller);
  }
}

// Controller class for managing form state and validation.
class CustomFormController {
  final CustomFormState _state = CustomFormState();
  final StreamController<CustomFormState> _stateController = StreamController<CustomFormState>.broadcast();

  Stream<CustomFormState> get stateStream => _stateController.stream;

  // Add a getter to check if the form is valid
  bool get isValid => _state.isValid;

  // Add a method to get error message for a specific field
  String? getError(String fieldName) {
    return _state.errors[fieldName];
  }
  void updateValue(String field, String? value) {
    _state.values[field] = value;
    // Optionally validate on update or you can validate manually.
    //_validate();
    _stateController.add(_state); // Notify listeners of state change.
  }

  void validate(ValidationSchema schema) {
    _state.errors = schema.validate(_state.values);
    _stateController.add(_state); // Notify listeners of state change.
  }

  void clearState() {
    _state.values.clear();
    _state.touched.clear();
    _state.errors.clear();
    _stateController.add(_state); // Resetting the form state.
  }

  void dispose() {
    _stateController.close();
  }
}

// The form state that will be managed by CustomFormController.
class CustomFormState {
  Map<String, String?> values = {};
  Map<String, bool> touched = {};
  Map<String, String?> errors = {};

  bool get isValid => errors.values.every((error) => error == null || error.isEmpty);
}

// Validation schema class for defining validation rules.
class ValidationSchema {
  final Map<String, String? Function(String?)> rules;

  ValidationSchema({required this.rules});

  Map<String, String?> validate(Map<String, String?> values) {
    return rules.map((key, validator) => MapEntry(key, validator(values[key])));
  }
}
