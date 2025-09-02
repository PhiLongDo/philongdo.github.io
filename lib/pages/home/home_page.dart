import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phi_long_do/router_config.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/image_asset.dart';
import '../../components/store_button.dart';
import '../../components/text_app_name.dart';
import '../../components/text_body.dart';
import '../../components/text_link.dart';
import '../../components/text_title.dart';
import '../../constants.dart';
import '../../generated/assets.dart';
import '../../models/app_model.dart';

part 'apps_participant.dart';
part 'personal_info_participant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        TextButton(
          onPressed: () {
            context.go('/${MyRouterConfig.yearMonthPicker}');
          },
          child: Text("aaaaaa"),
        ),
        ImageAsset(
          webpAsset: Assets.webpIcDeveloper128,
          pngAsset: Assets.pngIcDeveloper128,
          width: 48,
          height: 48,
        ),
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
