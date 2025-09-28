class UserModel {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String college;
  final String bio;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.college,
    required this.bio,
    required this.photoUrl,
  });

  factory UserModel.fromMap(String id, Map<String, dynamic> data) {
    return UserModel(
      id: id,
      name: data['name'] ?? '',
      age: data['age'] ?? 0,
      gender: data['gender'] ?? '',
      college: data['college'] ?? '',
      bio: data['bio'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'college': college,
      'bio': bio,
      'photoUrl': photoUrl,
    };
  }
}
