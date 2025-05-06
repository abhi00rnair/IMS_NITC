import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 141, 138, 140),
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 141, 138, 140),
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Info"),
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('My Courses'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Fee Payment'),
              onTap: () {},
            ),
            const ListTile(
              leading: Icon(Icons.contact_page_sharp),
              title: Text("Results"),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Student Progression'),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text("Leave Details"),
            ),
            const ListTile(
              leading: Icon(Icons.card_membership),
              title: Text("Admission card"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("lib/images/images.jpg"),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                StatBox(value: '160'),
                StatBox(value: '99'),
                StatBox(value: '6.65'),
              ],
            ),
            const SizedBox(height: 30),
            InfoBox(label: 'Name', value: 'John Doe'),
            InfoBox(label: 'Roll Number', value: 'B23CS999'),
            InfoBox(label: 'Gmail', value: 'john.doe@example.com'),
            InfoBox(label: 'Phone Number', value: '+91 9876543210'),
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
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class StatBox extends StatelessWidget {
  final String value;

  const StatBox({required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 225, 225, 225),
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
      child: Center(
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
