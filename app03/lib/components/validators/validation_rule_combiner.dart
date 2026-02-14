
import 'package:app03/components/validators/validation_rule.dart';

class ValidationRuleCombiner implements ValidationRule{

  final List<ValidationRule> validators;

  const ValidationRuleCombiner({this.validators = const []});
  
  @override
  String? validate(String? value) {

    for (var validator in validators) {

      final result = validator.validate(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}