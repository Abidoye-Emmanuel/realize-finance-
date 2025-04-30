// validation_schema.dart
class ValidationSchema {
  final Map<String, String? Function(String?)> rules;

  ValidationSchema({required this.rules});

  Map<String, String?> validate(Map<String, String?> values) {
    Map<String, String?> errors = {};
    rules.forEach((field, validator) {
      final value = values[field];
      final errorMessage = validator(value);
      if (errorMessage != null) {
        errors[field] = errorMessage;
      }
    });
    return errors;
  }
}
