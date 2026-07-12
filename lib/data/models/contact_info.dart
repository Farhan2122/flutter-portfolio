/// Contact information model
class ContactInfo {
  final String email;
  final String? linkedInUrl;
  final String? githubUrl;
  final String? twitterUrl;
  final String? websiteUrl;

  ContactInfo({
    required this.email,
    this.linkedInUrl,
    this.githubUrl,
    this.twitterUrl,
    this.websiteUrl,
  }) {
    // Email format validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      throw ArgumentError('Invalid email format');
    }
  }

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      email: json['email'] as String,
      linkedInUrl: json['linkedInUrl'] as String?,
      githubUrl: json['githubUrl'] as String?,
      twitterUrl: json['twitterUrl'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'linkedInUrl': linkedInUrl,
      'githubUrl': githubUrl,
      'twitterUrl': twitterUrl,
      'websiteUrl': websiteUrl,
    };
  }
}
