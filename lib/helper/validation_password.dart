import 'package:herfa/presentation/views/user/Auth/user_signup.dart';

validationPassword(value) {
  confirmpassord = value;
  if (value!.isEmpty) {
    return "الرجاء ادخال كلمة المرور ";
  } else if (value.length < 6) {
    return "الرجاء ادخال كلمة المرور اكثر من 6 احرف";
  }
  return null;
}
