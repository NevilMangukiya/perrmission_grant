import 'dart:async';

import 'package:adv_geolocation_app/settings_page.dart';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

import 'models/models.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'setting_page': (context) => const SettingsPage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  status() async {
    calendarStatus = await Permission.calendar.status;
    locationStatus = await Permission.location.status;
    cameraStatus = await Permission.camera.status;
    contactsStatus = await Permission.contacts.status;
    microphoneStatus = await Permission.microphone.status;
  }

  @override
  initState() {
    super.initState();
    status();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Geo Location"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // await openAppSettings();
              Navigator.of(context).pushNamed("setting_page");
              // PermissionStatus res = await Permission.location.request();
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                ),
                child: const Text("CAMERA"),
                onPressed: () async {
                  PermissionStatus res = await Permission.camera.request();
                  setState(() {
                    cameraStatus = res;
                  });
                  print(cameraStatus);
                },
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.orange[900],
            ),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                ),
                child: const Text("LOCATION"),
                onPressed: () async {
                  PermissionStatus res = await Permission.location.request();
                  setState(() {
                    locationStatus = res;
                  });
                },
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.orange[900],
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                ),
                child: const Text("CONTACTS"),
                onPressed: () async {
                  PermissionStatus res = await Permission.contacts.request();
                  setState(() {
                    contactsStatus = res;
                  });
                },
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.orange[900],
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                ),
                child: const Text("MICROPHONE"),
                onPressed: () async {
                  PermissionStatus res = await Permission.microphone.request();
                  setState(() {
                    microphoneStatus = res;
                  });
                },
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.orange[900],
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                ),
                child: const Text("CALENDAR"),
                onPressed: () async {
                  PermissionStatus res = await Permission.calendar.request();
                  setState(() {
                    calendarStatus = res;
                  });
                },
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.orange[900],
            ),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                ),
                child: const Text("STORAGE"),
                onPressed: () async {
                  PermissionStatus res = await Permission.storage.request();
                  setState(() {
                    storageStatus = res;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
