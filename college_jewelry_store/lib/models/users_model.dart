
final String tableUsers = 'tableUsers';

class UsersFields {
  static final List<String> values = [
    id, userName, login, email, password
  ];

  static final String id = '_id';
  static final String userName = 'userName';
  static final String login = 'login';
  static final String email = 'email';
  static final String password = 'password';
}

class User {
  int? id;
  String userName;
  String login;
  String email;
  String password;

  User({
    this.id,
    required this.userName,
    required this.login,
    required this.email,
    required this.password
  });

  Map<String, Object?> toJson() => {
    UsersFields.id : id,
    UsersFields.userName : userName,
    UsersFields.login : login,
    UsersFields.email : email,
    UsersFields.password : password
  };

  static User fromJson(Map<String, Object?> json) => User(
    id: json[UsersFields.id] as int?,
    userName: json[UsersFields.userName] as String,
    login: json[UsersFields.login] as String,
    email: json[UsersFields.email] as String,
    password: json[UsersFields.password] as String
  );

  User copy({
    int? id,
    String? userName,
    String? login,
    String? email,
    String? password
  }) => User(
    id: id ?? this.id,
    userName: userName ?? this.userName,
    login: login ?? this.login,
    email: email ?? this.email,
    password: password ?? this.password
  );
}