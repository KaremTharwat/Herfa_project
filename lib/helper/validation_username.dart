validationUserName(value) {
  if (value!.isEmpty) {
    return "الرجاء ادخال الاسم";
  } else if (!RegExp(r'^[ء-ي\s]+$').hasMatch(value)) {
    return "ألرجاء ادخال الاسم بالعربية و بدون رموز";
  }
  return null;
}
