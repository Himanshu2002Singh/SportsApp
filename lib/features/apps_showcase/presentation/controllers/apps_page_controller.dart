import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/url_helper.dart';
import '../../data/models/app_item_model.dart';
import '../../data/models/feature_highlight.dart';
import '../../data/models/store_badge_model.dart';
import '../../data/repositories/apps_repository.dart';

/// Presentation controller managing state, selections, and user interactions
class AppsPageController extends ChangeNotifier {
  final AppsRepository repository;

  AppsPageController({this.repository = const AppsRepository()}) {
    _init();
  }

  late List<StoreBadgeModel> storeBadges;
  late List<AppItemModel> ecosystemApps;
  late List<FeatureHighlight> featureHighlights;

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  String _selectedAppId = 'cricheroes_flagship';
  String get selectedAppId => _selectedAppId;

  bool _isDownloading = false;
  bool get isDownloading => _isDownloading;

  void _init() {
    storeBadges = repository.getStoreBadges();
    ecosystemApps = repository.getEcosystemApps();
    featureHighlights = repository.getFeatureHighlights();
  }

  void selectTab(int index) {
    if (_selectedTabIndex != index) {
      _selectedTabIndex = index;
      notifyListeners();
    }
  }

  void selectApp(String appId) {
    if (_selectedAppId != appId) {
      _selectedAppId = appId;
      notifyListeners();
    }
  }

  AppItemModel get currentSelectedApp {
    return ecosystemApps.firstWhere(
      (app) => app.id == _selectedAppId,
      orElse: () => ecosystemApps.first,
    );
  }

  Future<void> onStoreBadgeTap(BuildContext context, StoreBadgeModel badge) async {
    _isDownloading = true;
    notifyListeners();

    await UrlHelper.launch(badge.url, context: context);

    _isDownloading = false;
    notifyListeners();
  }

  Future<void> openPlayStore(BuildContext context) async {
    await UrlHelper.launch(AppStrings.playStoreUrl, context: context);
  }

  Future<void> openAppStore(BuildContext context) async {
    await UrlHelper.launch(AppStrings.appStoreUrl, context: context);
  }
}
