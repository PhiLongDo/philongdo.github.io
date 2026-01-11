import 'package:phi_long_do/models/app_model.dart';

import 'generated/assets.dart';
import 'models/package_model.dart';

const developerName = 'Hirokito';
const myName = 'Đỗ Phi Long';
const emailContact = 'longdo805@gmaill.com';
const githubUrl = 'https://github.com/PhiLongDo';
const playStoreUrl = 'https://play.google.com/store/apps/details';
const appStoreUrl = 'https://apps.apple.com/us/app';
const pubPackageUrl = 'https://pub.dev/packages';

const webKeywords =
    'Flutter, Dart, Phi Long, Do Phi Long, PhiLong, DoPhiLong, PhiLongDo';

final appList = [
  const AppModel(
    name: 'Ninja and Fruits',
    appIconAssetWebp: Assets.webpIcTapTap128,
    appIconAssetPng: Assets.pngIcTapTap128,
    playStoreId: 'com.dplong.fruits_and_ninja',
  ),
  const AppModel(
    name: 'Ghi điểm trò chơi',
    appIconAssetWebp: Assets.webpIcPokerPoint128,
    appIconAssetPng: Assets.pngIcPokerPoint128,
    playStoreId: 'com.dplong.advance.pokerpoint',
  ),
  const AppModel(
    name: 'Trò chơi lật hình',
    appIconAssetWebp: Assets.webpIcFlipGame128,
    appIconAssetPng: Assets.pngIcFlipGame128,
    playStoreId: 'com.dplong.flipgame.neo',
    webDemoPath: 'flip_game',
  ),
];

final packageList = [
  const PackageModel(
    name: 'Year Month Picker',
    pubName: 'year_month_picker',
    webDemoPath: 'year_month_picker',
  ),
];
