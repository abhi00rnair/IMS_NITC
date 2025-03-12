import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 141, 138, 140),
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
              title: const Text("About"),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('My Courses'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Fee Payment'),
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
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
              child: const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("lib/images/images.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
