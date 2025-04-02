import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

String? imageUrl;
Future<void> uploadImage(file) async {
  final supabase = Supabase.instance.client;
  try {
    final fileName = "images/${DateTime.now().millisecondsSinceEpoch}.jpg";
    await supabase.storage.from("images").upload(fileName, file);

    imageUrl = supabase.storage.from("images").getPublicUrl(fileName);
  } catch (e) {
    log("Unexpected error: $e");
  }
}
