validationEmailAddress(value) {
  if (value!.isEmpty) {
    return "الرجاء ادخال البريد الالكتروني";
  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[g-m-a-i-l]+\.[c-o-m]{2,}$')
      .hasMatch(value)) {
    return "الرجاء ادخال رقم هاتف صحيح";
  }
  return null;
}
