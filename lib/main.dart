import 'package:desafio_tecnico/app.dart';
import 'package:desafio_tecnico/providers/lead-provider.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await LeadProvider().syncLeads();
    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  Workmanager().registerPeriodicTask(
    "1",
    "syncLeadsTask",
    frequency: const Duration(seconds: 10),
  );

  runApp(
    const MyApp(),
  );
}
