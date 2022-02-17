import 'dart:convert';

enum UserType { COMUM, SUPER }

class User {
  String? id;
  String name;
  String username;
  String email;
  String? password;
  UserType type = UserType.COMUM;
  DateTime createdAt;
  User({
    this.id,
    required this.name,
    required this.username,
    required this.email,
    this.password,
    required this.createdAt,
    UserType type = UserType.COMUM,
  });

  User copyWith({
    String? id,
    String? name,
    String? username,
    String? email,
    String? password,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, username: $username, email: $email, password: $password, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        createdAt.hashCode;
  }
}
