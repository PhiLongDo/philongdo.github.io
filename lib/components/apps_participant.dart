import 'package:flutter/material.dart';
import 'package:phi_long_do/constants.dart';
import 'package:phi_long_do/models/app_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'store_button.dart';
import 'text_app_name.dart';
import 'text_title.dart';

class AppsParticipant extends StatelessWidget {
  const AppsParticipant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitle(text: 'Apps'),
        ...appList.map((app) => _buildItem(app)),
      ],
    );
  }

  Widget _buildItem(AppModel app) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Image.asset(app.appIconAsset, width: 128, height: 128),
          SizedBox(width: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextAppName(text: app.name),
              if (app.playStoreId != null)
                StoreButton(
                  smallText: 'Get it on',
                  storeName: 'Google play',
                  onTap: () {
                    launchUrl(
                      Uri.parse('$playStoreUrl?id=${app.playStoreId}'),
                      webOnlyWindowName: '_blank',
                    );
                  },
                ),
              if (app.appStoreId != null)
                StoreButton(
                  smallText: 'Download on the',
                  storeName: 'Apple Store',
                  onTap: () {
                    launchUrl(
                      Uri.parse('$appStoreUrl/${app.appStoreId}'),
                      webOnlyWindowName: '_blank',
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
