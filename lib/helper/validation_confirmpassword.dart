import 'package:herfa/presentation/views/user/Auth_views/user_signup.dart';

validationconfirmPassword(value) {
  if (confirmpassord != value) {
    return "كلمة المرور غير مطابقه";
  }
  return null;
}
