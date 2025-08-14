import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'text_body.dart';
import 'text_link.dart';
import 'text_title.dart';

class PersonalInfoParticipant extends StatelessWidget {
  const PersonalInfoParticipant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitle(text: 'Thông tin liên hệ'),
        Row(
          children: [
            _leading(),
            TextBody(text: 'Name: '),
            TextBody(text: myName),
          ],
        ),
        Row(
          children: [
            _leading(),
            TextBody(text: 'Email: '),
            TextLink(
              text: emailContact,
              onTap: () {
                launchUrl(Uri.parse('mailto:$emailContact'));
              },
            ),
          ],
        ),
        Row(
          children: [
            _leading(),
            TextBody(text: 'Github: '),
            TextLink(
              text: 'PhiLongDo',
              onTap: () {
                launchUrl(Uri.parse(githubUrl), webOnlyWindowName: '_blank');
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _leading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Icon(Icons.ac_unit, color: Colors.grey, size: 16),
    );
  }
}
