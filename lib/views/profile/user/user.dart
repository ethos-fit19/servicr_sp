class User {
  String image;
  String name;
  String email;
  String phone;
  String location;
  String other;

  // Constructor
  User({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.other,
  });

  User copy({
    String? imagePath,
    String? name,
    String? phone,
    String? email,
    String? where,
    String? other,
  }) =>
      User(
        image: imagePath ?? this.image,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        location: where ?? this.location,
        other: other ?? this.other,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        image: json['imagePath'],
        name: json['name'],
        email: json['email'],
        location: json['where'],
        phone: json['phone'],
        other: json['other'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': image,
        'name': name,
        'email': email,
        'where': location,
        'phone': phone,
        'other': other,
      };
}
