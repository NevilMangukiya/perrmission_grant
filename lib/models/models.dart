import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

double lat = 0;
double long = 0;

late PermissionStatus calendarStatus;
late PermissionStatus locationStatus;
late PermissionStatus cameraStatus;
late PermissionStatus contactsStatus;
late PermissionStatus microphoneStatus;
late PermissionStatus storageStatus;

class TextIcon {
  final String text;
  final Icon icon;
  final bool isAllow;

  TextIcon({
    required this.text,
    required this.icon,
    required this.isAllow,
  });
}
