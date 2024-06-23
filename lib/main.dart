import 'package:flutter/material.dart';
import 'package:flutter_future/pages/home_page.dart';
import 'package:flutter_future/pages/profile_page.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
    theme: ThemeData.dark(),
  ));
}