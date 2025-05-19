import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imsnitc/models/studentdash.dart';
import 'package:imsnitc/parent_info.dart';
import 'package:imsnitc/services/api.dart';

class Dashboard extends StatefulWidget {
  final idtoken;
  const Dashboard({super.key, required this.idtoken});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Studentdash? _student;

  @override
  void initState() {
    super.initState();
    print("Received idToken: ${widget.idtoken}");
    fetchStudentDetails();
  }

  Future<void> fetchStudentDetails() async {
    final student = await ApiService.getStudent(widget.idtoken);
    if (student != null) {
      setState(() {
        _student = student;
      });
    } else {
      print("Student not found or error occurred");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 170, 166, 166),
        title: const Text(
          "STUDENT LANDING PROFILE",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.settings),
            );
          },
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 170, 166, 166),
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text("Parent Info"),
                onTap: () {
                  if (_student != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ParentInfo(studentinfo: _student!),
                      ),
                    );
                  }
                }),
            ListTile(leading: Icon(Icons.book), title: Text('My Courses')),
            ListTile(leading: Icon(Icons.payment), title: Text('Fee Payment')),
            ListTile(
                leading: Icon(Icons.contact_page_sharp),
                title: Text("Results")),
            ListTile(
                leading: Icon(Icons.person),
                title: Text('Student Progression')),
            ListTile(leading: Icon(Icons.email), title: Text("Leave Details")),
            ListTile(
                leading: Icon(Icons.card_membership),
                title: Text("Admission card")),
          ],
        ),
      ),
      body: _student == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'lib/images/title1.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("lib/images/dp.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StatBox(
                                  value: _student!.Min_credits.toString(),
                                  imagePath: 'lib/images/max.jpg'),
                              StatBox(
                                  value: _student!.cgpa.toString(),
                                  imagePath: 'lib/images/cgpafin.jpg'),
                              StatBox(
                                  value: _student!.Credit_earned.toString(),
                                  imagePath: 'lib/images/min.png'),
                            ]),
                        const SizedBox(height: 30),
                        InfoBox(label: 'Name', value: _student!.name),
                        InfoBox(label: 'Roll Number', value: _student!.rollno),
                        InfoBox(label: 'Email', value: _student!.email),
                        InfoBox(label: 'Phone Number', value: _student!.phone),
                        InfoBox(label: 'DOB', value: _student!.DOB),
                        InfoBox(label: 'Degree', value: _student!.Degree),
                        InfoBox(label: 'Gender', value: _student!.Gender),
                        InfoBox(
                            label: 'Specialisation',
                            value: _student!.Specialisation),
                        InfoBox(
                            label: 'Admission_scheme',
                            value: _student!.Admission_scheme),
                        InfoBox(label: 'APAAR_ID', value: _student!.APAAR_ID),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String label;
  final String value;

  const InfoBox({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                value,
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatBox extends StatelessWidget {
  final String value;
  final String imagePath;

  const StatBox({
    required this.value,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 225, 225, 225),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              imagePath,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
