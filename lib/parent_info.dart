import 'package:flutter/material.dart';
import 'package:imsnitc/Dashboard.dart';
import 'package:imsnitc/models/studentdash.dart';

class ParentInfo extends StatefulWidget {
  Studentdash studentinfo;
  ParentInfo({super.key, required this.studentinfo});

  @override
  State<ParentInfo> createState() => _ParentInfoState();
}

class _ParentInfoState extends State<ParentInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 170, 166, 166),
        title: const Text(
          "PARENT INFORMATION",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InfoBox(
                label: "Father's Name", value: widget.studentinfo.Father_Name),
            InfoBox(
                label: "Father's email",
                value: widget.studentinfo.Father_Email),
            InfoBox(
                label: "Father phone", value: widget.studentinfo.Father_Phone),
            InfoBox(
                label: "Mother's Name", value: widget.studentinfo.Mother_Name),
            InfoBox(
                label: "Mother;s email",
                value: widget.studentinfo.Mother_Email),
            InfoBox(
                label: "Mother phonee", value: widget.studentinfo.Mother_Phone),
          ],
        ),
      ),
    );
  }
}
