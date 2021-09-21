import 'package:aplikasi_pengajuancuti/datepicker.dart';
import 'package:aplikasi_pengajuancuti/menuawal.dart';
import 'package:aplikasi_pengajuancuti/cuti.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        brightness: Brightness.light,
        primaryColor: Colors.white,
      ),
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuAwal(),
    );
  }
}
