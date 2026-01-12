class PackageModel {
  const PackageModel({
    required this.name,
    required this.pubName,
    this.webDemoPath,
  });

  final String name;
  final String pubName;
  final String? webDemoPath;
}
