part of 'home_page.dart';

class AppsParticipant extends StatelessWidget {
  const AppsParticipant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextTitle(text: 'Apps'),
        ...appList.map((app) => _buildItem(app, context)),
      ],
    );
  }

  Widget _buildItem(AppModel app, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageAsset(
              webpAsset: app.appIconAssetWebp,
              width: 98,
              height: 98,
            ),
          ),
          const SizedBox(width: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              TextAppName(text: app.name),
              if (app.playStoreId != null)
                StoreButton(
                  storeType: StoreType.googlePlay,
                  onTap: () {
                    launchUrl(
                      Uri.parse('$playStoreUrl?id=${app.playStoreId}'),
                      webOnlyWindowName: '_blank',
                    );
                  },
                ),
              if (app.appStoreId != null)
                StoreButton(
                  storeType: StoreType.appleStore,
                  onTap: () {
                    launchUrl(
                      Uri.parse('$appStoreUrl/${app.appStoreId}'),
                      webOnlyWindowName: '_blank',
                    );
                  },
                ),
              if (app.windowsStore != null)
                StoreButton(
                  storeType: StoreType.windowsStore,
                  onTap: () {
                    launchUrl(
                      Uri.parse('${app.windowsStore}'),
                      webOnlyWindowName: '_blank',
                    );
                  },
                ),
              if (app.webDemoPath != null)
                WebButton(
                  webType: WebType.playOnWeb,
                  onTap: () {
                    context.go('/${app.webDemoPath}');
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
