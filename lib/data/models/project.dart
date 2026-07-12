/// Project data model representing a published application
class Project {
  final String id;
  final String name;
  final String description;
  final List<String> technologies;
  final List<String> imageUrls;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final int displayOrder;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.technologies,
    required this.imageUrls,
    this.playStoreUrl,
    this.appStoreUrl,
    required this.displayOrder,
  }) {
    // Validation
    if (name.isEmpty) {
      throw ArgumentError('Project name cannot be empty');
    }
    if (description.length < 10) {
      throw ArgumentError('Project description must be at least 10 characters');
    }
    if (playStoreUrl == null && appStoreUrl == null) {
      throw ArgumentError('At least one store URL must be provided');
    }
    if (technologies.isEmpty) {
      throw ArgumentError('Technologies list cannot be empty');
    }
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrls: (json['imageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      playStoreUrl: json['playStoreUrl'] as String?,
      appStoreUrl: json['appStoreUrl'] as String?,
      displayOrder: json['displayOrder'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'technologies': technologies,
      'imageUrls': imageUrls,
      'playStoreUrl': playStoreUrl,
      'appStoreUrl': appStoreUrl,
      'displayOrder': displayOrder,
    };
  }
}
