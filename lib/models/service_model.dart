class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String icon;
  final String bgImage;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.bgImage,
  });

  factory ServiceModel.fromFirestore(String id, Map<String, dynamic> data) {
    return ServiceModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      icon: data['icon'] ?? '',
      bgImage: data['bg_image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'icon': icon,
      'bg_image': bgImage,
    };
  }
}