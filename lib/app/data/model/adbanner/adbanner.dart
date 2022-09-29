// this.imageUrl,
class AdBanners {
  final String image;

  AdBanners({
    required this.image,
  });

  Map<String, dynamic> getJson() => {
        'image': image,
      };
  factory AdBanners.getModelFromJson({required Map<String, dynamic> json}) {
    return AdBanners(
      image: json["image"],
    );
  }
}
