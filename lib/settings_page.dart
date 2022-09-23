import 'dart:async';

import 'package:flutter/material.dart';

import '../models/models.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TextIcon> allowed = <TextIcon>[
      TextIcon(
          text: "Calendar",
          icon: Icon(
            Icons.date_range,
            color: Colors.white,
            size: 27,
          ),
          isAllow: (calendarStatus.toString().split(".")[1] == "denied")
              ? false
              : true),
      TextIcon(
          text: "Camera",
          icon: Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
            size: 27,
          ),
          isAllow: (cameraStatus.toString().split(".")[1] == "denied")
              ? false
              : true),
      TextIcon(
          text: "Contacts",
          icon: Icon(
            Icons.contacts_outlined,
            color: Colors.white,
            size: 27,
          ),
          isAllow: (contactsStatus.toString().split(".")[1] == "denied")
              ? false
              : true),
      TextIcon(
          text: "Files and media",
          icon: Icon(
            Icons.file_copy_outlined,
            color: Colors.white,
            size: 27,
          ),
          isAllow: true),
      TextIcon(
          text: "Location",
          icon: Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 27,
          ),
          isAllow: (locationStatus.toString().split(".")[1] == "denied")
              ? false
              : true),
      TextIcon(
          text: "Microphone",
          icon: Icon(
            Icons.mic_none_rounded,
            color: Colors.white,
            size: 27,
          ),
          isAllow: (microphoneStatus.toString().split(".")[1] == "denied")
              ? false
              : true),
      TextIcon(
          text: "Storage",
          icon: Icon(
            Icons.mic_none_rounded,
            color: Colors.white,
            size: 27,
          ),
          isAllow: (storageStatus.toString().split(".")[1] == "denied")
              ? false
              : true),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('App permissions'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 145,
                width: double.infinity,
                color: Colors.black,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.2),
                      ),
                      child: const FlutterLogo(),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Permission App',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Divider(
                thickness: 1.5,
                color: Colors.orange[900],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Text(
                    'ALLOWED',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: allowed
                    .map((e) => (e.isAllow)
                        ? Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, left: 20, top: 20),
                            child: Row(
                              children: [
                                e.icon,
                                const SizedBox(width: 28),
                                Text(
                                  e.text,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )
                        : Container())
                    .toList(),
              ),
              Divider(
                thickness: 1.5,
                color: Colors.orange[900],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Text(
                    'NOT ALLOWED',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: allowed
                    .map((e) => (e.isAllow == false)
                        ? Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, left: 20, top: 20),
                            child: Row(
                              children: [
                                e.icon,
                                const SizedBox(width: 28),
                                Text(
                                  e.text,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )
                        : Container())
                    .toList(),
              ),
              const SizedBox(height: 20),
              Divider(
                thickness: 1.5,
                color: Colors.orange[900],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Per({required String perName, required String perStatus}) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 20, right: 20),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           '$perName',
  //           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  //         ),
  //         (perStatus.split(".")[1] == "denied")
  //             ? const Text(
  //                 "Don't Allow",
  //                 style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w500,
  //                     color: Colors.blue),
  //               )
  //             : const Text(
  //                 "Allow",
  //                 style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w500,
  //                     color: Colors.blue),
  //               ),
  //       ],
  //     ),
  //   );
  // }
}
