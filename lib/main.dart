import 'package:flutter/material.dart';
import 'package:onework2/app.dart';
import 'package:onework2/data/services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initialize();

  runApp(const OneWorkApp());
}
