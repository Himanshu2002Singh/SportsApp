/// Model representing store badge item (Google Play, App Store)
class StoreBadgeModel {
  final String type;
  final String logoAsset;
  final String remoteLogoUrl;
  final String ratingImgAsset;
  final String remoteRatingImgUrl;
  final String rating;
  final String downloads;
  final String url;
  final bool isEditorsChoice;

  const StoreBadgeModel({
    required this.type,
    required this.logoAsset,
    required this.remoteLogoUrl,
    required this.ratingImgAsset,
    required this.remoteRatingImgUrl,
    required this.rating,
    required this.downloads,
    required this.url,
    this.isEditorsChoice = false,
  });
}
