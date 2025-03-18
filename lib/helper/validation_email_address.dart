validationEmailAddress(value) {
  if (value!.isEmpty) {
    return "الرجاء ادخال البريد الالكتروني";
  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
      .hasMatch(value)) {
    return "الرجاء ادخال البريد الالكتروني بشكل صحيح";
  }
  return null;
}
