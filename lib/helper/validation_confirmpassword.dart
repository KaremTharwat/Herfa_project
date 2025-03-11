import 'package:herfa/presentation/views/user/Auth/user_signup.dart';

validationconfirmPassword(value) {
  if (confirmpassord != value) {
    return "كلمة المرور غير مطابقه";
  }
  return null;
}
