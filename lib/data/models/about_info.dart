/// About section data model
class AboutInfo {
  final String name;
  final String title;
  final String bio;
  final String summary;
  final String? profileImageUrl;

  AboutInfo({
    required this.name,
    required this.title,
    required this.bio,
    required this.summary,
    this.profileImageUrl,
  }) {
    // Validation
    if (name.isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }
    if (bio.length < 50) {
      throw ArgumentError('Bio must be at least 50 characters');
    }
    if (summary.isEmpty) {
      throw ArgumentError('Summary cannot be empty');
    }
  }

  factory AboutInfo.fromJson(Map<String, dynamic> json) {
    return AboutInfo(
      name: json['name'] as String,
      title: json['title'] as String,
      bio: json['bio'] as String,
      summary: json['summary'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'bio': bio,
      'summary': summary,
      'profileImageUrl': profileImageUrl,
    };
  }
}
