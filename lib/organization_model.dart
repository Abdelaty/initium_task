class OrganizationModel {
  final String id;
  final String title;
  final String thumbnailUrl;

  OrganizationModel({this.id, this.title, this.thumbnailUrl});

  factory OrganizationModel.fromJson(Map<String, dynamic> json) {
    return OrganizationModel(
        title: json['EntityEnglishName'] as String,
        thumbnailUrl: json['EntityLogo'] as String,
        id: json['EntityID'] as String);
  }
}
