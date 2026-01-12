part of 'home_page.dart';

class PackagesParticipant extends StatelessWidget {
  const PackagesParticipant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextTitle(text: 'Pub.dev packages'),
        ...packageList.map((package) => _buildItem(package, context)),
      ],
    );
  }

  Widget _buildItem(PackageModel package, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              TextAppName(text: package.name),
              StoreButton(
                storeType: StoreType.pubdev,
                onTap: () {
                  launchUrl(
                    Uri.parse('$pubPackageUrl/${package.pubName}'),
                    webOnlyWindowName: '_blank',
                  );
                },
              ),
              if (package.webDemoPath != null)
                WebButton(
                  webType: WebType.webDemo,
                  onTap: () {
                    context.go('/${package.webDemoPath}');
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
