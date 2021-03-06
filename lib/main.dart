import 'package:flutter/material.dart';
import 'package:flutter_chopper_sample/api/post_api_service.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      // The initialized PostApiService is now available down the widget tree
      create: (_) => PostApiService.create(),
      dispose: (context, PostApiService service) => service.client.dispose(),
      child: MaterialApp(title: 'Material App', home: HomePage()),
    );
  }
}

void _setupLogging() {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name}:${event.time}: ${event.message}');
  });
}
