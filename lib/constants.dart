import 'package:phi_long_do/models/app_model.dart';

import 'generated/assets.dart';

const developerName = 'Hirokito';
const myName = 'Đỗ Phi Long';
const emailContact = 'longdo805@gmaill.com';
const githubUrl = 'https://github.com/PhiLongDo';
const playStoreUrl = 'https://play.google.com/store/apps/details';
const appStoreUrl = 'https://apps.apple.com/us/app';

const webKeywords =
    'Flutter, Dart, Phi Long, Do Phi Long, PhiLong, DoPhiLong, PhiLongDo';

final appList = [
  AppModel(
    name: 'Ninja and Fruits',
    appIconAssetWebp: Assets.webpIcTapTap128,
    appIconAssetPng: Assets.pngIcTapTap128,
    playStoreId: 'com.dplong.fruits_and_ninja',
  ),
  AppModel(
    name: 'Ghi điểm trò chơi',
    appIconAssetWebp: Assets.webpIcPokerPoint128,
    appIconAssetPng: Assets.pngIcPokerPoint128,
    playStoreId: 'com.dplong.advance.pokerpoint',
  ),
  AppModel(
    name: 'Trò chơi lật hình',
    appIconAssetWebp: Assets.webpIcFlipGame128,
    appIconAssetPng: Assets.pngIcFlipGame128,
    playStoreId: 'com.dplong.flipgame.neo',
  ),
];
