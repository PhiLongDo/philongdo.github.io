class AppModel {
  const AppModel({
    required this.name,
    required this.appIconAssetWebp,
    required this.appIconAssetPng,
    this.playStoreId,
    this.appStoreId,
  });

  final String name;
  final String appIconAssetWebp;
  final String appIconAssetPng;
  final String? playStoreId;
  final String? appStoreId;
}
