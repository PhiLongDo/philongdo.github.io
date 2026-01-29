class AppModel {
  const AppModel({
    required this.name,
    required this.appIconAssetWebp,
    this.playStoreId,
    this.appStoreId,
    this.windowsStore,
    this.webDemoPath,
  });

  final String name;
  final String appIconAssetWebp;
  final String? playStoreId;
  final String? appStoreId;
  final String? windowsStore;
  final String? webDemoPath;
}
