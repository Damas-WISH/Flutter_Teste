class UserModel {
final String id;
final String email;
final String role;


UserModel({required this.id, required this.email, required this.role});


factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
id: map['id'] ?? '',
email: map['email'] ?? '',
role: map['role'] ?? 'user',
);


Map<String, dynamic> toMap() => {
'id': id,
'email': email,
'role': role,
};
}