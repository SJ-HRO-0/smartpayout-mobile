enum UserRole {
  admin,
  operator,
  user,
}

class AppUser {
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String? phone;
  final String? avatarUrl;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.phone,
    this.avatarUrl,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    UserRole? role,
    String? phone,
    String? avatarUrl,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role.name,
      'phone': phone,
      'avatarUrl': avatarUrl,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    final rawRole = (json['role'] as String?)?.trim().toLowerCase();

    return AppUser(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      email: (json['email'] as String?) ?? '',
      role: _mapRole(rawRole),
      phone: json['phone'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );
  }

  static UserRole _mapRole(String? rawRole) {
    switch (rawRole) {
      case 'admin':
        return UserRole.admin;
      case 'operator':
        return UserRole.operator;
      case 'user':
      default:
        return UserRole.user;
    }
  }
}