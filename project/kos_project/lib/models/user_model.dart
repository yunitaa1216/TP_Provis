class User {
  final String name;
  final String id;
  final String no_hp;
  final String nama_kos;

  const User({
    required this.name,
    required this.id,
    required this.no_hp,
    required this.nama_kos
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      id: json['id'] as String,
      no_hp: json['no_hp'] as String,
      nama_kos: json['nama_kos'] as String
    );
  }
}