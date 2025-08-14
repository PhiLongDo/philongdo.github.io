class AppModel {
  const AppModel({
    required this.name,
    required this.appIconAsset,
    this.playStoreId,
    this.appStoreId,
  });

  final String name;
  final String appIconAsset;
  final String? playStoreId;
  final String? appStoreId;
}
