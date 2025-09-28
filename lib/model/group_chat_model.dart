class GroupChatModel {
  final String id;
  final String name;
  final String description;
  final List<String> members;

  GroupChatModel({
    required this.id,
    required this.name,
    required this.description,
    required this.members,
  });

  factory GroupChatModel.fromMap(String id, Map<String, dynamic> data) {
    return GroupChatModel(
      id: id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      members: List<String>.from(data['members'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'members': members,
    };
  }
}
