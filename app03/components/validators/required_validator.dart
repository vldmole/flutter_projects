
import 'package:app03/components/validators/validation_rule.dart';

class RequiredValidationRule implements ValidationRule {

  final String errorMessage;

  const RequiredValidationRule({this.errorMessage = 'Campo obrigatório'});

  @override
  String? validate(String? value) {

    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}