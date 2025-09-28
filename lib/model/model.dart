class UserResponse {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<Datum> data;
  final Support support;

  UserResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  // Factory constructor to create object from JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: (json['data'] as List).map((e) => Datum.fromJson(e)).toList(),
      support: Support.fromJson(json['support']),
    );
  }

  // Convert Dart object to JSON
  Map<String, dynamic> toJson() {
    return {
      "page": page,
      "per_page": perPage,
      "total": total,
      "total_pages": totalPages,
      "data": data.map((e) => e.toJson()).toList(),
      "support": support.toJson(),
    };
  }
}

class Datum {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "avatar": avatar,
    };
  }
}

class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "url": url,
      "text": text,
    };
  }
}
