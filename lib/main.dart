import 'package:flutter/material.dart';

import 'components/apps_participant.dart';
import 'components/personal_info_participant.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: developerName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [_buildHeader(), const Divider(), _buildBody(context)],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset('assets/ic_developer.png', width: 48, height: 48),
        Text(
          developerName,
          style: TextStyle(
            fontSize: 48,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 800) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersonalInfoParticipant(),
          SizedBox(height: 12),
          AppsParticipant(),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 4, child: PersonalInfoParticipant()),
        Expanded(flex: 6, child: AppsParticipant()),
      ],
    );
  }
}
