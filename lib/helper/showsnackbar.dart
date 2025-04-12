import 'package:flutter/material.dart';

showSnackBar(BuildContext context,String text)
{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text , textAlign: TextAlign.center,)));
}